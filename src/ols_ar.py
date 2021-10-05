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

# Subroutine written to estimate AR using OLS (as in WinRATS code) instead of the default Python ML


def ols_ar(series, nblag, const, ar_start, changey, nb_fcst, olslog, time=False):
    import statsmodels.api as sm
    import pandas as pd
    import numpy as np
    endog = series.loc[ar_start:changey]
    if nblag > 0:
        serieslagged = series.shift(1)
        exog = pd.DataFrame(serieslagged.loc[ar_start:changey].rename('lag1'))
        for lag in range (2, nblag+1):
            serieslagged=series.shift(lag)
            exog['lag'+str(lag)] = serieslagged.loc[ar_start:changey]
        if const:
            exog = sm.add_constant(exog)
        if time:
            exog['time'] = pd.Series(series.index[ar_start-1960:changey-1959], index=exog.index)
    else:
        exog=pd.DataFrame(index=range(ar_start,changey+1))
        exog['const'] = np.ones(changey+1-ar_start)
    model = sm.OLS(endog, exog, missing='drop')
    res = model.fit()
    with open(olslog, 'a', encoding='utf-8') as f:
        f.write(str(res.summary()))
    for i in range(1, nb_fcst + 1):
        if const:
            newexog = pd.DataFrame([1.], columns=['const'])
            for lag in range (1, nblag+1):
                newexog['lag'+str(lag)] = series[changey-lag+i]
        else:
            newexog = pd.DataFrame([series[changey-1+i]], columns=['lag1'])
            for lag in range (2, nblag+1):
                newexog['lag'+str(lag)] = series[changey-lag+i]
        if time:
            newexog['time'] = pd.Series(series.index[changey-1960+i], index=newexog.index)
        series.loc[changey+i] = res.predict(newexog).iloc[0]
    return series.loc[:changey+nb_fcst]