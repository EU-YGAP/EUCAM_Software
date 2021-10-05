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


def prep(ameco, eucam_data, popproj, projpath, changey, vintage_name, countrylist, modelversion, yf):
    import os, pandas as pd
    from src import get_sol_elem
    ones = pd.Series(1., index=range(1960, changey + 11))
    lightdata = pd.DataFrame(index=range(1960, changey + 11))
    for country in countrylist:
        lightdata = pd.concat([lightdata, ameco.loc[:, [country + "_sled", country + "_gdpq",
                   country + "_iq", country + "_popa1", country + "_lur",
                   country + "_hpere", country + "_hwcdw",
                   country + "_pce", country + "_sle1",]]], axis=1)

        lightdata[country + "_tfpf"] = eucam_data[country + "_SR"]
        lightdata[country + "_srkf"] = eucam_data[country + "_SR_Kf"]
        lightdata[country + "_dep"] = eucam_data[country + "_Depreciation"]
        lightdata[country + "_kt"] = eucam_data[country + "_Capital"]
        lightdata[country + "_nawru"] = eucam_data[country + "_NAWRU"]

        sol_file = os.path.join(projpath + vintage_name + '/', country.upper() + '_NAWRU_'
                                             + vintage_name + '_' + modelversion[country] + '.sol')

        # we need the NAWRU coefficients for the "EUCAM light" datafile
        lightdata.loc[1960, country + '_nawrucoeff'] = get_sol_elem.get_sol_elem(sol_file, "AR1:", [0])[0]
        lightdata.loc[1961, country + '_nawrucoeff'] = get_sol_elem.get_sol_elem(sol_file, "AR2:", [0])[0]
        lightdata.loc[1962, country + '_nawrucoeff'] = get_sol_elem.get_sol_elem(sol_file, "Beta - lag 0:", [0])[0]

        lightdata[country + "_popaf"] = popproj[country.upper() + '_POPAF']
        lightdata[country + "_poptf"]= popproj[country.upper() + '_POPTF']

        part_pop_adj = True
        try:
            partM = ameco[country + '_part2'] * 100 * ones
        except:
            part_pop_adj = False

        if part_pop_adj:
            for i in range(changey + 4, changey + yf + 1):
                partM[i] = partM[i - 1] + 0.5 * (partM[i - 1] - partM[i - 2]) + 0.5 * (partM[i - 2] - partM[i - 3])


            # population at working age non-adj and adj
            popwM = ameco[country + '_popa2'] / 1000 * ones  # adj population at working age
            # assume that after t+5 no new migrants arrive (!)
            #  and that all of them stay in the 'migrant' group for several years
            popwM.loc[changey + 4:] = popwM[changey + 3]

#        if country == 'de':
#            ones = pd.Series(1., index=range(1960, changey + 11))
#            #	 participation rates of migrants and non-migrants#
#
#            partM = MigrationDE['de_partm'] * 100 * ones
#            for i in range(changey + 4, changey + yf + 1):
#                partM[i] = partM[i - 1] + 0.5 * (partM[i - 1] - partM[i - 2]) + 0.5 * (partM[i - 2] - partM[i - 3])

            #	 population at working age for migrants and non-migrants
            # popwM = MigrationDE['de_popwm'] / 1000 * ones  # migrant population at working age
            # assume that after 2023 no new migrants arrive (!) and that all of them stay in the 'migrant' group for several years
            # popwM.loc[changey + 4:] = popwM[changey + 3]

            lightdata['de_partM'] = partM
            lightdata['de_popwM'] = popwM

    return lightdata
