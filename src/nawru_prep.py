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


def nawru_prep(country, ameco, config, changey):
    import pandas as pd
    data = pd.DataFrame(index=range(1960, changey + 11))
    #        Correspondence between nawrudata Excel file and ameco file
    #
    #        B: at_lur (=LUR)
    #        C: DWINF = 0.01*(O10-O9)
    #        D: DDTOT = (P10-Q10)-(P9-Q9)
    #        E: DDPROD  = H10-H9
    #        F: DDTOT1 = D9
    #        G: DDPROD1 = E9
    #        H: at_dlprod (=DPROD)
    #        I: DPROD1 = H9
    #        J: at_ws (=WS)
    #        K: WS1 = J9
    #        L: WS2 = K9
    #        M: terms of trade =P10-Q10
    #        N: terms of trade lag =M9
    #        O: at_winf (=WINF) nominal wage inflation (=growth in HWCDW)
    #        P: at_pce (=DPCE)
    #        Q: at_dgdpdefl
    #        R: at_dpcegdp
#    data.head()
    data['DPROD'] = ameco[country + '_dlprod'] # H
    data['WINF'] = ameco[country + '_winf'] # O
    data['DPCE'] = ameco[country + '_pce']  # P
    data['WS'] = ameco[country + '_ws']  # J
    # try to read user provided NAWRU exogenous indicator from AMECO data file, if not, computed from data that is always provided by ECFIN (20210903)
    try:
        data['W_ENDO_IND'] = ameco[country + '_w_endo_ind']
    except:
        pass
    try:
        data['DWINF'] = ameco[country + '_dwinf']
    except:
        data['DWINF'] = 0.01 * (data['WINF'] - data['WINF'].shift(1))   # C
    try:
        data['DDTOT'] = ameco[country + '_ddtot']
    except:
        data['DDTOT'] = (data['DPCE'] - ameco[country + '_dgdpdefl']) - (data['DPCE'].shift(1) -  ameco[country + '_dgdpdefl'].shift(1)) # D
    try:
        data['DDTOT1'] =  ameco[country + '_ddtot1']
    except:
        data['DDTOT1'] = data['DDTOT'].shift(1) # F
    try:
        data['DDPROD'] = ameco[country + '_ddprod']
    except:
        data['DDPROD'] = data['DPROD'] - data['DPROD'].shift(1)     # E
    try:
        data['DDPROD1'] = ameco[country + '_ddprod1']
    except:
        data['DDPROD1'] = data['DDPROD'].shift(1)  # G
    try:
        data['DPROD1'] = ameco[country + '_dprod1']
    except:
        data['DPROD1'] = data['DPROD'].shift(1) # I
    try:
        data['WS1'] = ameco[country + '_ws1']
    except:
        data['WS1'] = data['WS'].shift(1) # K
    try:
        data['WS2'] = ameco[country + '_ws2']
    except:
        data['WS2'] = data['WS'].shift(2) # L
    try:
        data['DTOT'] = ameco[country + '_dtot']
    except:
        data['DTOT'] = data['DPCE'] - ameco[country + '_dgdpdefl'] # M
    try:
        data['DTOT1'] = ameco[country + '_dtot1']
    except:
        data['DTOT1'] = data['DTOT'].shift(1) # N
    try:
        data['DDWS'] = ameco[country + '_ddws']
    except:
        data['DDWS'] = (data['WS'] - data['WS1']) - (data['WS1'] - data['WS2'])
    try:
        data['DRULC'] = ameco[country + '_drulc']
    except:
        data['DRULC'] = data['WINF'] / 100 - data['DPROD'] - (data['DPCE'] - 1)

# TODO dummy are mising from config, moved to jrc_gaptools.py
#    for i in range(1,8):
#        if isinstance(params.loc[country, 'Dummy ' + str(i)], str):
#            dummy = params.loc[country, 'Dummy ' + str(i)].split(':')
#            dummy_years = dummy[0].split(',')
#            dummy_value = dummy[1]
#            data['dum' + str(i)] = 0.
#            for year in dummy_years:
#                data.loc[int(year), 'dum' + str(i)] = dummy_value
#        else:
#            continue
    return data

def extend(series, pct):
    firstvalue = series.first_valid_index() - 1
    for year in range(firstvalue, 1964, -1):
        series[year] = series[year + 1] * (1 + pct[year])
    return series