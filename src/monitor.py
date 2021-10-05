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
def nawru(projpath, vintage_name, country, data ,prev_vintage, changey, prev_vintage_name, prev_changey,
          config, gap_path, logfile, endo_nawru, fitted_values, modelversion, prev_model,
          prev_dummies=None):
    import matplotlib.pyplot as plt
    import pandas as pd
    import datetime as dt
    import statsmodels.api as sm
    import numpy as np
    from src import og_plot, get_sol_elem, get_nawru_bounds, ols_ar, jrc_gaptools

    plt.close('all')
    reportfig_nawru = plt.figure(figsize=(8.27, 11.69), dpi=300)
    subnum = 1
    chartnbrow = 5
    # for autumn forecast there is one additionnal year in data but not in previous data to compare to
    pltprevend = changey - (changey-prev_changey)
    pltcurend = changey
    pltsample = 15
    pltbarsample = 10

    data[data == -99999.0] = np.nan
    # PLOT NAWRU REPORT if set to do so and if vintage + present data  exists

    # plot unemployment rate changes
    lur = data['LUR']
    try:
        prev_lur = prev_vintage[country + '_UnEmpl_Rate']
    except:
        with open(logfile, 'a', encoding='utf-8') as f:
            f.write('Charts can not be produced: please provide the Uneployment rate and NAWRU of the previous vintage')

    # this is to check the coefficients and bounds
    if not config['NAWRU_' + country]['method'] == 'HP':
        # TODO : this next two lines could be removed and coef could be read from data_og as we collect them in
        #  jrc_gaptools as we need the NAWRU coefficients to build the EUCAM light datafile
        sol_path = projpath + vintage_name + '/' + country.upper() + '_NAWRU_' + vintage_name + '_' + modelversion + '.sol'
        nawru_coef, nawru_tstat = get_sol_elem.get_sol_elem(sol_path, "Beta - lag 0:", [0,2])
        # nml_path = projpath + vintage_name + '/' + country.upper() + '_NAWRU_' + vintage_name + '_' + modelversion + '.nml' # 2021/03/17 change so that it correponds to what is stated in the interface
        nml_path = projpath + vintage_name + '/' + config['NAWRU_' + country]['namelistname'] # 2021/03/17
        nawru_bounds = get_nawru_bounds.get_nawru_bounds(nml_path)

        stats_text = vintage_name + ' : Beta t-stat = ' + str(
            np.round(nawru_tstat, 2)) + '\n.            LB      UB\nSlope var.  ' + str(
            nawru_bounds[0]) + '    ' + str(np.round(nawru_bounds[1], 2)) + '\nTrend var.  ' + str(
            nawru_bounds[2]) + '    ' + str(np.round(nawru_bounds[3], 2)) + '\nCycle var.  ' + str(
            nawru_bounds[4]) + '    ' + str(np.round(nawru_bounds[5], 2))

        sol_path = projpath  + prev_vintage_name + '/' + country.upper() + '_NAWRU_' + prev_vintage_name + '_'+ prev_model + '.sol'
        prev_nawru_coef, prev_nawru_tstat = get_sol_elem.get_sol_elem(sol_path, "Beta - lag 0:", [0,2])
        nml_path = projpath + prev_vintage_name + '/' + country.upper() + '_NAWRU_' + prev_vintage_name + '_' + prev_model+'.nml'
        prev_nawru_bounds = get_nawru_bounds.get_nawru_bounds(nml_path)

        prev_stats_text = prev_vintage_name + ' : Beta t-stat = ' + str(
            np.round(prev_nawru_tstat, 2)) + '\n.            LB      UB\nSlope var.  ' + str(
            prev_nawru_bounds[0]) + '    ' + str(np.round(prev_nawru_bounds[1], 2)) + '\nTrend var.  ' + str(
            prev_nawru_bounds[2]) + '    ' + str(np.round(prev_nawru_bounds[3], 2)) + '\nCycle var.  ' + str(
            prev_nawru_bounds[4]) + '    ' + str(np.round(prev_nawru_bounds[5], 2))
    else:
        stats_text = vintage_name + ' : estimation using HP filter'
        prev_stats_text = prev_vintage_name + ' : estimation using HP filter'

    if config['NAWRU_' + country]['method'] == 'HP':
        # ===========
        # * Autumn Final 2018
        # * since the wage indicator gives the wrong signal for IE nawru, replace the nawru by a simple HP (lurharm)
        # *===========
        # nblag = config['hp_nawru_' + country]['ARorder']
        # const = bool(config['hp_nawru_' + country]['Constant'])
        # ar_start = config['hp_nawru_' + country]['ARstartingyear']
        # hplambda = config['hp_nawru_' + country]['Lambda']

        # hpstart = ar_start
        # with open(olslog, 'a') as f:
        #     f.write('\n\n\n - - -LURHARM OLS_AR for reporting data\n')
        # data['LUR'] = ols_ar.ols_ar(data['LUR'], nblag, const, ar_start, pltprevend, yf, olslog)
        # cycle, lurharms = sm.tsa.filters.hpfilter(
        #    data.loc[int(hpstart):pltcurend + yf, 'LUR'],hplambda)
        # lurharms[pltprevend + 1] = lurharms[pltprevend] + .5 * (lurharms[pltprevend] - lurharms[pltprevend - 1])
        # lurharms.loc[pltprevend + 2:] = lurharms[pltprevend + 1]

        # nawru_prevmodel = pd.concat(
         #   [lurharms, pd.Series(np.nan, index=range(1960, pltprevend + yf + 1)).rename('fitted values')], axis=1)
        modelversion = 'HP'
        first_index = max(lur.first_valid_index(), 2000) # (2021/10/01) first_index was not set when HP

    else:
        est_type = 'nawru'
        # the adjustment factor normally do not change between vintages
        # TODO adj fact is missing from config namelist so set to 0 temporarily
        adjfact = float(config['hp_nawru_' + country]['Adjfactor'])
        # we remove existing dummies from current vintage specs
        dumcol = [col for col in data if col.startswith('dum')]
        test_data = data.drop(dumcol, axis=1)
        nawru_prevmodel, modelversiontest, test_dummies = jrc_gaptools.rungap50(country, test_data, adjfact, prev_vintage_name+'testrun', pltprevend,
                                             gap_path, est_type, logfile, modelversion=prev_model)
