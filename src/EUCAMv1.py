"""
Copyright 2019,2021 European Union

Licensed under the EUPL, Version 1.2 or – as soon they will be approved by the European Commission –
subsequent versions of the EUPL (the "Licence");
You may not use this work except in compliance with the Licence.
You may obtain a copy of the Licence at:
https://joinup.ec.europa.eu/collection/eupl/eupl-text-11-12

Unless required by applicable law or agreed to in writing, software distributed under the Licence is distributed on
an "AS IS" basis, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the Licence for the specific language governing permissions and limitations under the Licence.

                         #--------------------#
                         #      EUCAM v1      #
                         #--------------------#

Python code for Output Gap estimation (using the European Union’s Commonly Agreed Methodology)
This program computes indicators needed for assessing both the productive capacity (i.e. potential output)
and cyclical position (i.e. output gaps) of EU economies.

Author: François Blondeau (European Commisssion, Directorate-General for Economic and Financial Affairs)

References :
    - Similar code in WinRATS (Cécile Denis, Werner Röger and Valerie Vandermeulen)
        and MATLAB (Valerie Vandermeulen)
    - OGWG commonly agreed production function (PF) methodology :
        "The Production Function Methodology for Calculating Potential Growth Rates & Output Gaps", Havik et al. (2014)
            European Commission Economic Paper 535 | November 2014

Python is open source and royalty-free.
-> https://www.python.org/
-> https://wiki.python.org/moin/BeginnersGuide
"""


def main():
    # ---------------------------------------------------------
    #          IMPORT of needed libraries and functions
    # ---------------------------------------------------------
    #
    # timer to evaluate speed of processing
    import datetime
    import numpy as np
    current1 = np.datetime64(datetime.datetime.now())
    import logging
    import daiquiri
    import os, sys, inspect
    import f90nml
    import matplotlib
    matplotlib.use('agg')
    from matplotlib.backends.backend_pdf import PdfPages
    from scipy.optimize import fsolve
    import pandas as pd
    from pandas import ExcelWriter
    if '/bin' in os.path.dirname(os.path.abspath(inspect.stack()[0][1]))[-4:] or '\\bin' in os.path.dirname(os.path.abspath(inspect.stack()[0][1]))[-4:]:
        loc_path = os.path.dirname(os.path.abspath(inspect.stack()[0][1]))[:-4]
    else:
        loc_path = os.path.dirname(os.path.abspath(inspect.stack()[0][1]))
    projpath = loc_path + '/'
    sys.path.insert(0, projpath)
    from src import jrc_gaptools
    from src import tfp_prep
    from src import nawru_prep
    from src import og_prep
    from src import modeltosolve
    from src import ols_ar
    from src import aggregates2
    from src import monitor
    from src import light_inputdata
    from src import nawru_stats
    import statsmodels.api as sm
    # ----------------------------------------------------
    #            PARAMETERS READING and SETTING
    # ----------------------------------------------------
    # NOTE : this program can be launched via a button within the "EUCAMvXX.xlsm" file
    prgversion='EUCAM Software v1.0'
    print('------------' + prgversion +'------------\n-----Reading parameters and data files-----')
    if not os.path.exists(projpath + 'log'):
        os.makedirs(projpath + 'log')

    daiquiri.setup(
        level=logging.INFO,
        outputs=(
            daiquiri.output.File(projpath + 'log/EUCAMv1.log', level=logging.ERROR),
            daiquiri.output.File(projpath + 'log/EUCAMv1.log', level=logging.INFO)
        )
    )

    logger = daiquiri.getLogger(__name__)
    logger.info('WARNINGS :')
    logger.error('ERRORS :')

    logfile=projpath+"log/EUCAMv1.log"
    eucamlog=open(logfile,'w+', encoding='utf-8')
    eucamlog.close()

    olslog=projpath+"log/EUCAMv1.log"
#    eucamlog=open(olslog,'w+')
#    eucamlog.close()
    with open(logfile, 'a') as f:
        f.write('\nEUCAM v1 - log creation time : ' + str(datetime.datetime.now())[:-7] +
                '\n--------------------------------------------------\n')

