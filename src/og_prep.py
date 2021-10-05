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

def og_prep(country, ameco, data, popproj, config, changey, yf, olslog_path):
    import pandas as pd
    import numpy as np
    from src import ols_ar
    from src import closure
    import statsmodels.api as sm
    import pmdarima as pm
    from statsmodels.tsa.holtwinters import ExponentialSmoothing
    ones = pd.Series(1., index=range(1960, changey + 11))
    ratio_cb = pd.Series(np.nan, index=range(1960, changey + 11))
    #TODO there is no alpha, clos_nb_y in the config file so we hard code it
    alpha = .65
    clos_nb_y = 3

    # CALCULATE ACTUAL VARIABLES

    # LABOUR (totalh)
    # -----------
    # unemployment
    # create alias of LUR and NAWRU to ease the use of indices
    lurharm = data['LUR']
    dlur = lurharm.diff()
    nawru = data['NAWRU']

    # wages
    w = ameco[country + '_hwcdw']
    gw = w.pct_change() * 100
    data['nwinf'] = gw.diff()

    if country == 'lu':
        l_lux = ameco[
                    country + '_sle1'] * ones  # employment series. NB: National accounts national concept for all countries
        l_cb = data['l'] - l_lux
        ratio_cb = l_cb / data['l']  # ratio of cross-border workers
        lf = l_lux / (1 - lurharm / 100)
    else:
        lf = data['l'] / (1 - lurharm / 100)

    lu = lurharm * lf

    # population of working age
    popw = ameco[country + '_popa1']
    popt = ameco[country + '_popt']

    # participation rate
    part = 100 * lf / popw

    # Extended population at working age (popw) using projections from Eurostat
    # -----------
    popwf = popproj[country.upper() + '_POPAF']
    poptf = popproj[country.upper() + '_POPTF']

    if country == 'us':
        mpopf = popwf / popwf.shift(1)
        mpoptf = poptf / poptf.shift(1)
    else:
        mpopf = (popwf.shift(-1) + popwf) / (popwf + popwf.shift(1))
        mpoptf = (poptf.shift(-1) + poptf) / (poptf + poptf.shift(1))

    for i in range(1, 7):
        popw[changey + i] = popw[changey + i - 1] * mpopf[changey + i]
        popt[changey + i] = popt[changey + i - 1] * mpoptf[changey + i]

