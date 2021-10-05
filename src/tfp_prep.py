"""
Copyright 2019,2020 European Union

Licensed under the EUPL, Version 1.2 or – as soon they will be approved by the European Commission –
subsequent versions of the EUPL (the "Licence");
You may not use this work except in compliance with the Licence.
You may obtain a copy of the Licence at:
http://ec.europa.eu/idabc/eupl

Unless required by applicable law or agreed to in writing, software distributed under the Licence is distributed on
an "AS IS" basis, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the Licence for the specific language governing permissions and limitations under the Licence.

Author: François Blondeau (European Commisssion, Directorate-General for Economic and Financial Affairs)

"""


def tfp_prep(country, ameco, cubs, config, changey, endy, olslog):
    import numpy as np
    import pandas as pd
    import statsmodels.api as sm
    from src import ols_ar
    from statsmodels.tsa.arima.model import ARIMA
    alpha = .65
    data = pd.DataFrame(index=range(1960, changey + 11))
    ones = pd.Series(1., index=range(1960, changey + 11))
    #    GDP (y)
    # -----------
    data['y'] = ameco[country + '_gdpq']
    wy = data['y'].pct_change() * 100

    # LABOUR (totalh)
    # -----------
    # hours worked
    data['hpere'] = ameco[country + '_hpere']
    data['l'] = ameco[country + '_sled']

    data['totalh'] = data['hpere'] * data['l']
    data['wtotalh'] = data['totalh'].pct_change()
    # LUR is needed even if NAWRU is provided exogenously so they are defined here
    data['LUR'] = ameco[country + '_lur']

    # CAPITAL (k)
    # -----------
    # some country specificities here
    data['k'] = ameco[country + '_kt']
    data['iq'] = ameco[country + '_iq']
    data['iy'] = data['iq'] / data['y']

    
    # *I* for Ireland there has been a re-valuation of the capital stock to include aircraft leasing.
    # *I* this is not yet visible in the ameco capital stock series, and therefore we make an adjustment here.
    # *I* on 29/9/2016 it is believed that capital stock goes up by 53.7% in 2015 and remains at this higher level from then on.
    # *I* as on Autumn 2018 another modification to this procedure was made, based on country specificity for Ireland

    # DEP is needed for IE and LV to compute K (needed for TFP calculation)

    if country == 'ie':
        # calculate some additional variables
        k_ori = data['k'].copy()
        k_difference = data['k'].diff()  # = iq - cfc
        dep_ori = (data['iq'] - (data['k'] - data['k'].shift(1))) / data['k'].shift(1)
        dep_difference = dep_ori - dep_ori.shift(1)
        outturny = dep_difference.where(abs(dep_difference) < 0.00000001) * 0
        outturnyear = outturny.idxmin()
        with open(olslog, 'a', encoding='utf-8') as f:
            f.write('\n\n\n'+country.upper()+' - - -OUTTURN YEAR FOR K (should be t-1) : '+ str(outturnyear)+'\n')
        # *** remark: outturn year is most of the time equal to t-1
        #NOTE FOR AF2019, the way to find the outturn year does not function
        # it is set manually to 2018
        #outturnyear = 2018
    
        # * actual adjustment:
        # * cso estimate of the increase in the K stock for 2015
        data.loc[2015, 'k'] = 1.532 * data.loc[2014, 'k']
        # * after 2015, until the outturn year, the iq and cfc series are correct, they relate to the new capital stock
        for i in range(2016, outturnyear + 1):
            data.loc[i, 'k'] = data.loc[i - 1, 'k'] + k_difference[i]
        # * when there is no info on cfc, a constant dep rate is assumed for these years
        data['dep'] = (data['iq'] - (data['k'] - data['k'].shift(1))) / data['k'].shift(1)
        for i in range(outturnyear, changey + 1):
            data.loc[i, 'dep'] = data.loc[i - 1, 'dep']
        for i in range(outturnyear, changey + 1):
            data.loc[i, 'k'] = data.loc[i, 'iq'] + (1 - data.loc[i, 'dep']) * data.loc[i - 1, 'k']
    
    elif country == 'lv':
        #
        #	*I* depreciation rate is calculated based on investment and capital information
        #	*I* and then kept constant from the forecast starting
        #
            ee_iq = ameco['ee_iq'] * ones
            ee_kt = ameco['ee_kt'] * ones
            dep_ee = (ee_iq - (ee_kt - ee_kt.shift(1))) / ee_kt.shift(1)
            dep_ee.loc[changey:endy] = dep_ee[changey - 1]
    
            lt_iq = ameco['lt_iq'] * ones
            lt_kt = ameco['lt_kt'] * ones
            dep_lt = (lt_iq - (lt_kt - lt_kt.shift(1))) / lt_kt.shift(1)
            dep_lt.loc[changey:endy] = dep_lt[changey - 1]

            data['dep'] = (dep_ee + dep_lt) / 2  # average dep of LT and EE
    
            k_ori = data['k'].copy()
            for i in range(1996, endy + 1):
                data.loc[i, 'k'] = data.loc[i - 1, 'k'] * (1 - data.loc[i, 'dep']) + data.loc[i, 'iq']

    else:
        data['dep'] = (data['iq'] - (data['k'] - data['k'].shift(1))) / data['k'].shift(1)
    data.loc[changey+1:endy, 'dep'] = data.loc[changey, 'dep']

    # PRODUCTIVITY (solow residual)
    # -----------

    data['SR'] = np.log(data['y'] / (data['totalh'] ** alpha * data['k'] ** (1 - alpha)))
    
    # FORECAST EXOGENEOUS
    # Trend TFP (srkf)
    # -----------
    wsr = data['SR'].diff()

    maorder = int(config['hp_tfp_' + country]['MAorder'])
    p = int(config['hp_tfp_' + country]['ARorder'])
    d = 0
    ar_start = int(config['hp_tfp_' + country]['ARstartingyear'])
    if bool(config['hp_tfp_' + country]['Constant']):
        const = 'c'
    else:
        const = 'n'

    if maorder > 0:
        # ARIMA requests that index is "datetime tagged"
        wsr.index = pd.to_datetime(wsr.index, format='%Y', exact=True)
        wsr = wsr.asfreq('AS-JAN')
        model = ARIMA(wsr.loc[str(ar_start):str(changey)], order=(p, d, maorder), freq='AS-JAN', trend=const)
        model_fit = model.fit()
        with open(olslog, 'a', encoding='utf-8') as f:
            f.write('\n\n\n - - -TFPg ARMA\n' + str(model_fit.summary()))
        forecast = model_fit.predict(start=str(changey + 1), end=str(endy))
        wsr.loc[str(changey + 1):str(endy)] = forecast.loc[str(changey + 1):str(endy)]
        data['wsr'] = wsr.values * ones
    else:
        with open(olslog, 'a', encoding='utf-8') as f:
            f.write('\n\n\n'+country.upper()+' - - -TFPg OLS_AR\n')
        data['wsr'] = ols_ar.ols_ar(wsr, p, const, ar_start, changey, endy-changey, olslog)

    for i in range(data['SR'].first_valid_index(), endy):
        data.loc[i + 1, 'SR'] = data.loc[i, 'SR'] + data.loc[i + 1, 'wsr']
    
    # filter the forecasted series
    # extended series on actual TFP (old method)
    # = tfp_forecast(sr,index of last year of forecast,number of forecast years)
    # use of the ARMA function defined (series, nblag, const, ar_start, changey, nb_fcst)
    #
    # NOTE THAT IN RATS PROG, WSR is extended and then SR is rebuild from it
    # for this exercise we use the KF SR directly

# TODO hard coded for test must come from config
    starthp = int(config['hp_tfp_' + country]['HPstartingyear'])
    
    # filter the forecasted series
    cycle, data['srhp'] = sm.tsa.filters.hpfilter(data.loc[starthp:endy,'SR'], int(config['hp_tfp_' + country]['Lambda']))
    data['wsrhp'] = data['srhp'].diff()

    # we need extended SR only for HP we can now remove data for SR after t+2 (2021/03/09)
    data.loc[changey+1:,'SR'] = np.nan

    try:data['CU'] = cubs['CUBS_ST_' + country.upper()]
    except: data['CU'] = np.nan

# cut in case a dummy is set longer than changey + 10
    data = data.loc[1960:changey + 10]
    return data