# Before going further we have to retrieve the configuration file passed to the program
    try:
        argument = sys.argv[1]
    except:
        with open(logfile, 'a') as f:
            f.write('\nPlease pass the "vintage name" to the program if you use command line execution. '
              '\n   Or use the program interface -> EUCAMv1.xslm...')
        print('\n\nPlease pass the "vintage name" to the program if you use command line execution. '
              '\n   Or use the program interface -> EUCAMv1.xslm...')
        sys.exit(78)

    try:
        confignml = f90nml.read(projpath+argument+'/ConfigurationFile.nml')
    except:
        with open(logfile, 'a') as f:
            f.write('\nThe configuration file (ConfigurationFile.nml) could not be read, the program will stop...'
                '\nPlease create it and pass the "vintage name" to the program if you use command line execution. '
                    '(e.g. EUCAMv1.exe 2020_AUTUMN_F).'
              '\n   Or use the program interface -> EUCAMv1.xslm...')
        print('\n\nThe configuration file (ConfigurationFile.nml) could not be read, the program will stop...'
                '\nPlease create it and pass the "vintage name" as program argument if you use command line execution '
              '(e.g. EUCAMv1.exe 2020_AUTUMN_F).'
              '\n   Or use the program interface -> EUCAMv1.xslm...')
        sys.exit(78)

    # list of all possible country used for the general loop
    countrylist = confignml['fullcountrylist']['countrylist'].replace(' ','').split(',')
    try:og_countrylist = confignml['OGcountrylist']['countrylist'].replace(' ','').split(',')
    except:
        with open(logfile, 'a') as f:
            f.write('\nWARNING : List of countries for which to compute OG could not be read' +
                    '\n          assuming it is empty (no OG estimation)\n')
        og_countrylist = ''
    if 'NA' in og_countrylist:
        og_countrylist = ''


    debug = False
    debug_code = None
    try:
        debug_code = confignml['DEBUG']['debug']
    except:
        pass
    if debug_code == 'Y':
        debug = True
    # todo switch to debug here:
    tfp_countrylist = confignml['TFPcountrylist']['countrylist'].replace(' ','').split(',')
    if 'NA' in tfp_countrylist or tfp_countrylist == ['']: #(2021-09-27) modified as config namelist can specify NA or '' (=[''])
        tfp_countrylist = ''
    nawru_countrylist = confignml['NAWRUcountrylist']['countrylist'].replace(' ','').split(',')
    if 'NA' in nawru_countrylist or nawru_countrylist == ['']: # (2021-09-27) modified as config namelist can specify NA or '' (=[''])
        nawru_countrylist = ''

    # we want to extend backward NAWRU for some countries using HP filtered UR
    # we read from an excel file the filtered UR
    hpur_pct = pd.read_excel(projpath + 'bin/LURHARM_HP_adjusted.xlsx', sheet_name='OMS', header=0, index_col=0)
    hpur_pct = pd.concat(
        [hpur_pct, pd.read_excel(projpath + 'bin/LURHARM_HP_adjusted.xlsx', sheet_name='NMS', header=0, index_col=0)],
        axis=1)
    hpur_pct[hpur_pct == 0] = np.nan
    # and we compute backward growth rates
    hpur_pct = hpur_pct.iloc[::-1].pct_change().iloc[::-1]
    hpur_pct[hpur_pct == 0] = np.nan

    # the settings are read from parameter file values.
    # the description of each parameter is detailed in the Excel file
    changey = int(confignml['sourcefiles']['last_year_data'])  # last year of the short term forecast
    prev_changey = int(confignml['sourcefiles']['last_year_data_previous_vintage'])
    yf = 6
    alpha = .65
    # clos_nb_year (number of year to close the YGAP) is normally 3 years and correspond to the mid term "horizon"
    # the variable is used as well to set the end year for output writing (short term + mid term = t+5)
    clos_nb_y = 3
    OutStartYear = 1965
    vintage_name = confignml['sourcefiles']['name_current_vintage']

    prev_vintage_name = confignml['sourcefiles']['name_previous_vintage']
    ones = pd.Series(1., index=range(1960, changey + yf + 1))
    ygap_passed = 0

    # TODO : the fitted values and wage indicator have to be saved in the NAWRU FILE to allow reporting
    # TODO : during next round. They must be read with NAWRU if NAWRU is provided exogenously
    # TODO : For now they are just initialised to avoid error
    endo_nawru = pd.Series(np.nan, index=range(1960, changey + yf + 1)).rename('endo_')
    fitted_values = pd.Series(np.nan, index=range(1960, changey + yf + 1))


    # -------------------------------------------------
    #               MAIN DATA FILES READING
    # -------------------------------------------------

    datapath = projpath + vintage_name + '/'
    ameco = pd.read_excel(datapath + confignml['sourcefiles']['ameco_data_file'], header=0, index_col=0)
    ameco = ameco.T

    cubs = pd.read_excel(datapath + confignml['sourcefiles']['cubs_data_file'], index_col=0, header=0)
    popproj = pd.read_excel(datapath + confignml['sourcefiles']['population_data_file'], header=0, index_col=0) # (2021-10-05) remove reference to sheet name, first sheet is read by default
    popproj = popproj.T
    # NOTE : the popproj file as years as string (excel formula) -> convert index to integer on the fly
    popproj.index = popproj.index.astype('int64')
    # no_srkf_exog = False (2021/09/07 : existence of exog tfp is detected later via srkf_exists)
    try:
        srkf_exog = pd.read_excel(datapath + 'tfp_'+vintage_name+'.xls', header=0, index_col=0)
        srkf_exog= srkf_exog.rename(columns=str.lower) #(2021/03/29) compatibility with lowercase exog
    except:
        pass   #2021/09/07
        # no_srkf_exog = True (2021/09/07 : existence of exog tfp is detected later via srkf_exists)
    try:
        nawru_exog = pd.read_excel(datapath + 'nawru_'+vintage_name+'.xls', header=0, index_col=0)
        nawru_exog = nawru_exog.rename(columns=str.lower)# (2021/03/29) compatibility with lowercase exog
    except:
        pass

    vintage_exists = True
    try:
        eucam_data = pd.read_excel(datapath + 'EUCAM_output_'+vintage_name+'.xlsx', header=0, index_col=0)
    except:
        vintage_exists = False
        pass


    prev_vintage_exists = True
    try:
        prev_vintage = pd.read_excel(projpath + prev_vintage_name + '/EUCAM_output_'+prev_vintage_name+'.xlsx', header=0, index_col=0)
    except:
        prev_vintage_exists = False
        pass

    prev_tfp_exists = True
    try:
        prev_tfp = pd.read_excel(projpath + prev_vintage_name + '/tfp_'+prev_vintage_name+'.xls', header=0, index_col=0)
    except:
        prev_tfp_exists = False

    # we need a list of model version, beta coef and correlation to allow building charts
    try:
        tfp_stats_list = pd.read_excel(datapath + 'tfp_'+vintage_name+'.xls', sheet_name='stats', header=0, index_col=0)
    except:
    # if no model_list exist, we create one
        tfp_stats_list = pd.DataFrame(index=countrylist, columns=['model', 'beta', 'const', 'cor_cu_cycle'])

    try:
        prev_tfp_stats_list = pd.read_excel(projpath + prev_vintage_name + '/tfp_'+prev_vintage_name+'.xls', header=0, index_col=0, sheet_name='stats')
    except:
        prev_tfp_stats_list = None

    prev_nawru_data_exists = True
    try:
        prev_nawru_data = pd.read_excel(projpath + prev_vintage_name + '/nawru_'+prev_vintage_name+'.xls', header=0, index_col=0)
    except:
        prev_nawru_data_exists = False