#    wpopw = popw.pct_change()
#    wpopt = popt.pct_change()

    # Trend Participation Rate (parts)
    # -----------

    # extended series on part
    #	possible adjustment to population and participation rates
    part_pop_adj = True
    try:
        partM = ameco[country + '_part2'] * 100 * ones
    except:
        part_pop_adj = False

    if part_pop_adj:
        for i in range(changey + 4, changey + yf + 1):
            partM[i] = partM[i - 1] + 0.5 * (partM[i - 1] - partM[i - 2]) + 0.5 * (partM[i - 2] - partM[i - 3])

        partsM = partM.copy()  # trend adj participation rate = actual rate

        # population at working age non-adj and adj
        popwM = ameco[country + '_popa2'] / 1000 * ones  # adj population at working age
        # assume that after t+5 no new migrants arrive (!)
        #  and that all of them stay in the 'migrant' group for several years
        popwM.loc[changey + 4:] = popwM[changey + 3]

        # labour force of migrants and non-migrants
        lfM = pd.Series(np.zeros(changey + yf - 1959), index=range(1960, changey + yf + 1))  # migrant labour force
        lfM.loc[2015:] = popwM.loc[2015:] * partM.loc[2015:] / 100
        # LFnonM = lf - lfM  # non-migrant labour force

        partnonM = part.copy()  # non-migrant participation rate
        popwnonM = popw - popwM  # non-migrant population at working age
        # partnonM.loc[2015:changey] = LFnonM.loc[2015:changey] / popwnonM.loc[2015:changey] * 100  # ???

    nblag = int(config['hp_partecipationrate_' + country]['ARorder'])
    const = bool(int(config['hp_partecipationrate_' + country]['Constant']))
    ar_start = int(config['hp_partecipationrate_' + country]['ARstartingyear'])
    lambd = int(config['hp_partecipationrate_' + country]['lambda'])
    starthp = int(config['hp_partecipationrate_' + country]['HPstartingyear'])
    time = bool(int(config['hp_partecipationrate_' + country]['Lineartimetrend']))
    # We have to deal with shorter series for PART for CY 1997 and HR 2001
    if part.first_valid_index() > starthp:
        starthp = part.first_valid_index()

    with open(olslog_path, 'a', encoding='utf-8') as f:
        f.write('\n\n\n'+country.upper()+' - - -PART OLS_AR\n')
    part = ols_ar.ols_ar(part, nblag, const, ar_start, changey, yf, olslog_path, time)

    # filter the forecasted series
    if part_pop_adj:
        # calculate the non migrant participation rate as a part of total actual participation rate
        partnonM.loc[2015:] = part.loc[2015:] * popw.loc[2015:] / (popw.loc[2015:] - popwM.loc[2015:]) - partM.loc[
                                                                                                         2015:] * popwM.loc[
                                                                                                                  2015:] / (
                                          popw.loc[2015:] - popwM.loc[2015:])
        cycle, partsnonM = sm.tsa.filters.hpfilter(partnonM.loc[starthp:changey + yf], lambd)
        partsnonM = partsnonM * ones
        parts = partsnonM.copy()
        parts.loc[2015:] = partsnonM.loc[2015:] * (popwnonM.loc[2015:] / popw.loc[2015:]) + partsM.loc[2015:] * (
                    popwM.loc[2015:] / popw.loc[2015:])
    else:
        # ISSUE WITH CY HP FILTER START IN 1997 and do not provide values for 1995 ->
        cycle, parts = sm.tsa.filters.hpfilter(part.loc[starthp:changey + yf],lambd)
        parts = parts * ones

    # connect the hp and k filtered series to make it start in 1960
    # because SRKF starts in 1980
    for i in range(1, 21):
        data.loc[1980 - i, 'SRKF'] = data.loc[1980 - i + 1, 'SRKF'] - data.loc[1980 - i + 1, 'wsrhp']

    data['wsrkf'] = data['SRKF'].diff()

    # Extended NAWRU (nawru)
    # -----------

    # NAWRU: **** NEW end rule Spring 2014:
    # ----------
    # *I* in the t+5 framework (yf<4) we use an extension rule; "end rule"
    # *I* in t+10 the nawru series is complete and long in the dataset

    nawru.loc[changey + 1:changey + yf] = nawru[changey] + 0.5 * (nawru[changey] - nawru[changey - 1])

    dnawru = nawru.diff()

    # Trend Hours worked per Employee (hperehp)
    # -----------
    # extended series on hours worked
    # = ar(series, nblag, const, ar_start, changey, nb_fcst)
    nblag = int(config['hp_hoursworked_' + country]['ARorder'])
    const = bool(int(config['hp_hoursworked_' + country]['Constant']))
    ar_start = int(config['hp_hoursworked_' + country]['ARstartingyear'])
    lambd = int(config['hp_hoursworked_' + country]['lambda'])
    # SPRING 2020 : Temporary change to the trend hours worked as described in the note of 27/04/2020 to the OGWG
    # two next lines are added to create a copy of the hours series to be modified and
    # then detrended instead of original hours worked series
    data['hperemod'] = data['hpere'].copy()
    data.loc[2020, 'hperemod'] = (data.loc[ 2019, 'hperemod'] + data.loc[ 2021, 'hperemod'])/2

    starthp = int(config['hp_hoursworked_' + country]['HPstartingyear'])

    with open(olslog_path, 'a', encoding='utf-8') as f:
        f.write('\n\n\n'+country.upper()+' - - -HPERE OLS_AR\n')
    # temporary change for 2020 spring and autumn vintage, 'hpere' is substituted to 'hperemod'
    if '2020' in config['sourcefiles']['name_current_vintage'] or '2021' in config['sourcefiles']['name_current_vintage']:
        data['hperemod'] = ols_ar.ols_ar(data['hperemod'], nblag, const, ar_start, changey, yf, olslog_path)
        # filter the forecasted series
        cycle, hperehp = sm.tsa.filters.hpfilter(data.loc[starthp:changey + yf, 'hperemod'], lambd)
    else:
        data['hpere'] = ols_ar.ols_ar(data['hpere'], nblag, const, ar_start, changey, yf, olslog_path)
        # filter the forecasted series
        cycle, hperehp = sm.tsa.filters.hpfilter(data.loc[starthp:changey + yf, 'hpere'], lambd)
    # End of temporary change to the trend hours worked
    hperehp = hperehp * ones

    dhpere = data['hpere'].diff()
    whperehp = hperehp.pct_change() * 100
    lfss = parts / 100 * popw

    # CROSS-BORDER WORKERS
    # ------------
    # in the case of LU we need to add cross-border workers
    if country == 'lu':
        # find the best ARIMA proces to explain the cross border worker ratio in the past
        # use this best proces to forecast the series
        # filter this long series to get the trend
        nblag = 2
        const = False
        ar_start = 1978
        with open(olslog_path, 'a', encoding='utf-8') as f:
            f.write('\n\n\n'+country.upper()+' - - -RATIO CB OLS_AR\n')
        ratio_cb = ols_ar.ols_ar(ratio_cb, nblag, const, ar_start, changey, yf, olslog_path)
        cycle, ratio_cb_hp = sm.tsa.filters.hpfilter(ratio_cb.loc[starthp:changey + yf], 10)
        # extend the related series
        l_lux = part / 100 * popw * (1 - lurharm / 100)
        l_cb = l_lux * ratio_cb / (1 - ratio_cb)
        data['l'] = l_lux + l_cb
        data['totalh'] = data['hpere'] * data['l']
    # Trend labour (totalhs)
    # -----------
        l_luxs = parts / 100 * popw * (1 - nawru / 100)
        l_cb_hp = l_luxs * ratio_cb_hp / (1 - ratio_cb_hp)
