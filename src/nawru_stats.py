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

def vintage_compare(data, projpath, vintage_name, nawru_data, prev_vintage, model_list, changey, config):
    from src import get_sol_elem
    import numpy as np
    import pmdarima as pm
    import statsmodels.api as sm
    import pandas as pd
    data.iloc[:, 1:3] = data.iloc[:, 2:4].to_numpy()
    data.iloc[:, 5:7] = data.iloc[:, 6:8].to_numpy()
    data.iloc[:,8:] = np.nan
    ones = pd.Series(1., index=range(1960, changey + 7))
    model_list = model_list.dropna()
    for country in model_list.index:
        modelversion = model_list.loc[country]
        if not config['NAWRU_' + country]['method'] == 'HP':
            sol_file = projpath + vintage_name + '/' + country.upper() + '_NAWRU_' + vintage_name + '_' + modelversion + '.sol'
            data.loc[country, 3] = get_sol_elem.get_sol_elem(sol_file, "Beta - lag 0:", [2])[0]
            data.loc[country][7] = get_sol_elem.get_sol_elem(sol_file, "R-squared (fitted values)                  =", [0])[0]
        else:
            data.loc[country,1:4] = np.nan
            data.loc[country, 5:8] = np.nan

        lur = nawru_data.loc[changey-2:changey, country + '_UnEmpl_Rate']
        prev_lur = prev_vintage.loc[changey-2:changey, country + '_UnEmpl_Rate']
        nawru = nawru_data.loc[changey - 2:changey, country + '_NAWRU']
        prev_nawru = prev_vintage.loc[changey - 2:changey,country + '_NAWRU']
        ugap = lur - nawru
        prev_ugap = prev_lur - prev_nawru
        startar = nawru_data[country + '_UnEmpl_Rate'].first_valid_index()
        lurhp = nawru_data.loc[startar:changey, country + '_UnEmpl_Rate'] * ones
        model = pm.auto_arima(lurhp.loc[startar:changey], start_p=1, start_q=0, max_p=4, max_q=0, seasonal=False, stepwise=False, trace=True, with_intercept=False)
        model_fit = model.fit(lurhp.loc[startar:changey])
        forecast = model_fit.predict(6)
        lurhp.loc[str(changey + 1):str(changey + 6)] =  forecast
        cycle, lurhp = sm.tsa.filters.hpfilter(lurhp.loc[startar:changey+6], 10)

        lurhp[changey + 1] = lurhp[changey] + .5 * (lurhp[changey] - lurhp[changey - 1])
        lurhp.loc[changey + 2:] = lurhp[changey + 1]
        data.loc[country, 9:11] = ugap.to_numpy()
        data.loc[country, 13:15] = (ugap.loc[changey-2:changey] - prev_ugap.loc[changey-2:changey]).to_numpy()
        data.loc[country, 16:18] = lur.to_numpy()
        data.loc[country, 20:22] = (lur.loc[changey-2:changey] - prev_lur.loc[changey-2:changey]).to_numpy()
        data.loc[country, 24:26] = nawru.to_numpy()
        data.loc[country, 28:30] = (nawru.loc[changey-2:changey] - prev_nawru.loc[changey-2:changey]).to_numpy()
        data.loc[country, 32:34] = lurhp.loc[changey - 2:changey].to_numpy()

    return data