#    nawru_analysis_ok = False
    try:
        nawru_analysis = pd.read_excel(projpath + prev_vintage_name + '/data for NAWRU analysis_'+prev_vintage_name+'.xlsx', header=0, index_col=0)
        nawru_analysis_ok = True
    except:
        nawru_analysis_ok = False
      #  with open(logfile, 'a') as f:
       #     f.write('\n\nWarning : The NAWRU analysis data file could not be read...')

    # we need a list of model version to allow retrieve .sol file with coefficients for module nawru_stats
    try:
        nawru_model_list = pd.read_excel(datapath + 'nawru_'+vintage_name+'.xls', sheet_name='model_versions', header=0, index_col=0, squeeze=True)
    except:
    # if no model_list exist, we create one
        nawru_model_list = pd.Series(np.nan, index=countrylist)

    # we need a list of model version to allow retrieve .sol file with coefficients for module monitor
    try:
        prev_nawru_model_list = pd.read_excel(projpath + prev_vintage_name + '/nawru_'+prev_vintage_name+'.xls', header=0, index_col=0, sheet_name='model_versions', squeeze=True)
    except:
    # if no model_list exist, we create one, there is much chances that the model version will be mf
        prev_nawru_model_list = pd.Series('mf', index=countrylist)

    try:
        tfp_dummies = pd.read_excel(datapath + 'tfp_'+vintage_name+'.xls', sheet_name='dummies', header=0, index_col=0)
    except:
    # if no dummies list exist, we create one
        tfp_dummies = None

    try:
        nawru_dummies = pd.read_excel(datapath + 'nawru_'+vintage_name+'.xls', sheet_name='dummies', header=0, index_col=0)
    except:

    # if no dummies list exist, we create one
        nawru_dummies = None


    try:
        prev_nawru_dummies = pd.read_excel(projpath + prev_vintage_name + '/nawru_'+prev_vintage_name+'.xls', header=0, index_col=0, sheet_name='dummies', squeeze=True)
    except:
        pass

    # -------------------------------------------------
    #               OUTPUT INITIALISATION
    # -------------------------------------------------

    srkf_output = pd.DataFrame(index=range(OutStartYear,changey + 21))
