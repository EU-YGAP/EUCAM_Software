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

def aggregates(outputfile, ameco, changey, endy, out_start_year, finalprintyear, alpha):
    import pandas as pd
    import numpy as np

    aggdata = pd.DataFrame(
        columns=['eu15_GDP', 'eu12_GDP', 'eu03_GDP', 'eu15_Trend_GDP', 'eu12_Trend_GDP', 'eu03_Trend_GDP',
                 'eu15_Y_Gap(PF)', 'eu12_Y_Gap(PF)', 'eu03_Y_Gap(PF)', 'eu15_Y_Pot', 'eu12_Y_Pot', 'eu03_Y_Pot',
                 'eu15_Part', 'eu12_Part', 'eu03_Part', 'eu15_Part_S', 'eu12_Part_S', 'eu03_Part_S', 'eu15_Y_Gap(HP)',
                 'eu12_Y_Gap(HP)', 'eu03_Y_Gap(HP)', 'eu15_wSR', 'eu12_wSR', 'eu03_wSR', 'eu15_wSR_KF', 'eu12_wSR_KF',
                 'eu03_wSR_KF', 'eu15_NAWRU', 'eu12_NAWRU', 'eu03_NAWRU', 'eu15_UnEmpl_Rate', 'eu12_UnEmpl_Rate',
                 'eu03_UnEmpl_Rate', 'eu15_HperE', 'eu12_HperE', 'eu03_HperE', 'eu15_Investment', 'eu12_Investment',
                 'eu03_Investment', 'eu15_Pot_LF', 'eu12_Pot_LF', 'eu03_Pot_LF', 'eu15_Pot_Empl', 'eu12_Pot_Empl',
                 'eu03_Pot_Empl', 'eu15_Pot_Tot_Hrs', 'eu12_Pot_Tot_Hrs', 'eu03_Pot_Tot_Hrs', 'eu15_Empl', 'eu12_Empl',
                 'eu03_Empl', 'eu15_Tot_Hrs', 'eu12_Tot_Hrs', 'eu03_Tot_Hrs', 'eu15_Capital', 'eu12_Capital',
                 'eu03_Capital', 'eu15_Wage_Infl', 'eu12_Wage_Infl', 'eu03_Wage_Infl', 'eu15_Civ_Empl', 'eu12_Civ_Empl',
                 'eu03_Civ_Empl', 'eu15_Pop_WA', 'eu12_Pop_WA', 'eu03_Pop_WA', 'eu15_Tot_Pop', 'eu12_Tot_Pop',
                 'eu03_Tot_Pop', 'eu15_SR', 'eu12_SR', 'eu03_SR', 'eu15_SR_HP', 'eu12_SR_HP', 'eu03_SR_HP',
                 'eu15_SR_Kf', 'eu12_SR_Kf', 'eu03_SR_Kf', 'eu15_Depreciatio', 'eu12_Depreciatio', 'eu03_Depreciatio',
                 'eu15_Exchange ra', 'eu12_Exchange ra', 'eu03_Exchange ra', 'eu15_PPS', 'eu12_PPS', 'eu03_PPS',
                 'eu15_GDP deflato', 'eu12_GDP deflato', 'eu03_GDP deflato', 'eu15_Nominal_GDP', 'eu12_Nominal_GDP',
                 'eu03_Nominal_GDP', 'eu15_NULC', 'eu12_NULC', 'eu03_NULC'])

    for aggcode in ['eu15', 'eu12', 'eu03']:

# variable not used in computation but transfered to output data
        aggdata[aggcode + '_Exchange ra'] = ameco[aggcode + '_er']
        aggdata[aggcode + '_PPS'] = ameco[aggcode + '_ppp']
        aggdata[aggcode + '_GDP deflato'] = ameco[aggcode + '_pgde']
        aggdata[aggcode + '_Nominal_GDP'] = ameco[aggcode + '_gdpne']
        aggdata[aggcode + '_NULC'] = ameco[aggcode + '_nulc']

        aggdata[aggcode + '_GDP'] = ameco[aggcode + '_gdpq']