# end of current data using previous model

    prev_endo_nawru = prev_vintage[prev_vintage.columns[
        pd.Series(prev_vintage.columns).str.startswith(country + '_endo')]].iloc[:, 0]
    prev_endo_nawru = prev_endo_nawru.rename(prev_endo_nawru.name[8:])
    prev_fitted_values = prev_vintage[country + '_fitted_values']

    label0 = prev_vintage_name
    label1 = vintage_name
    label2 = getwage_ind(prev_endo_nawru)
    label3 = getwage_ind(endo_nawru)

    if not config['NAWRU_' + country]['method'] == 'HP':
        first_index = max(prev_endo_nawru.first_valid_index(), 2000)
        reportdata = pd.concat([endo_nawru.loc[first_index:pltcurend].rename(label3 + ' ' + label1),
                                prev_endo_nawru.loc[first_index:pltprevend].rename(label2 + ' ' + label0),
                                fitted_values.loc[first_index:pltcurend].rename('fitted values ' + label1),
                                prev_fitted_values.loc[first_index:pltprevend].rename('fitted values ' + label0),
                                nawru_prevmodel.loc[first_index:pltcurend, 'fitted values'].rename(
                                    'fitted values w/ ' + label0 + ' model and ' + label1 + ' data')], axis=1)
        # Chart 3 wage indicators
        subnum=3
        styles = ['--', '--', '-', '-', ':']
        colors = ['k', 'b', 'k', 'b', 'b']
        liney0 = 1
        indlegend = 0
        #reportfig_nawru, subnum = og_plot.og_plot('Wage indicators: actual vs fitted', reportfig_nawru, subnum, reportdata * 100, chartnbrow=chartnbrow)  # new code (data x 100)
        reportfig_nawru, subnum = og_plot.og_plot('Wage indicator: actual (- -), fitted, fitted wpm (.) ', reportfig_nawru, subnum, reportdata*100,
                                                   styles, colors, liney0, indlegend, chartnbrow=chartnbrow)  # new code (data x 100)

    # Chart 1 Unemployment and NAWRU
    subnum = 1
    nawru = data['NAWRU']
    prev_nawru = prev_vintage[country + '_NAWRU']
    # new code: use first_index instead of pltcurend - pltsample
    reportdata = pd.concat([nawru.loc[first_index:pltcurend].rename('NAWRU ' + label1),
                            prev_nawru.loc[first_index:pltprevend].rename('NAWRU ' + label0),
                            lur.loc[first_index:pltcurend].rename('UR ' + label1),
                            prev_lur.loc[first_index:pltprevend].rename('UR ' + label0)], axis=1)

    styles = ['-', '-', '--', '--']
    colors = ['k', 'b', 'k', 'b']
    liney0 = 0
    indlegend = 0
    # reportfig_nawru, subnum = og_plot.og_plot('Unemployment rate (- -) and NAWRU', reportfig_nawru, subnum, reportdata, chartnbrow=chartnbrow)
    reportfig_nawru, subnum = og_plot.og_plot('Unemployment rate (- -) and NAWRU', reportfig_nawru, subnum, reportdata,
                                               styles, colors, liney0, indlegend, chartnbrow=chartnbrow)

    # Chart 5 NAWRU,UR,WI diff with prev vintage
    subnum = 5
    reportdata = pd.concat([(lur.loc[first_index:pltcurend] - prev_lur.loc[first_index:pltcurend]).rename('UR'),
                            (nawru.loc[first_index:pltcurend] - prev_nawru.loc[first_index:pltcurend]).rename('NAWRU'),
                            (endo_nawru.loc[first_index:pltcurend]*100 - prev_endo_nawru.loc[first_index:pltcurend]*100).rename('Wage indicator')], axis=1)

    colors = ['g', 'r', 'm']
    liney0 = 1
    indlegend = 1
    #reportfig_nawru, subnum = og_plot.og_plot('NAWRU,UR,WI: ' + label1 + ' minus ' + label0, reportfig_nawru, subnum, reportdata, chartnbrow=chartnbrow, ChartType='bar')
    reportfig_nawru, subnum = og_plot.og_plot('UR, NAWRU, and WI: ' + label1 + ' minus ' + label0, reportfig_nawru, subnum,reportdata,
                                               styles, colors, liney0, indlegend, chartnbrow=chartnbrow, ChartType='bar')

    # Chart 2 Unemployment GAP
    subnum = 2
    ugap = lur - nawru
    prev_ugap = prev_lur - prev_nawru

    # reportdata = pd.concat([ugap.loc[pltcurend - pltsample:pltcurend].rename(label1),prev_ugap.loc[pltprevend - pltsample:pltprevend].rename(label0)], axis=1)
    reportdata = pd.concat([ugap.loc[first_index:pltcurend].rename(label1),prev_ugap.loc[first_index:pltprevend].rename(label0)], axis=1)

    styles = ['-', '-']
    colors = ['k', 'b']
    liney0 = 1
    indlegend = 0
    # reportfig_nawru, subnum = og_plot.og_plot('Unemployment gap', reportfig_nawru, subnum, reportdata, chartnbrow=chartnbrow)
    reportfig_nawru, subnum = og_plot.og_plot('Unemployment gap', reportfig_nawru, subnum, reportdata,
                                               styles, colors, liney0, indlegend, chartnbrow=chartnbrow)

    # Chart 4 Unemployment GAP difference brw current and previous vintage
    subnum = 4
    # reportdata = pd.DataFrame(ugap.loc[pltprevend - pltbarsample:pltprevend] - prev_ugap.loc[pltprevend - pltbarsample:pltprevend])
    reportdata = pd.DataFrame(ugap.loc[first_index:pltcurend] - prev_ugap.loc[first_index:pltcurend])

    colors = ['k']
    liney0 = 1
    indlegend = 0
    # reportfig_nawru, subnum = og_plot.og_plot('UGAP: ' + label1 + ' minus ' + label0, reportfig_nawru, subnum, reportdata, chartnbrow=chartnbrow, ChartType='bar')
    reportfig_nawru, subnum = og_plot.og_plot('Unemployment gap: ' + label1 + ' minus ' + label0, reportfig_nawru, subnum, reportdata,
                                               styles, colors, liney0, indlegend, chartnbrow=chartnbrow, ChartType='bar')

    # Chart 6 Plot UGAP vs Wage indicators
    subnum = 6
    minusugap = ugap.loc[first_index:pltcurend] * (-1)  # new code used in reportdata
    if 'dwinf' in endo_nawru.name:
        alt_endo = data['DRULC']
    else:
        if 'DWINF' in data.columns:
            alt_endo = data['DWINF']
        else:
            alt_endo = pd.Series(np.nan, name='NA')

    label4 = getwage_ind(alt_endo)
    # reportdata = pd.concat([ugap.rename('UGAP') * -1, endo_nawru.loc[:].rename(label3) * 100, alt_endo.loc[:].rename(label4) * 100], axis=1)
    # new code inserted first_index:pltprevend for all vars
    reportdata = pd.concat([minusugap.rename('UGAP'), endo_nawru.loc[first_index:pltcurend].rename(label3) * 100, alt_endo.loc[first_index:pltcurend].rename(label4) * 100], axis=1)

    #reportfig_nawru, subnum = og_plot.og_plot('(minus) UGAP and Wage indicators, ' + label1, reportfig_nawru, subnum, reportdata, chartnbrow=chartnbrow)
    styles = ['-', '--', ':']
    colors = ['k', 'k', 'k']
    liney0 = 1
    indlegend = 0
    reportfig_nawru, subnum = og_plot.og_plot('-Unemp. gap, wage inf. (- -), and real unit labor cost (.) ', reportfig_nawru, subnum, reportdata,
                                               styles, colors, liney0, indlegend, chartnbrow=chartnbrow)
    if subnum > 1:
        #reportfig_nawru.suptitle('NAWRU report for ' + country.upper() + ' (model version : ' + modelversion + ')')
        reportfig_nawru.text(0.15, 0.96, 'NAWRU report for ' + country.upper() + ',', fontsize='large', color='k',ha='left')
        reportfig_nawru.text(0.55, 0.96, vintage_name, fontsize='large', color='k', ha='right')
        reportfig_nawru.text(0.64, 0.96, prev_vintage_name, fontsize='large', color='b', ha='left')
        reportfig_nawru.text(0.59, 0.96, ' vs ', fontsize='large', color='k', ha='center')

        reportfig_nawru.text(0.55, 0.15, stats_text + '\n\n' + prev_stats_text, wrap=True, fontfamily="Courier New", size=10)
        reportfig_nawru.text(0.3, 0.03, 'EUCAM Software v1 (' + str(dt.datetime.now())[:-7] + ')', wrap=True, fontfamily="Courier New", size=6)
        reportfig_nawru.tight_layout(rect=[0.03, 0.03, 0.97, 0.95], pad=.3)

    return reportfig_nawru