#    nawru_output = pd.DataFrame(index=range(OutStartYear,changey + 11))
    nawru_output = pd.DataFrame(index=range(OutStartYear,changey + 21)) # 2021/03/10
    outlook = pd.DataFrame(index=countrylist,
                           columns=['YPOTg_' + str(changey - 3), 'YPOTg_' + str(changey - 2), 'YPOTg_' + str(changey - 1),
                                    'YPOTg_' + str(changey), 'YGAP_' + str(changey - 3), 'YGAP_' + str(changey - 2),
                                    'YGAP_' + str(changey - 1), 'YGAP_' + str(changey)])

    # TODO : if I want data for EUCAM Light, I should not run estimations
    # TODO DEBUG this switch is activated manually -> = 'Y'

    nawru_table_request = 'N'
    try:
        nawru_table_request = confignml.loc['nawru_table', 'value'].upper()
    except:
        pass

    lightprep_request = 'N'
    #lightprep_request = 'Y'
    if lightprep_request == 'Y' or nawru_table_request == 'Y':
        with open(logfile, 'a') as f:
            f.write('\n\n WARNING : EUCAM Light data or NAWRU table creation activated, skipping other estimations!\n')
        tfp_countrylist = ''
        nawru_countrylist = ''
        og_countrylist = ''
    # we alter the main output file only if any YGAP is requested
    if not og_countrylist == '':
        outputfile = ExcelWriter(projpath + vintage_name + '/EUCAM_output_' + vintage_name + '.xlsx')
        ones.loc[OutStartYear:changey + clos_nb_y].to_excel(outputfile, sheet_name='EUCAM_output', startcol=0,
                                                            index=True, index_label='YEAR')
        excelcolumn = 1

    chart_only = False
    if og_countrylist == '' and tfp_countrylist == '' and nawru_countrylist == '' and lightprep_request != 'Y' and nawru_table_request != 'Y':
        chart_only = True
        print('\n\nNo estimation requested, entering in TFP chart creation mode (' +vintage_name + ' VS '+ prev_vintage_name + ')\n')
        with open(logfile, 'a') as f:
            f.write('\n\nNo estimation requested, entering in TFP chart creation mode (' +vintage_name + ' VS '+ prev_vintage_name + ')\n')

        # ----------------------------------------------------------------------------------------
    #
    #                            LET'S START NOW!
    #
    # ----------------------------------------------------------------------------------------
    for country in countrylist:
        og_data = pd.DataFrame(index=range(1960, changey + 11))

        og_data = pd.concat([og_data,ameco[ameco.columns[pd.Series(ameco.columns).str.startswith(country + '_')]]], axis=1)
        og_data['CONST'] = 1.
        construct_data = pd.DataFrame(index=range(1960, changey + 11))
        nawru_fig_ok = False
        tfp_fig_ok = False
        tfp_chart_possible = True
        ygap_fig_ok = False

    #
    # ----------------------------------------------------------------------------------------
    #
    #               TREND TFP (SRKF) ESTIMATIONS VIA GAP50.DLL or HP filter
    #
    # ----------------------------------------------------------------------------------------
        srkf_exists = True
        try:
            srkf_output[country + '_sr'] = srkf_exog[country + '_sr']
        except: pass
        try:
            srkf_output[country + '_srkf'] = srkf_exog[country + '_srkf']
        except:
            srkf_exists = False

        if srkf_exists:
            try: srkf_output[country + '_sr_hp'] = srkf_exog[country + '_sr_hp']
            except: pass
            try: srkf_output[country + '_cubs'] = srkf_exog[country + '_cubs']
            except: pass
            try: srkf_output[country + '_gap_cu_ext'] = srkf_exog[country + '_gap_cu_ext']
            except: pass
            try: srkf_output[country + '_tfpf'] = srkf_exog[country + '_tfpf']
            except: pass

        if country in tfp_countrylist or country in og_countrylist:
            og_data = pd.concat([og_data, tfp_prep.tfp_prep(country, ameco, cubs, confignml, changey,
                                                          changey + yf, olslog)], axis=1)
        if country in tfp_countrylist:
            with open(logfile, 'a') as f:
                f.write("\n" + country.upper())
            if confignml['TFP_' + country]['method'] == 'HP':
                og_data['SRKF'] = og_data['srhp']
                tfp_stats_list.loc[country, 'beta'] = 0
                tfp_stats_list.loc[country, 'const'] = 0
                with open(logfile, 'a') as f:
                    f.write("---Trend TFP is estimated using HP filtered TFP (SRKF value is set to SRHP) ->PASSED")
                tfp_modelversion = 'HP'
                gap_exec = False
            else:
                est_type = 'tfp'
                adjfact = []
                nml = datapath + confignml['TFP_' + country]['namelistname']
                gaptimer = np.datetime64(datetime.datetime.now())
                gapparam, gapresult, gap_sr_ext, gap_cu_ext, tfp_modelversion, dummies = jrc_gaptools.rungap50(country, og_data, adjfact, vintage_name, changey,
                                                        loc_path, est_type, logfile, nml)
                og_data = pd.concat([og_data, gapresult], axis=1)
                gap_exec = True
                # we prepare the dataframe for dummies to be written in the TFP data file
                # if there is no dummies DF we can copy the dummies directly
                if tfp_dummies is None:
                    tfp_dummies = dummies
                # if previous dummies exist we replace them by current ones
                else:
                    # before copying current dummy series, we have to remove dummies that might exist from previous rum
                    existingdum = [col for col in tfp_dummies if col.startswith(country + '_dum')]
                    tfp_dummies = tfp_dummies.drop(existingdum, axis=1)
                    # then we can concatenate series identified as dummies
                    tfp_dummies = pd.concat([tfp_dummies, dummies], axis=1)

                tfp_stats_list.loc[country, 'beta'] = gapparam[402, 6]
                tfp_stats_list.loc[country, 'const'] = gapparam[402, 24]

                with open(logfile, 'a') as f:
                    f.write(' Time spent for computations : '+str(np.datetime64(datetime.datetime.now())-gaptimer))

            tfp_stats_list.loc[country, 'model'] = tfp_modelversion
            corstart = max(int(og_data['CU'].first_valid_index()), int(og_data['SRKF'].first_valid_index()))
            tfp_stats_list.loc[country, 'cor_cu_cycle'] = og_data.loc[corstart:, 'CU'].corr(
                (og_data.loc[corstart:, 'SR'] - og_data.loc[corstart:, 'SRKF']) * 100)
            srkf_output[country + '_sr'] = og_data['SR']
            srkf_output[country + '_srkf'] = og_data['SRKF']
            srkf_output[country + '_sr_hp'] = og_data['srhp']
            srkf_output[country + '_cubs'] = og_data['CU']
            if gap_exec:
                srkf_output[country + '_gap_cu_ext'] = gap_cu_ext
                srkf_output[country + '_tfpf'] = gap_sr_ext


            srkf_exists = True

        elif country in og_countrylist:
            with open(logfile, 'a') as f:
                f.write('\n'+ country.upper() + '---NO Trend TFP estimations requested in parameter file')
            if srkf_exists:
                with open(logfile, 'a') as f:
                    f.write(', found existing Trend TFP estimations in data file, will use it.')
                og_data['SRKF'] = srkf_exog[country + '_srkf']
                # og_data['SR'] = srkf_exog[country + '_sr'] (2021/03/29) exog may not have SR or cubs
                # og_data['CU'] = srkf_exog[country + '_cubs']
            else:
                with open(logfile, 'a') as f:
                    f.write(', no existing Trend TFP estimations found in data file.')

        if chart_only:
            if srkf_exists:
                select_col = [col for col in srkf_exog if col.startswith(country)]
                tfp_data = srkf_exog[select_col]
                columns = list(tfp_data.columns)
                for i in range(0, len(tfp_data.columns)):
                    columns[i] = columns[i][3:]
                tfp_data.columns = columns
                try:
                    og_data.loc[:, 'SR'] = tfp_data['sr']
                    og_data.loc[:, 'CU'] = tfp_data['cubs']
                    og_data.loc[:, 'SRKF'] = tfp_data['srkf']
                    og_data.loc[:, 'srhp'] = tfp_data['sr_hp']
                    og_data.loc[:, 'wsrhp'] = tfp_data['sr_hp'].diff()
                except:
                    with open(logfile, 'a') as f:
                        f.write('\nNO chart possible, at least one of the following data is missing for ' + country + ':'+
                                '\n        cubs, srkf and sr_hp.\n')
            else:
                with open(logfile, 'a') as f:
                    f.write('\nNO chart possible, please provide TFP data for ' + country)

        if srkf_exists and prev_tfp_exists and (country in tfp_countrylist or chart_only) and not debug:
            try:
                prev_tfp_stats = list(prev_tfp_stats_list.loc[country])
            except:
                tfp_chart_possible = False
                with open(logfile, 'a') as f:
                    f.write('\nNO chart possible, please provide (stats) sheet in TFP data file for PREVIOUS VINTAGE')
            if tfp_chart_possible:
                tfp_stats = list(tfp_stats_list.loc[country])
                tfp_modelversion = tfp_stats[0]
                tfp_fig = monitor.tfp(og_data, tfp_stats, prev_tfp_stats, changey, vintage_name, prev_tfp, country, prev_vintage_name, prev_changey)
                tfp_fig_ok = True
                print('\n-----TFP chart completed for ' + country + '\n')
                with open(logfile, 'a') as f:
                    f.write('\n-----TFP chart completed for ' + country + '\n')
            else:
                with open(logfile, 'a') as f:
                    f.write('\n-----TFP chart not completed for ' + country + '\n     previous tfp stats not available\n')
        elif not prev_vintage_exists:
            with open(logfile, 'a') as f:
                f.write('-----Ploting not possible for ' + country + ' , previous vintage could not be read.')
    #
    #
    # ----------------------------------------------------------------------------------------
    #
    #                   NAWRU ESTIMATIONS VIA GAP50.DLL or HP filter
    #
    # ----------------------------------------------------------------------------------------
        # nawru_chart_ok if the program runs the dll computation and do not use exogenous data
        # this because we need bounds, model version,... to build the charts
        nawru_chart_ok = False
        nawru_exists = True
        try:
            #nawru_output[country + '_NAWRU'] = nawru_exog[country + '_NAWRU']
            nawru_output[country + '_NAWRU'] = nawru_exog[country + '_nawru'] # (2021/03/29) compatibility with lowercase exog
        except:
            nawru_exists = False
        if nawru_exists:
            # TODO : it could occur that NAWRU is provided without fit, endogenous series or UR

            try:endo_nawru = nawru_exog[nawru_exog.columns[
                pd.Series(nawru_exog.columns).str.startswith(country + '_endo')]].iloc[:, 0]
            except: pass
            try:fitted_values = nawru_exog[country + '_fitted_values']
            except: pass
            try:nawru_output[endo_nawru.name] = endo_nawru
            except: pass
            try:nawru_output[country + '_fitted_values'] = fitted_values
            except: pass
            #nawru_output[country + '_UnEmpl_Rate'] = nawru_exog[country + '_UnEmpl_Rate'].copy() # (2021/03/29) compatibility with lowercase exog
            try:nawru_output[country + '_UnEmpl_Rate'] = nawru_exog[
                country + '_unempl_rate'].copy()  # (2021/03/29) compatibility with lowercase exog
            except:
                pass
            nawru_modelversion = 'mf'

        if country in nawru_countrylist:
            if 'LUR' not in og_data.columns:
                og_data['LUR'] = ameco[country + '_lur']
            if confignml['NAWRU_' + country]['method'] == 'HP':
                # ===========
                # * Autumn Final 2018
                # * since the wage indicator gives the wrong signal for IE nawru, replace the nawru by a simple HP (lurharm)
                # *===========
                nblag = int(confignml['hp_nawru_' + country]['ARorder'])
                const = bool(confignml['hp_nawru_' + country]['Constant'])
                ar_start = int(confignml['hp_nawru_' + country]['ARstartingyear'])
                hplambda = int(confignml['hp_nawru_' + country]['Lambda'])
                hpstart = int(confignml['hp_nawru_' + country]['HPstartingyear'])

                with open(olslog, 'a') as f:
                    f.write('\n\n\n'+ country.upper() +' - - -LURHARM OLS_AR\n')
                og_data['LUR'] = ols_ar.ols_ar(og_data['LUR'], nblag, const, ar_start, changey, yf, olslog)
                cycle, lurharms = sm.tsa.filters.hpfilter(og_data.loc[int(hpstart):changey + yf, 'LUR'], hplambda)

                lurharms[changey + 1] = lurharms[changey] + .5 * (lurharms[changey] - lurharms[changey - 1])
                lurharms.loc[changey + 2:] = lurharms[changey + 1]

                og_data['NAWRU'] = lurharms
                nawru_output[country + '_endo_none-hp'] = np.nan
                # TODO : here should be a line that delete the previous ENDO in nawru_output in case the endogenous changes
                endo_nawru = nawru_output[country + '_endo_none-hp']
                nawru_output[country + '_fitted_values'] = np.nan
                # TODO : DEBUG test with chart and HP filter
                nawru_chart_ok = True

                with open(logfile, 'a') as f:
                    f.write("\n---NAWRU is estimated using HP filtered UR ->PASSED")
                nawru_modelversion = 'HP'

            else:
                # first we drop dummies that might exist from Trend TFP estimation
                dumcol = [col for col in og_data if col.startswith('dum')]
                og_data = og_data.drop(dumcol, axis=1)
                og_data = pd.concat([og_data, nawru_prep.nawru_prep(country, ameco, confignml, changey)], axis=1)
                est_type = 'nawru'
                adjfact = float(confignml['hp_nawru_' + country]['Adjfactor'])
                nml = datapath + confignml['NAWRU_' + country]['namelistname']
                gaptimer = np.datetime64(datetime.datetime.now())
                # call of the GAP.DLL
                gapresult, nawru_modelversion, dummies = jrc_gaptools.rungap50(country, og_data, adjfact, vintage_name, changey,
                                                                 loc_path, est_type, logfile, nml)

                # we prepare the dataframe for dummies to be written in the NAWRU data file
                # if there is no dummies DF we can copy the dummies directly
                if nawru_dummies is None:
                    nawru_dummies = dummies
                # if previous dummies exist we replace them by current ones
                else:
                    # before copying current dummy series, we have to remove dummies that might exist from previous rum
                    existingdum = [col for col in nawru_dummies if col.startswith(country + '_dum')]
                    nawru_dummies = nawru_dummies.drop(existingdum, axis=1)
                    # then we can concatenate series identified as dummies
                    nawru_dummies = pd.concat([nawru_dummies, dummies], axis=1)

                # nawru_dummies.columns = [country + '_' + col if col.startswith('dum') else col for col in nawru_dummies]
                nawru_chart_ok = True
                try:
                    gapresult['NAWRU'] = nawru_prep.extend(gapresult['NAWRU'], hpur_pct[country+'_HP_LURHARM'])
                except:
                    hpur_pct = False
                og_data = pd.concat([og_data, gapresult], axis=1)
                # ols function needs NaN instead of -99999.0 to work (-99999.0 are requested by GAP.DLL)
    #            og_data[og_data < -90000] = np.nan

                with open(logfile, 'a') as f:
                    f.write(' Time spent for computations : '+str(np.datetime64(datetime.datetime.now())-gaptimer) )
                endo_nawru = og_data[og_data.columns[pd.Series(og_data.columns).str.startswith(country+'_endo')]].iloc[:,0]
                nawru_output[endo_nawru.name] = endo_nawru
                fitted_values = og_data['fitted values']
                nawru_output[country + '_fitted_values'] = og_data['fitted values']

            nawru_model_list.loc[country] = nawru_modelversion
            nawru_exists = True
            nawru_output[country + '_NAWRU'] = og_data['NAWRU']
            # TODO :  test of adding the other necessary series to plot charts
            nawru_output[country + '_UnEmpl_Rate'] = og_data['LUR']

        elif country in og_countrylist:
            with open(logfile, 'a') as f:
                f.write('\n' + country.upper() + '---NO NAWRU estimations requested in parameter file')
            if nawru_exists:
                with open(logfile, 'a') as f:
                    f.write(', found previous NAWRU estimations in data file, will use it.')
                #og_data['NAWRU'] = nawru_exog[country + '_NAWRU']
                og_data['NAWRU'] = nawru_exog[country + '_nawru'] # (2021/03/29) compatibility with lowercase exog



    # TODO : nawru_chart_ok variable was created as necessary chart data was not in the NAWRU file
    #    This was changed so the nawru_chart_ok variable could be removed
        if nawru_exists and prev_nawru_data_exists and country in nawru_countrylist and not debug:
        # og_data[og_data < -90000] = np.nan
            if 'LUR' not in og_data.columns:
                og_data['LUR'] = ameco[country + '_lur']
            try:
                prev_model = prev_nawru_model_list[country]
            except:
                with open(logfile, 'a') as f:
                    f.write('no chart possible, please provide NAWRU series (model version) for PREVIOUS VINTAGE')
            nawru_fig = monitor.nawru(projpath, vintage_name, country, og_data , prev_nawru_data, changey, prev_vintage_name, prev_changey, confignml, loc_path, logfile, endo_nawru, fitted_values, nawru_modelversion, prev_model, prev_nawru_dummies)
            nawru_fig_ok = True
        elif not prev_nawru_data_exists:
            with open(logfile, 'a') as f:
                f.write('-----Ploting not possible, previous vintage could not be read.')

    # ----------------------------------------------------------------------------------------
    #
    #                       YGAP ESTIMATIONS
    #
    # ----------------------------------------------------------------------------------------

        if country in og_countrylist:
            # TODO 12/2021 try to remove next line and that there is -99999 only in GAP module