#        wy = aggdata[aggcode + '_GDP'].pct_change()

        aggdata[aggcode + '_UnEmpl_Rate'] = ameco[aggcode + '_lur'] / 100
        aggdata[aggcode + '_Empl'] = ameco[aggcode + '_sled']
        lf = aggdata[aggcode + '_Empl'] / (1 - aggdata[aggcode + '_UnEmpl_Rate'])
#        lu = aggdata[aggcode + '_UnEmpl_Rate'] * lf
        w = ameco[aggcode + '_hwcdw']

        aggdata[aggcode + '_HperE'] = ameco[aggcode + '_hpere']
        aggdata[aggcode + '_Tot_Hrs'] = aggdata[aggcode + '_HperE'] * aggdata[aggcode + '_Empl']
#        aggdata[aggcode + 'wtotalh'] = aggdata[aggcode + '_Tot_Hrs'].pct_change()

        aggdata[aggcode + '_Pop_WA'] = ameco[aggcode + '_popa1']
        aggdata[aggcode + '_Tot_Pop'] = ameco[aggcode + '_popt']
        aggdata[aggcode + '_Investment'] = ameco[aggcode + '_iq']
        aggdata[aggcode + '_Capital'] = ameco[aggcode + '_kt']
#        iy = aggdata[aggcode + '_Investment'] / aggdata[aggcode + '_GDP']

        aggdata[aggcode + '_SR'] = np.log(
            aggdata[aggcode + '_GDP'] / (aggdata[aggcode + '_Tot_Hrs'] ** alpha * aggdata[aggcode + '_Capital'] ** (1 - alpha)))
        aggdata[aggcode + '_Depreciatio'] = (aggdata[aggcode + '_Investment'] - (
                    aggdata[aggcode + '_Capital'] - aggdata[aggcode + '_Capital'].shift(1))) / aggdata[
                                                aggcode + '_Capital'].shift(1)
        aggdata.loc[changey:endy, aggcode + '_Depreciatio'] = aggdata.loc[changey - 1, aggcode + '_Depreciatio']


        wg = w.pct_change() * 100
        aggdata[aggcode + '_Wage_Infl'] = wg.diff()
        # used for weighting in the AGGREGATION
        aggdata[aggcode+'_Civ_Empl'] = ameco[aggcode + '_sle']
        aggdata[aggcode+'_part'] = 100 * lf / aggdata[aggcode+'_Pop_WA']
        aggdata.loc[out_start_year:finalprintyear].to_excel(outputfile, sheet_name='EU15 AGGs Python', na_rep="#N/A", startrow=2)

    aggdata = pd.DataFrame(
        columns=['cc12_GDP', 'eu27_GDP', 'eu16_GDP', 'eu19_GDP', 'eu19_GDP2', 'eu28_GDP', 'cc12_Investment',
                 'eu27_Investment', 'eu16_Investment', 'eu19_Investment', 'eu19_Investment2', 'eu28_Investment',
                 'cc12_Capital', 'eu27_Capital', 'eu16_Capital', 'eu19_Capital', 'eu19_Capital2', 'eu28_Capital',
                 'cc12_Pop_WA', 'eu27_Pop_WA', 'eu16_Pop_WA', 'eu19_Pop_WA', 'eu19_Pop_WA2', 'eu28_Pop_WA', 'cc12_Part',
                 'eu27_Part', 'eu16_Part', 'eu19_Part', 'eu19_Part2', 'eu28_Part', 'cc12_UnEmpl_Rate',
                 'eu27_UnEmpl_Rate', 'eu16_UnEmpl_Rate', 'eu19_UnEmpl_Rate', 'eu19_UnEmpl_Rate2', 'eu28_UnEmpl_Rate',
                 'cc12_Empl', 'eu27_Empl', 'eu16_Empl', 'eu19_Empl', 'eu19_Empl2', 'eu28_Empl', 'cc12_Y_Gap(PF)',
                 'eu27_Y_Gap(PF)', 'eu16_Y_Gap(PF)', 'eu19_Y_Gap(PF)', 'eu19_Y_Gap(PF)2', 'eu28_Y_Gap(PF)', 'cc12_Y_Pot',
                 'eu27_Y_Pot', 'eu16_Y_Pot', 'eu19_Y_Pot', 'eu19_Y_Pot', 'eu28_Y_Pot', 'cc12_Wage_Infl',
                 'eu27_Wage_Infl', 'eu16_Wage_Infl', 'eu19_Wage_Infl', 'eu19_Wage_Infl2', 'eu28_Wage_Infl',
                 'cc12_Y_Gap(HP)', 'eu27_Y_Gap(HP)', 'eu16_Y_Gap(HP)', 'eu19_Y_Gap(HP)', 'eu19_Y_Gap(HP)2',
                 'eu28_Y_Gap(HP)', 'cc12_Trend_GDP', 'eu27_Trend_GDP', 'eu16_Trend_GDP', 'eu19_Trend_GDP',
                 'eu19_Trend_GDP2', 'eu28_Trend_GDP', 'cc12_Part_S', 'eu27_Part_S', 'eu16_Part_S', 'eu19_Part_S',
                 'eu19_Part_S2', 'eu28_Part_S', 'cc12_NAWRU', 'eu27_NAWRU', 'eu16_NAWRU', 'eu19_NAWRU', 'eu19_NAWRU2',
                 'eu28_NAWRU', 'cc12_Pot_Empl', 'eu27_Pot_Empl', 'eu16_Pot_Empl', 'eu19_Pot_Empl', 'eu19_Pot_Empl2',
                 'eu28_Pot_Empl', 'cc12_Pot_Tot_Hrs', 'eu27_Pot_Tot_Hrs', 'eu16_Pot_Tot_Hrs', 'eu19_Pot_Tot_Hrs',
                 'eu19_Pot_Tot_Hrs2', 'eu28_Pot_Tot_Hrs', 'cc12_HperE', 'eu27_HperE', 'eu16_HperE', 'eu19_HperE',
                 'eu19_HperE2', 'eu28_HperE', 'cc12_wSR', 'eu27_wSR', 'eu16_wSR', 'eu19_wSR', 'eu19_wSR2', 'eu28_wSR',
                 'cc12_wSR_Kf', 'eu27_wSR_Kf', 'eu16_wSR_Kf', 'eu19_wSR_Kf', 'eu19_wSR_Kf2', 'eu28_wSR_Kf',
                 'cc12_Pot-LF', 'eu27_Pot-LF', 'eu16_Pot-LF', 'eu19_Pot-LF', 'eu19_Pot-LF', 'eu28_Pot-LF',
                 'cc12_Civ_Empl', 'eu27_Civ_Empl', 'eu16_Civ_Empl', 'eu19_Civ_Empl', 'eu19_Civ_Empl2', 'eu28_Civ_Empl',
                 'cc12_Tot_Hrs', 'eu27_Tot_Hrs', 'eu16_Tot_Hrs', 'eu19_Tot_Hrs', 'eu19_Tot_Hrs2', 'eu28_Tot_Hrs',
                 'cc12_Tot_Pop', 'eu27_Tot_Pop', 'eu16_Tot_Pop', 'eu19_Tot_Pop', 'eu19_Tot_Pop2', 'eu28_Tot_Pop',
                 'cc12_SR', 'eu27_SR', 'eu16_SR', 'eu19_SR', 'eu19_SR2', 'eu28_SR', 'cc12_SR_HP', 'eu27_SR_HP',
                 'eu16_SR_HP', 'eu19_SR_HP', 'eu19_SR_HP2', 'eu28_SR_HP', 'cc12_SR_Kf', 'eu27_SR_Kf', 'eu16_SR_Kf',
                 'eu19_SR_Kf', 'eu19_SR_Kf2', 'eu28_SR_Kf', 'cc12_Dep rate', 'eu27_Dep rate', 'eu16_Dep rate',
                 'eu19_Dep rate', 'eu19_Dep rate2', 'eu28_Dep rate', 'cc12_Exch rate', 'eu27_Exch rate',
                 'eu16_Exch rate', 'eu19_Exch rate', 'eu19_Exch rate2', 'eu28_Exch rate', 'cc12_PPS', 'eu27_PPS',
                 'eu16_PPS', 'eu19_PPS', 'eu19_PPS2', 'eu28_PPS', 'cc12_GDP deflato', 'eu27_GDP deflato',
                 'eu16_GDP deflato', 'eu19_GDP deflato', 'eu19_GDP deflato2', 'eu28_GDP deflato', 'cc12_Nominal_GDP',
                 'eu27_Nominal_GDP', 'eu16_Nominal_GDP', 'eu19_Nominal_GDP', 'eu19_Nominal_GDP2', 'eu28_Nominal_GDP',
                 'cc12_NULC', 'eu27_NULC', 'eu16_NULC', 'eu19_NULC', 'eu19_NULC2', 'eu28_NULC'])

    for aggcode in ['cc12', 'eu27', 'eu16', 'eu19', 'eu28']:
        # variable not used in computation but transfered to output data
        aggdata[aggcode + '_Exchange rate'] = ameco[aggcode + '_er']
        aggdata[aggcode + '_PPS'] = ameco[aggcode + '_ppp']
        aggdata[aggcode + '_GDP deflator_euro'] = ameco[aggcode + '_pgde']
        aggdata[aggcode + '_Nominal_GDP-euro'] = ameco[aggcode + '_gdpne']
        aggdata[aggcode + '_NULC'] = ameco[aggcode + '_nulc']

        aggdata[aggcode + '_GDP'] = ameco[aggcode + '_gdpq']