def tfp(og_data, stats, prev_stats, changey, vintage_name, prev_vintage, country, prev_vintage_name, prev_changey):
    import matplotlib.pyplot as plt
    import pandas as pd
    import numpy as np
    import datetime as dt
    from src import og_plot
    og_data[og_data == -99999.0] = np.nan
    plt.close('all')
    reportfig_tfp = plt.figure(figsize=(8.27, 11.69), dpi=300)
    nbrow = 6
    # for autumn forecast there is one additional year in data but not in previous data to compare to
    pltprevend = changey - (changey-prev_changey) + 3
    pltcurend = changey + 3
    pltsample = pltcurend - og_data['SRKF'].first_valid_index()

    # PLOT TFP REPORT if set to do so and if vintage exists
    fitted_cubs = stats[2] + stats[1] * ((og_data['SR'] - og_data['SRKF']))

    # Chart 5 - CUBS - Actual and fitted by the model
    subnum = 5
    reportdata = pd.concat([og_data.loc[pltcurend - pltsample:pltcurend, 'CU'].to_frame('CUBS ' + vintage_name),
                            prev_vintage.loc[pltprevend - pltsample:pltprevend, country + '_cubs'].to_frame('CUBS ' + prev_vintage_name),
                            ], axis=1)

    # reportfig_tfp, subnum = og_plot.og_plot('CUBS', reportfig_tfp, subnum, reportdata*100, chartnbrow=nbrow)
    styles = ['--', '--']
    colors = ['k', 'b']
    liney0 = 1
    indlegend = 0
    reportfig_tfp, subnum = og_plot.og_plot('CUBS', reportfig_tfp, subnum, reportdata*100, styles, colors, liney0, indlegend, chartnbrow=nbrow)

    # Chart 6 - CUBS and TFP gap
    # TODO : beta coef to multiply TFP cycle or TFP GAP
    subnum = 6
    reportdata = pd.concat([((og_data.loc[pltcurend - pltsample:pltcurend, 'SR'] -
                  og_data.loc[pltcurend - pltsample:pltcurend, 'SRKF']) * 100).rename('TFP Gap ' + vintage_name),
                  (og_data.loc[pltcurend - pltsample:pltcurend, 'CU'] * 100).rename('CUBS ' + vintage_name),
                  fitted_cubs[pltcurend - pltsample:pltcurend].to_frame('Fitted CUBS ' + vintage_name) * 100], axis=1)

    #reportfig_tfp, subnum = og_plot.og_plot('CUBS and TFP gap', reportfig_tfp, subnum, reportdata, second_axis_index=2)
    styles = ['-', '--']
    colors = ['k', 'k']
    liney0 = 1
    indlegend = 0
    reportfig_tfp, subnum = og_plot.og_plot('CUBS (- -) and TFP gap', reportfig_tfp, subnum, reportdata, styles, colors,
                                             liney0, indlegend, chartnbrow=nbrow)

    # Chart 1 - TFP and Trend TFP
    subnum = 1
    reportdata = pd.concat([og_data.loc[pltcurend - pltsample:pltcurend, 'SRKF'].rename('Trend TFP ' + vintage_name),
        prev_vintage.loc[pltprevend - pltsample:pltprevend, country + '_srkf'].rename('Trend TFP ' + prev_vintage_name),
        og_data.loc[pltcurend - pltsample:pltcurend, 'SR'].rename('TFP ' + vintage_name),
        prev_vintage.loc[pltprevend - pltsample:pltprevend, country + '_sr'].rename('TFP ' + prev_vintage_name), ], axis=1)

    styles = ['-', '-', '--', '--']
    colors = ['k', 'b', 'k', 'b']
    liney0 = 0
    indlegend = 0
    reportfig_tfp, subnum = og_plot.og_plot('TFP (- -) and trend TFP ', reportfig_tfp, subnum, reportdata, styles, colors, liney0, indlegend, chartnbrow=nbrow)

    # Chart 2 - TFP and Trend TFP (growth)
    subnum = 2
    reportdata = pd.concat([og_data.loc[pltcurend - pltsample:pltcurend, 'SRKF'].diff().to_frame('Trend TFP ' + vintage_name),
        prev_vintage.loc[pltcurend - pltsample:pltprevend, country + '_srkf'].diff().to_frame('Trend TFP ' + prev_vintage_name),
        og_data.loc[pltcurend - pltsample:pltcurend, 'SR'].diff().rename('TFP ' + vintage_name),
         prev_vintage.loc[pltcurend - pltsample:pltprevend, country + '_sr'].diff().rename('TFP ' + prev_vintage_name)
         ], axis=1)
    styles = ['-', '-', '--', '--']
    colors = ['k', 'b', 'k', 'b']
    liney0 = 1
    indlegend = 0
    reportfig_tfp, subnum = og_plot.og_plot('TFP growth (- -) and TFP trend growth rate ', reportfig_tfp, subnum, reportdata, styles, colors, liney0, indlegend, chartnbrow=nbrow)

    # Chart 3 - TFP, KF trend TFP, HP trend TFP (levels)
    subnum = 3
    reportdata = pd.concat([og_data.loc[pltcurend - pltsample:pltcurend, 'SR'].rename('TFP ' + vintage_name),
                            og_data.loc[pltcurend - pltsample:pltcurend, 'SRKF'].rename('KF trend TFP ' + vintage_name),
                            og_data.loc[pltcurend - pltsample:pltcurend, 'srhp'].to_frame(
                                'HP trend TFP ' + vintage_name)
                            ], axis=1)
    styles = ['--', '-', ':']
    colors = ['k', 'k', 'k']
    liney0 = 0
    indlegend = 0
    reportfig_tfp, subnum = og_plot.og_plot('TFP (- -), trend TFP, and HP trend TFP (.) ', reportfig_tfp, subnum, reportdata, styles, colors, liney0, indlegend, chartnbrow=nbrow)

    # Chart 4 - TFP, KF trend TFP, HP trend TFP (growth)
    subnum = 4
    reportdata = pd.concat([og_data.loc[pltcurend - pltsample:pltcurend, 'SR'].diff().rename('TFP ' + vintage_name),
         og_data.loc[pltcurend - pltsample:pltcurend, 'SRKF'].diff().to_frame('KF trend TFP ' + vintage_name),
                            og_data.loc[pltcurend - pltsample:pltcurend, 'wsrhp'].to_frame(
                                'HP trend TFP ' + vintage_name)], axis=1)

    # reportfig_tfp, subnum = og_plot.og_plot('TFP growth, trend TFP growth and HP trend TFP growth rate ', reportfig_tfp, subnum, reportdata, chartnbrow=nbrow)
    styles = ['--', '-', ':']
    colors = ['k', 'k', 'k']
    liney0 = 1
    indlegend = 0
    reportfig_tfp, subnum = og_plot.og_plot('TFP growth (- -), trend TFP growth and HP trend TFP growth (.)', reportfig_tfp, subnum, reportdata, styles, colors, liney0, indlegend, chartnbrow=nbrow)

    # Chart 7 - Diffence in TFP gap
    # new code: rem line below
    # pltsample = 10  (to make the aspect of label homogeneous) this can be reactivated
    subnum = 7
    reportdata = pd.concat([(og_data.loc[pltcurend - pltsample:pltcurend, 'SR'] - og_data.loc[pltcurend - pltsample:pltcurend,'SRKF']) * 100
                            - (prev_vintage.loc[pltcurend - pltsample:pltcurend,country + '_sr'] -
                               prev_vintage.loc[pltcurend - pltsample:pltcurend, country + '_srkf']) * 100], axis=1)
    colors = ['k']
    liney0 = 1
    indlegend = 0
    reportfig_tfp, subnum = og_plot.og_plot('TFP gap: ' + vintage_name + ' minus ' + prev_vintage_name , reportfig_tfp, subnum, reportdata, styles, colors, liney0, indlegend, chartnbrow=nbrow, ChartType='bar')

    # Chart 8 - TFP, trend TFP, and CUBS: differences from the previous vintage
    subnum = 8
    reportdata = pd.concat([(og_data.loc[pltcurend - pltsample:pltcurend, 'SR'].diff() - prev_vintage.loc[pltcurend - pltsample:pltcurend,
              country + '_sr'].diff()).rename('TFP'), (og_data.loc[pltcurend - pltsample:pltcurend, 'SRKF'].diff() - prev_vintage.loc[pltcurend - pltsample:pltcurend,
              country + '_srkf'].diff()).rename('Trend TFP'), (og_data.loc[pltcurend - pltsample:pltcurend, 'CU'] -
              prev_vintage.loc[pltcurend - pltsample:pltcurend, country + '_cubs']).rename('CUBS')], axis=1)

    colors = ['g', 'r', 'm']
    liney0 = 1
    indlegend = 1
    reportfig_tfp, subnum = og_plot.og_plot('TFP, trend TFP and CUBS: ' + vintage_name + ' minus ' + prev_vintage_name,
        reportfig_tfp, subnum, reportdata, styles, colors, liney0, indlegend, chartnbrow=nbrow, ChartType='bar')

    # TODO : THIS should go to a routine
    if subnum > 1:
        beta = str(round(stats[1],2))
        corgapcu = str(round(stats[3],2))
        stats_text = 'Statistics for ' + vintage_name + ' :\n.     Beta coef. = ' + beta + '\n.     Cor. TFP gap/CU : ' + corgapcu

        try:
            beta = str(round(prev_stats[1],2))
        except:
            beta = 'NA'
        try:
            corgapcu = str(round(prev_stats[3],2))
        except:
            corgapcu = 'NA'

        prev_stats_text = 'Statistics for ' + prev_vintage_name + ' :\n.     Beta coef. = ' + beta + '\n.     Cor. TFP gap/CU : ' + corgapcu

        # new code colors in the super-title to specify the vintage
        #reportfig_tfp.suptitle('TFP report for ' + country.upper() + ' (blue: ' + vintage_name + ', black: ' + prev_vintage_name + ')')
        reportfig_tfp.text(0.15, 0.96, 'TFP report for ' + country.upper() + ',', fontsize='large', color='k', ha='left')
        reportfig_tfp.text(0.55, 0.96, vintage_name, fontsize='large', color='k', ha='right')
        reportfig_tfp.text(0.64, 0.96, prev_vintage_name, fontsize='large', color='b', ha='left')
        reportfig_tfp.text(0.59, 0.96, ' vs ', fontsize='large', color='k', ha='center')

        reportfig_tfp.text(0.55, 0.15, stats_text + '\n\n' + prev_stats_text, wrap=True, fontfamily="Courier New", size=10)
        reportfig_tfp.text(0.3, 0.03, 'EUCAM Software v1 (' + str(dt.datetime.now())[:-7] + ')', wrap=True, fontfamily="Courier New", size=6)
        reportfig_tfp.tight_layout(rect=[0.03, 0.03, 0.97, 0.95], pad=.3)

    return reportfig_tfp