#        lfss = parts / 100 * popw  # trend labour force, only includes luxembourgish!
        lp2 = l_luxs + l_cb_hp  # trend employment
    else:
        data['lf'] = data['l'] / (1 - lurharm / 100)
        lp2 = lfss * (1 - nawru / 100)

    wlp2 = lp2.pct_change()
    # trend total hours worked
    totalhs = lp2 * hperehp
    wtotalhs = totalhs.pct_change()

    # create a totalhs specific for the t+10

    # Investment rule (IYPOT)
    # -----------------------

    srkf_level = np.exp(data['SRKF'])
    ypot = totalhs ** alpha * data['k'] ** (1 - alpha) * srkf_level
    # ypot = ypot * ones
    iypot = 100 * (data['iq'] / ypot)
    iypot = iypot * ones

    # NOTE : THERE IS A COUNTRY SPECIFICITY FOR DE FOR T+10

    nblag = int(config['hp_investmenttopotential_' + country]['ARorder'])
    const = bool(int(config['hp_investmenttopotential_' + country]['Constant']))
    ar_start = int(config['hp_investmenttopotential_' + country]['ARstartingyear'])

    with open(olslog_path, 'a', encoding='utf-8') as f:
        f.write('\n\n\n'+country.upper()+' - - -IYPOT OLS_AR\n')
    iypot = ols_ar.ols_ar(iypot, nblag, const, ar_start, changey, yf, olslog_path)

    # GAP closure rule (ygap)
    # -----------
    ygap = 100 * (data['y'] / ypot - 1)

    # TODO
    ygap = closure.closure(ygap, clos_nb_y, changey)

    # other GAP closure rules (totalh_mt)
    # -----------

    # create the medium term actual series
    part_mt = part.copy()
    hpere_mt = data['hpere'].copy()
    l_mt = data['l'].copy()

    totalh_mt = data['totalh'].copy()
    lurharm_mt = lurharm * ones
    # create the gap series
    partgap = part - parts
    hperegap = data['hpere'] - hperehp
    lurgap = lurharm - nawru

    # close each gap (by the end of the period = 6)
    partgap = closure.closure(partgap, clos_nb_y, changey)
    hperegap = closure.closure(hperegap, clos_nb_y, changey)
    lurgap = closure.closure(lurgap, clos_nb_y, changey)

    # fill in the medium term actual series
    part_mt.loc[changey + 1:changey + yf] = parts.loc[changey + 1:changey + yf] + partgap.loc[changey + 1:changey + yf]
    hpere_mt.loc[changey + 1:changey + yf] = hperehp.loc[changey + 1:changey + yf] + hperegap.loc[changey + 1:changey + yf]
    lurharm_mt.loc[changey + 1:changey + yf] = nawru.loc[changey + 1:changey + yf] + lurgap.loc[changey + 1:changey + yf]

    if country == 'lu':
        lcbgap = ones * 0.
        for i in range(1, clos_nb_y + 1):
            lcbgap[changey + i] = (clos_nb_y - i) / clos_nb_y * (l_cb[changey] - l_cb_hp[changey])
        lcbgap.loc[changey + clos_nb_y + 1:lcbgap.size + 1959] = 0.

        l_lux_mt = l_lux
        l_lux_mt.loc[changey + 1:changey + yf] = popw.loc[changey + 1:changey + yf] * part_mt.loc [changey + 1:changey + yf] / 100 * (
                    1 - lurharm_mt.loc[changey + 1:changey + yf] / 100)

        l_cb_mt = l_cb
        l_cb_mt.loc[changey + 1:changey + yf] = l_cb_hp.loc[changey + 1:changey + yf] - lcbgap.loc[changey + 1:changey + yf]

        l_mt.loc[changey + 1:changey + yf] = l_lux_mt.loc[changey + 1:changey + yf] + l_cb_mt.loc[changey + 1:changey + yf]

    else:
        l_mt.loc[changey + 1:changey + yf] = popw.loc[changey + 1:changey + yf] * part_mt.loc[changey + 1:changey + yf] / 100 * (
                    1 - lurharm_mt.loc[changey + 1:changey + yf] / 100)


    totalh_mt.loc[changey + 1:changey + yf] = l_mt.loc[changey + 1:changey + yf] * hpere_mt.loc[changey + 1:changey + yf]