#        wy = aggdata[aggcode + '_GDP'].pct_change()

        aggdata[aggcode + '_UnEmpl_Rate'] = ameco[aggcode + '_lur'] / 100
        aggdata[aggcode + '_Empl'] = ameco[aggcode + '_sled']
#        lf = aggdata[aggcode + '_Empl'] / (1 - aggdata[aggcode + '_UnEmpl_Rate'])
#        lu = aggdata[aggcode + '_UnEmpl_Rate'] * lf
        w = ameco[aggcode + '_hwcdw']

        aggdata[aggcode + '_HperE'] = ameco[aggcode + '_hpere']
        aggdata[aggcode + '_Tot_Hrs'] = aggdata[aggcode + '_HperE'] * aggdata[aggcode + '_Empl']
#        aggdata[aggcode + 'wtotalh'] = aggdata[aggcode + '_Tot_Hrs'].pct_change()

        aggdata[aggcode + '_Pop_WA'] = ameco[aggcode + '_popa1']
        aggdata[aggcode + '_Tot_Pop'] = ameco[aggcode + '_popt']
        aggdata[aggcode + '_Investment'] = ameco[aggcode + '_iq']
        aggdata[aggcode + '_Capital'] = ameco[aggcode + '_kt']
#        iy = aggdata[aggcode + '_Investment'] / aggdata[aggcode + '_GDP']

        aggdata[aggcode + '_SR'] = np.log(aggdata[aggcode + '_GDP'] / (
                    aggdata[aggcode + '_Tot_Hrs'] ** alpha * aggdata[aggcode + '_Capital'] ** (1 - alpha)))
        aggdata[aggcode + '_Dep rate'] = (aggdata[aggcode + '_Investment'] - (
                    aggdata[aggcode + '_Capital'] - aggdata[aggcode + '_Capital'].shift(1))) / aggdata[
                                                aggcode + '_Capital'].shift(1)

        aggdata.loc[changey:endy, aggcode + '_Dep rate'] = aggdata.loc[changey - 1, aggcode + '_Dep rate']

        wg = w.pct_change()
        aggdata[aggcode + '_Wage_Infl'] = wg.diff()
#        aggdata[aggcode+'py'] = ameco[aggcode + '_gdpn'] / aggdata[aggcode+'_GDP']
#        aggdata[aggcode+'gpy'] = aggdata[aggcode+'py'].pct_change()
        aggdata[aggcode + '_Part'] = np.nan
#            aggdata[aggcode + '_Civ_Empl'] = np.nan
        aggdata.loc[out_start_year+30:finalprintyear].to_excel(outputfile, sheet_name='NMS AGGs Python', na_rep="#N/A", startrow=2)

    outputfile.close()