def ygap(og_data, changey, vintage_name, prev_vintage, country, prev_vintage_name, prev_changey):
    import matplotlib.pyplot as plt
    import pandas as pd
    import datetime as dt
    from src import og_plot

    plt.close('all')
    reportfig_pf = plt.figure(figsize=(8.27, 11.69), dpi=300)
    # for autumn forecast there is one additional year in data but not in previous data to compare to
    pltprevend = changey - (changey-prev_changey) + 3
    pltcurend = changey + 3
    pltsample = 10
    # PLOTS FOR OUTPUT GAP
    # Chart 7 - Participation rate
    subnum = 7
    reportdata = pd.concat([og_data.loc[pltcurend - pltsample:pltcurend, 'parts'].rename('Trend part ' + vintage_name),
                            prev_vintage.loc[pltcurend - pltsample:pltprevend, country + '_Part_S'].rename('Trend part ' + prev_vintage_name),
                            og_data.loc[pltcurend - pltsample:pltcurend, 'part_mt'].rename('Part ' + vintage_name),
                            prev_vintage.loc[pltcurend - pltsample:pltprevend, country + '_Part'].rename('Part ' + prev_vintage_name), ], axis=1)
    #reportfig_pf, subnum = og_plot.og_plot('Participation rate', reportfig_pf, subnum, reportdata)
    styles = ['-', '-', '--', '--']
    colors = ['k', 'b', 'k', 'b']
    liney0 = 0
    indlegend = 0
    reportfig_pf, subnum = og_plot.og_plot('Participation (- -) and trend participation rate', reportfig_pf, subnum, reportdata,
                                            styles, colors, liney0, indlegend, ChartType='plot')

    #  Chart 8 - Participation rate bar
    subnum = 8
    reportdata = pd.concat([(og_data.loc[pltcurend - pltsample:pltcurend, 'part_mt'] - prev_vintage.loc[
                            pltcurend - pltsample:pltcurend, country + '_Part']).rename('Participation rate'),
                            (og_data.loc[pltcurend - pltsample:pltcurend, 'parts'] - prev_vintage.loc[
                            pltcurend - pltsample:pltcurend, country + '_Part_S']).rename('Trend participation rate')], axis=1)
    # reportfig_pf, subnum = og_plot.og_plot('Participation rate: ' + vintage_name + ' minus ' + prev_vintage_name,reportfig_pf, subnum, reportdata, ChartType='bar')
    colors = ['g', 'r']
    liney0 = 0
    indlegend = 1
    reportfig_pf, subnum = og_plot.og_plot('Participation rate: ' + vintage_name + ' minus ' + prev_vintage_name, reportfig_pf, subnum,
                                            reportdata, styles, colors, liney0, indlegend, ChartType='bar')

    #  Chart 9 - HOURS WORKED
    subnum = 9
    reportdata = pd.concat([og_data.loc[pltcurend - pltsample:pltcurend, 'hperehp'].rename('Trend avg. hours '+ vintage_name),
                            prev_vintage.loc[pltcurend - pltsample:pltcurend, country + '_hperehp'].rename('Trend avg. hours ' + prev_vintage_name),
                            og_data.loc[pltcurend - pltsample:pltcurend, 'hpere_mt'].rename('Avg. hours ' + vintage_name),
                            prev_vintage.loc[pltcurend - pltsample:pltcurend, country + '_HperE'].rename('Avg. hours ' + prev_vintage_name)], axis=1)
    # reportfig_pf, subnum = og_plot.og_plot('Average hours worked', reportfig_pf, subnum, reportdata)
    styles = ['-', '-', '--', '--']
    colors = ['k', 'b', 'k', 'b']
    liney0 = 0
    indlegend = 0
    reportfig_pf, subnum = og_plot.og_plot('Average hours worked (- -) and trend hours worked', reportfig_pf, subnum,
                                            reportdata, styles, colors, liney0, indlegend, ChartType='plot')

    # Chart 10 - differences in HOURS WORKED (bar)
    subnum = 10
    # 'avg. hours'
    reportdata = pd.concat([(og_data.loc[pltcurend - pltsample:pltcurend, 'hpere_mt'] -
                            prev_vintage.loc[pltcurend - pltsample:pltcurend, country + '_HperE']).rename('Average hours wkd'),
                            (og_data.loc[pltcurend - pltsample:pltcurend, 'hperehp'] - prev_vintage.loc[pltcurend - pltsample:pltcurend,
                            country + '_hperehp']).rename('Trend average hours wkd')], axis=1)

    # reportfig_pf, subnum = og_plot.og_plot('Hours worked: ' + vintage_name + ' minus ' + prev_vintage_name , reportfig_pf, subnum, reportdata, ChartType='bar')
    colors = ['g', 'r']
    liney0 = 0
    indlegend = 1
    reportfig_pf, subnum = og_plot.og_plot('Average hours worked: ' + vintage_name + ' minus ' + prev_vintage_name,
                                            reportfig_pf, subnum, reportdata, styles, colors, liney0, indlegend, ChartType='bar')

    #  Chart 11 - Population of working age
    subnum = 11
    reportdata = pd.concat([og_data.loc[pltcurend - pltsample:pltcurend, 'popw'].rename(vintage_name),
                            prev_vintage.loc[pltcurend - pltsample:pltcurend, country + '_Pop_WA'].rename(prev_vintage_name)], axis=1)
    # reportfig_pf, subnum = og_plot.og_plot('Population of working age', reportfig_pf, subnum, reportdata)
    styles = ['-', '-']
    colors = ['k', 'b']
    liney0 = 0
    indlegend = 0
    reportfig_pf, subnum = og_plot.og_plot('Population of working age', reportfig_pf, subnum,
                                            reportdata, styles, colors, liney0, indlegend, ChartType='plot')

    # Chart 12 - difference in Population of working age (bar)
    subnum = 12
    reportdata = pd.concat([(og_data.loc[pltcurend - pltsample:pltcurend, 'popw'] -
                            prev_vintage.loc[pltcurend - pltsample:pltcurend, country + '_Pop_WA']).rename('Pop. working age')], axis=1)
    #reportfig_pf, subnum = og_plot.og_plot('Pop. of working age: ' + vintage_name + ' minus ' + prev_vintage_name , reportfig_pf, subnum, reportdata, ChartType='bar')
    colors = ['k']
    liney0 = 0
    indlegend = 0
    reportfig_pf, subnum = og_plot.og_plot('Population of working age: ' + vintage_name + ' minus ' + prev_vintage_name,
                                            reportfig_pf, subnum, reportdata, styles, colors, liney0, indlegend, ChartType='bar')

    # Chart 5 - TFP and Trend TFP (growth)
    subnum = 5
    reportdata = pd.concat([og_data.loc[pltcurend-1 - pltsample:pltcurend, 'SRKF'].diff().to_frame('Trend TFP ' + vintage_name),
         prev_vintage.loc[pltcurend-1 - pltsample:pltprevend, country + '_SR_Kf'].diff().to_frame('Trend TFP ' + prev_vintage_name),
         og_data.loc[pltcurend-1 - pltsample:pltcurend, 'SR'].diff().rename('TFP ' + vintage_name),
         prev_vintage.loc[pltcurend-1 - pltsample:pltprevend, country + '_SR'].diff().rename('TFP ' + prev_vintage_name)], axis=1)

    # reportfig_tfp, subnum = og_plot.og_plot('TFP growth and trend TFP growth rate', reportfig_pf, subnum, reportdata)
    styles = ['-', '-', '--', '--']
    colors = ['k', 'b', 'k', 'b']
    liney0 = 1
    indlegend = 0
    reportfig_pf, subnum = og_plot.og_plot('TFP growth (- -) and trend TFP growth', reportfig_pf, subnum, reportdata[1:pltprevend],
                                            styles, colors, liney0, indlegend, ChartType='plot')

    # Chart 6 - UR and NAWWRU
    subnum = 6
    lur = og_data['lurharm_mt']
    nawru = og_data['NAWRU']
    prev_nawru = prev_vintage[country + '_NAWRU']
    prev_lur = prev_vintage[country + '_UnEmpl_Rate']
    reportdata = pd.concat([nawru.loc[pltcurend - pltsample:pltcurend].rename('NAWRU ' + vintage_name),
                            prev_nawru.loc[pltcurend - pltsample:pltprevend].rename('NAWRU ' + prev_vintage_name),
                            lur.loc[pltcurend - pltsample:pltcurend].rename('UR ' + vintage_name),
                            prev_lur.loc[pltcurend - pltsample:pltprevend].rename('UR ' + prev_vintage_name)], axis=1)
    # reportfig_nawru, subnum = og_plot.og_plot('Unemployment rate and NAWRU', reportfig_pf, subnum, reportdata)
    styles = ['-', '-', '--', '--']
    colors = ['k', 'b', 'k', 'b']
    liney0 = 0
    indlegend = 0
    reportfig_pf, subnum = og_plot.og_plot('Unemployment rate (- -) and NAWRU', reportfig_pf, subnum, reportdata,
                                            styles, colors, liney0, indlegend, ChartType='plot')

    # Chart 1 - YGAP
    subnum = 1
    ygap = og_data['YGAP']
    prev_ygap = prev_vintage[country + '_Y_GAP(PF)']
    reportdata = pd.concat([ygap.loc[pltcurend - pltsample:pltcurend].rename('YGAP ' + vintage_name),
                            prev_ygap.loc[pltcurend - pltsample:pltprevend].rename('YGAP ' + prev_vintage_name)], axis=1)

    # reportfig_nawru, subnum = og_plot.og_plot('Output gap', reportfig_pf, subnum, reportdata)
    styles = ['-', '-']
    colors = ['k', 'b']
    liney0 = 1
    indlegend = 0
    reportfig_pf, subnum = og_plot.og_plot('Output gap', reportfig_pf, subnum, reportdata,
                                             styles, colors, liney0, indlegend, ChartType='plot')

    # Chart 2 - difference in YGAP (bar)
    subnum = 2
    reportdata = pd.concat([(ygap.loc[pltcurend - pltsample:pltcurend] -
                            prev_ygap.loc[pltcurend - pltsample:pltcurend])], axis=1)

    # reportfig_pf, subnum = og_plot.og_plot('Output gap: ' + vintage_name + ' minus ' + prev_vintage_name, reportfig_pf, subnum, reportdata, ChartType='bar')
    styles = ['-']
    colors = ['k']
    liney0 = 1
    indlegend = 0
    reportfig_pf, subnum = og_plot.og_plot('Output gap: ' + vintage_name + ' minus ' + prev_vintage_name, reportfig_pf, subnum, reportdata,
                                            styles, colors, liney0, indlegend, ChartType='bar')

    # Chart 3 - Y / YPOT
    subnum = 3
    y = og_data['y']
    ypot = og_data['ypot']
    prev_y = prev_vintage[country + '_GDP']
    prev_ypot = prev_vintage[country + '_Y_Pot']
    reportdata = pd.concat([y.loc[pltcurend - pltsample:pltcurend].rename('GDP ' + vintage_name),
                            prev_y.loc[pltcurend - pltsample:pltprevend].rename('GDP ' + prev_vintage_name),
                            ypot.loc[pltcurend - pltsample:pltcurend].rename('Potential GDP ' + vintage_name),
                            prev_ypot.loc[pltcurend - pltsample:pltprevend].rename('Potential GDP ' + prev_vintage_name)], axis=1)

    #reportfig_nawru, subnum = og_plot.og_plot('GDP and potential GDP', reportfig_pf, subnum, reportdata)
    styles = ['--', '--', '-', '-']
    colors = ['k', 'b', 'k', 'b']
    liney0 = 0
    indlegend = 0
    reportfig_pf, subnum = og_plot.og_plot('GDP (- -) and potential GDP', reportfig_pf, subnum, reportdata,
                                            styles, colors, liney0, indlegend, ChartType='plot')

    # Chart 4 - IYPOT
    subnum = 4

    iypot = og_data['iypot']
    prev_iypot = 100 * (prev_vintage[country + '_Investment'] / prev_ypot)
    reportdata = pd.concat([iypot.loc[pltcurend - pltsample:pltcurend].rename(vintage_name),
                            prev_iypot.loc[pltcurend - pltsample:pltprevend].rename(prev_vintage_name)], axis=1)

    styles = ['-', '-']
    colors = ['k', 'b']
    liney0 = 0
    indlegend = 0
    # reportfig_nawru, subnum = og_plot.og_plot('Investment to potential GDP ratio', reportfig_pf, subnum, reportdata)
    reportfig_pf, subnum = og_plot.og_plot('Investment to potential GDP ratio', reportfig_pf, subnum, reportdata,
                                            styles, colors, liney0, indlegend, ChartType='plot')

    if subnum > 1:
        #reportfig_pf.suptitle('Output gap report for ' + country.upper())
        reportfig_pf.text(0.10, 0.97, 'Output gap report for ' + country.upper() + ',', fontsize='large', color='k', ha='left')
        reportfig_pf.text(0.55, 0.97, vintage_name, fontsize='large', color='k', ha='right')
        reportfig_pf.text(0.64, 0.97, prev_vintage_name, fontsize='large', color='b', ha='left')
        reportfig_pf.text(0.59, 0.97, ' vs ', fontsize='large', color='k', ha='center')

        reportfig_pf.text(0.3, 0.02, 'EUCAM Software v1 (' + str(dt.datetime.now())[:-7] + ')', wrap=True, fontfamily="Courier New", size=6)
        reportfig_pf.tight_layout(rect=[0.03, 0.03, 0.97, 0.95], pad=.3)

    return reportfig_pf


def getsfaf(vintage):
    return 'SF' + vintage[0:4] + vintage[7] if vintage[5]=='1'  else 'AF' + vintage[0:4]+ vintage[7] if vintage[5]=='2' else '?'+vintage[0:4]
def getwage_ind(indicator):
    return 'Real unit labour costs' if 'RULC' in indicator.name.upper() else 'Wage infl.' if 'WINF' in indicator.name.upper() else 'Wage indic. : NA'