#    *--------------------------
#    *4.     TREND (HP) GDP
#    *= == == == == == == == == == == == == == =
    # we want to use YHP for t+10 so we extend the forecast horizon (2021/05/10)
    yf = 11
    yext = pd.Series(index=range(1960,changey + yf + 1))
    yext.loc[1960:changey] = data.loc[1960:changey, 'y']
    ar_start_gdp  = {'at':1960,'be':1960,'de':1960,'dk':1960,'el':1960,'es':1960,'fr':1960,'ie':1960,'it':1960,'lu':1960,'nl':1960,'pt':1960,'fi':1960,'se':1960,'uk':1960,'cz':1996,'ee':1996,'hu':1996,'lv':1996,'lt':1996,'pl':1996,'sk':1996,'si':1996,'cy':1996,'mt':1996,'bg':1996,'ro':1996,'hr':1996,'us':1960}
    #ar_start = ar_start_gdp[country]
    ar_start = max(ar_start_gdp[country], yext.first_valid_index())
    if country in (['at', 'be', 'de', 'dk', 'el', 'es', 'fr', 'ie', 'it', 'lu', 'nl', 'pt', 'fi', 'se', 'uk', 'us']):
        model = pm.auto_arima(yext.loc[str(ar_start):str(changey)], max_order=4, seasonal=False, stepwise=False,
                              trace=False, information_criterion='aic', method='bfgs')

        with open(olslog_path, 'a', encoding='utf-8') as f:
            f.write('\n\n\n'+country.upper()+' - - -Y Trend using ARIMA\n' + str(model.summary()))
        model_fit = model.fit(yext.loc[str(ar_start):str(changey)])

        forecast = model_fit.predict(yf)
        yext.loc[str(changey + 1):] = forecast

    else:
        model = ExponentialSmoothing(yext.loc[ar_start:changey], trend='add', initialization_method='estimated')
        with open(olslog_path, 'a', encoding='utf-8') as f:
            f.write('\n\n\n'+country.upper()+' - - -Y Trend using Exponential smoothing\n')
        fitted = model.fit()
        yext.loc[changey + 1:changey + yf] = fitted.forecast(yf).values

    data['yext'] = yext.loc[1960:changey + min(yf,10)]
    # TODO we have to find a HP start in config in the mean time we use first valid index
    lambd = 100
    startgdphp = max(1965, data['yext'].first_valid_index())
    cycle, yhp = sm.tsa.filters.hpfilter(np.log(yext.loc[startgdphp:changey + yf]),lambd)
    data['yhp'] = np.exp(yhp.loc[1960:changey+min(yf,10)])
    data['ygaphp'] = 100 * (data['yext'] / data['yhp'] - 1)

    data = pd.concat([data, ygap.rename('ygap'), ypot.rename('ypot'), part_mt.rename('part_mt'), parts.rename('parts'),
                      lurharm_mt.rename('lurharm_mt'), hpere_mt.rename('hpere_mt'), lfss.rename('lfss'),
                      lp2.rename('lp2'), totalhs.rename('totalhs'), l_mt.rename('l_mt'), totalh_mt.rename('totalh_mt'),
                      popw.rename('popw'), popt.rename('popt'), iypot.rename('iypot'), hperehp.rename('hperehp'),
                      whperehp.rename('whperehp')], axis=1)
    return data