#            og_data = og_data.replace(-99999.0, np.nan)
            do_og_estimations = True
            with open(logfile, 'a') as f:
                f.write('\n' + country.upper() + '---Computing YGAP estimations')
            print(country.upper() + '---Computing YGAP estimations')
            if not srkf_exists:
                with open(logfile, 'a') as f:
                    f.write('\n-----SRKF is missing, YGAP estimation is not possible')
                print('-----SRKF is missing, YGAP estimation is not possible')
                do_og_estimations = False
            if not nawru_exists:
                with open(logfile, 'a') as f:
                    f.write('\n-----NAWRU is missing, YGAP estimation is not possible')
                print('-----NAWRU is missing, YGAP estimation is not possible')
                do_og_estimations = False
            if not do_og_estimations:
                with open(logfile, 'a') as f:
                    f.write('\n-----NO YGAP estimation possible')
                print('-----NO YGAP estimation possible')
                continue

            og_data = og_prep.og_prep(country, ameco, og_data, popproj, confignml, changey, yf, olslog)

    # Some data is extracted from the main DataFrame for ease of code reading
            ypot = og_data['ypot']
            dep = og_data['dep']
            k = og_data['k']
            iypot = og_data['iypot']
            ygap = og_data['ygap']
            totalh_mt = og_data['totalh_mt']
            iq = og_data['iq']
            y = og_data['y']
            sr = og_data['SR']
            srkf = og_data['SRKF']
            totalhs = og_data['totalhs']

            x0= [ypot[changey], k[changey], iq[changey], y[changey], sr[changey]]     # initial guesses

            for t in range (changey + 1, changey + clos_nb_y + 1):
                params = [totalhs[t], srkf[t], dep[t], k[t - 1], iypot[t],
                          ygap[t], totalh_mt[t], alpha]
                x0 = fsolve(modeltosolve.modeltosolve, x0, params)
                [ypot[t], k[t], iq[t], y[t], sr[t]] = x0

            og_data['SR'] = sr
            og_data['YGAP'] = ygap
            wsr = sr.diff()

            if country in ['be', 'dk', 'de', 'ie', 'el', 'es', 'fr', 'it', 'lu', 'nl', 'at', 'pt', 'fi', 'se', 'uk', 'us']:
                construct_data['civ_empl'] = ameco[country + '_sle']
            else:
                construct_data['civ_empl'] = ameco[country + '_sled']
            # TODO 12/2021 try to remove next line and that there is -99999 only in GAP module
            # og_data[og_data == -99999.0] = np.nan

            output = pd.concat([y,
                                ygap,
                                og_data['ygaphp'],
                                ypot,
                                og_data['yhp'],
                                og_data['part_mt'],
                                og_data['parts'],
                                # og_data['wsr']*100, # that series comes from AR forecast
                                wsr*100, # that series is the one correcponding to the EUCAM model (2021/03/30)
                                og_data['wsrkf']*100,
                                og_data['NAWRU'],
                                og_data['lurharm_mt'],
                                og_data['hpere_mt'],
                                iq,
                                og_data['lfss'],
                                og_data['lp2'],
                                totalhs,
                                og_data['l_mt'],
                                totalh_mt,
                                k,
                                og_data['nwinf'],
                                construct_data['civ_empl'],
                                og_data['popw'],
                                og_data['popt'],
                                sr,
                                og_data['srhp'],
                                srkf,
                                dep,
                                ameco[country + '_er'],
                                ameco[country + '_ppp'],
                                ameco[country + '_pgde' ],
                                ameco[country + '_gdpne'],
                                ameco[country + '_gdpn'],
                                ameco[country + '_nulc'],
                                endo_nawru,
                                fitted_values,
                                og_data['CU'],
                                og_data['hperehp'],
                                og_data['whperehp']], axis=1)

            output.columns = [country + '_GDP', country + '_Y_GAP(PF)', country + '_Y_Gap(HP)', country + '_Y_Pot',country + '_Trend_GDP', country + '_Part',
                              country + '_Part_S', country + '_wSR', country + '_wSR_KF', country + '_NAWRU',
                              country + '_UnEmpl_Rate', country + '_HperE', country + '_Investment', country + '_Pot_LF',
                              country + '_Pot_Empl', country+'_Pot_Tot_Hrs', country+'_Empl', country+'_Tot_Hrs',
                              country+'_Capital', country+'_Wage_Infl', country+'_Civ_Empl', country+'_Pop_WA', country+'_Tot_Pop',
                              country+'_SR', country+'_SR_HP', country+'_SR_Kf', country+'_Depreciation', country+'_Exchange rate', country+'_PPS', country+'_GDP deflator_',
                              country+'_Nominal_GDP-e',country+'_Nominal_GDP', country+'_NULC',
                              endo_nawru.name, country + '_fitted_values', country+'_CUBS',
                              country+'_hperehp', country+'_whperehp']

            output.loc[OutStartYear:changey + clos_nb_y].to_excel(outputfile, sheet_name='EUCAM_output',
                                                                  startcol=excelcolumn, index=False, na_rep='#N/A')
            # next line is to  write the full output to have hp GDP for t+10 (2021/05/10)
            # output.loc[OutStartYear:].to_excel(outputfile, sheet_name='EUCAM_output', startcol=excelcolumn, index=False, na_rep='#N/A')

            excelcolumn += 38
            ygap_passed += 1
            ypotg = round(og_data['ypot'].pct_change() * 100, 1)
            outlook.loc[country] = list(ypotg.loc[changey-3:changey])+list(round(ygap.loc[changey-3:changey], 1))

            with open(logfile, 'a') as f:
                f.write('\n\n----------------------------\n' + country.upper() + ' YGAP estimation '
                        '->PASSED\n----------------------------\n')
            print(' ->PASSED')
            if prev_vintage_exists and country in og_countrylist  and not debug:
                ygap_fig = monitor.ygap(og_data, changey, vintage_name, prev_vintage, country, prev_vintage_name, prev_changey)
                ygap_fig_ok  = True
            elif not prev_vintage_exists:
                with open(logfile, 'a') as f:
                    f.write('\n-----Ploting not possible, previous vintage could not be read.')

      #  else:
      #      with open(logfile, 'a') as f:
      #          f.write('\n---NO YGAP estimation requested')
      #      print('---NO YGAP estimation requested')

        if nawru_fig_ok or tfp_fig_ok or ygap_fig_ok:
            pdf_report = PdfPages(
                projpath + vintage_name + '/' + country.upper() + '_MULTI_' + vintage_name + '.pdf')

            if nawru_fig_ok:
                pdf_report.savefig(nawru_fig)
                nawru_report = PdfPages(
                    projpath + vintage_name + '/' + country.upper() + '_NAWRU_' + vintage_name + '_' + nawru_modelversion + '_VS_'+ prev_vintage_name +'.pdf')
                nawru_report.savefig(nawru_fig)
                nawru_report.close()
                nawru_fig.clf()
            if tfp_fig_ok:
                pdf_report.savefig(tfp_fig)
                tfp_report = PdfPages(
                    projpath + vintage_name + '/' + country.upper() + '_TFP_' + vintage_name + '_' + tfp_modelversion + '_VS_'+ prev_vintage_name +'.pdf')
                tfp_report.savefig(tfp_fig)
                tfp_report.close()
                tfp_fig.clf()
            if ygap_fig_ok:
                og_report = PdfPages(
                    projpath + vintage_name + '/' + country.upper() + '_YGAP_' + vintage_name + '_VS_'+ prev_vintage_name + '.pdf')
                og_report.savefig(ygap_fig)
                og_report.close()
                pdf_report.savefig(ygap_fig)
                ygap_fig.clf()

            pdf_report.close()


    with open(logfile, 'a') as f:
        f.write("\n\nYGAP ESTIMATIONS ->PASSED for " + str(ygap_passed) +
                " countries.\nTime spend for the total program run : "
                + str(np.datetime64(datetime.datetime.now()) - current1))
    if ygap_passed == 0 and vintage_exists:
#        eucam_data.loc[OutStartYear:changey + clos_nb_y].to_excel(outputfile, sheet_name='EUCAM_output',
#                                                              startcol=excelcolumn, index=False)
        with open(logfile, 'a') as f:
            f.write('\n\n---YGAP requested for no countries, found previous output file, will keep it unchanged.')
        print('------Previous EUCAM output file was found and kept unchanged\n------'
              '/!\ Values in that file do note take into account Trend TFP or NAWRU just processed.')
    elif not ygap_passed == 0:
        outlook.to_csv(path_or_buf=datapath + 'EUCAM_outlook_' + vintage_name + '.txt', sep=',', index=True,
                       index_label='Country', header=True)

    try: outputfile.close()
    except: pass

    if tfp_countrylist != '':
        srkf_file = ExcelWriter(datapath + 'tfp_'+vintage_name+'.xls')
        # TODO 12/2021 try to remove next line and that there is -99999 only in GAP module
        # srkf_output = srkf_output.replace(-99999.0, np.nan)
        srkf_output.to_excel(srkf_file, sheet_name='EUCAM_TFP')
        tfp_stats_list.to_excel(srkf_file, sheet_name='stats')
        tfp_dummies.to_excel(srkf_file, sheet_name='dummies')
        srkf_file.close()
    # TODO : DEBUG changed output of nawru... should be up to changey

    if nawru_countrylist != '':
        nawru_file = ExcelWriter(datapath + 'nawru_' + vintage_name + '.xls')
        nawru_output.loc[OutStartYear:].to_excel(nawru_file, sheet_name='EUCAM_NAWRU')
        nawru_model_list.to_excel(nawru_file, sheet_name='model_versions')
        nawru_dummies.to_excel(nawru_file, sheet_name='dummies')
        nawru_file.close()

    if nawru_analysis_ok and prev_vintage_exists and nawru_table_request == 'Y':
        # build an excel file with all coef, bounds and t-stats for the vintage
        # t-stats and bounds are used for reporting and the coeficients are used for EUCAM lite
        # nawru_stats.coef_file(countrylist, vintage_name, changey, nawru_modelversion)
        try:
            nawru_data = pd.read_excel(datapath + 'nawru_' + vintage_name + '.xls', index_col=0, header=0)
        except:
            with open(logfile, 'a') as f:
                f.write('\n\n---NAWRU analysis can not be done : missing file ' + 'nawru_' + vintage_name + '.xls\n')
        nawru_analysis = nawru_stats.vintage_compare(nawru_analysis, projpath,  vintage_name, nawru_data, prev_nawru_data, nawru_model_list, changey, confignml)
        nawru_analysis_file = ExcelWriter(datapath+'data for NAWRU analysis_'+vintage_name+'.xlsx')
        nawru_analysis.to_excel(nawru_analysis_file)
        nawru_analysis_file.close()

    aggregates_request = 'n'
    try:
        aggregates_request = confignml.loc['aggregates', 'value'].upper()
    except:
        pass
    if  aggregates_request == 'Y':
        aggregates2.aggregates(outputfile, ameco, changey, changey+yf, OutStartYear, changey + clos_nb_y, alpha)

    try:
        lightprep_request = confignml.loc['EUCAM_light_prep', 'value'].upper()
    except:
        pass
    if lightprep_request == 'Y':
        with open(logfile, 'a') as f:
            f.write('\n\n Creating EUCAM light dataset...\n')
        #eucam_data = pd.read_excel(datapath + 'T+5_2020_AUTUMN_LT_DBP Construct_Aggregates.xlsx', sheet_name='RATS' ,header=2, index_col=0)
        try:
            eucam_data = pd.read_excel(datapath + 'EUCAM_output_' + vintage_name + '.xlsx', header=0, index_col=0)
        except:
            with open(logfile, 'a') as f:
                f.write('\n\n---EUCAM light baseline creation : could not find EUCAM_output_' + vintage_name + '.xlsx\n')

        data_extend = pd.DataFrame(np.nan, index=range(eucam_data.index[-1] + 1, changey + 11), columns=eucam_data.columns)
        eucam_data = eucam_data.append(data_extend, verify_integrity=True)

        #data_country_list = og_countrylist
        data_country_list = list(eucam_data.columns[eucam_data.columns.str.contains('_wSR_KF')].str[0:2])
        for country in  data_country_list:
            try:
                #eucam_data[country + '_SR'] = srkf_exog[country + '_gap_sr_ext']
                eucam_data[country + '_SR'] = srkf_exog[country + '_tfpf']
            except:
                with open(logfile, 'a') as f:
                    f.write('\n---EUCAM light baseline creation : could not find gap extended SR for ' + country + '  in tfp data file\n      using EUCAM model SR (shorter)')
            try:
                eucam_data[country + '_SR_Kf'] = srkf_exog[country + '_srkf']

            except:
                with open(logfile, 'a') as f:
                    f.write('\n---EUCAM light baseline creation : could not find srkf for ' + country + '  in tfp data file\n      using EUCAM output srkf (shorter)')
        lightdatafile = ExcelWriter(datapath + 'EUCAM_light_data_' + vintage_name + '.xlsx')
        lightdata = light_inputdata.prep(ameco, eucam_data, popproj, projpath, changey, vintage_name, data_country_list,
                                         nawru_model_list, yf)
        lightdata.to_excel(lightdatafile, index_label='YEAR',  na_rep='#N/A')
        lightdatafile.close()
        with open(logfile, 'a') as f:
            f.write('\n\nEUCAM light data prep is completed!\n')

    # ------------------------------------------------------------
    #                    THIS IS THE END OF THE START
    # ------------------------------------------------------------


if __name__ == '__main__':
    main()