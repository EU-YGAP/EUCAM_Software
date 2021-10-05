"""
# --------------------------------------------------------------------------------------------------------
# 
# Python code written by C.Planas and A.Rossi at
# the Joint Research Centre (JRC) of the European Commission
#
# Modified by François Blondeau (European Commisssion, Directorate-General for Economic and Financial Affairs)
#
# The original code was modified mainly to work with Excel data files using Pandas library instead
# of using a tree structure (Anytree library).
#
#
# GAP50.DLL is developped at the JRC computes Trend TFP and NAWRU estimation 
# as discussed in  K. Havik, K. Mc Morrow, F. Orlandi, C. Planas, R. Raciborski,
# W. Röger, A. Rossi, A. Thum-Thysen, V. Vandermeulen, (2014), "The Production Function
# Methodology for Calculating Potential Growth Rates & Output Gaps", Economic Papers 535,
# Economic and Financial Affairs.
#
# --------------------------------------------------------------------------------------------------------
"""
# Run gap50.dll


def rungap50(country, data, adjfact, vintage_name, changey, path, tipo, logfile, nmlfromconfig=None, modelversion=None):
    import ctypes as ct
    import pandas as pd
    from _ctypes import FreeLibrary
    import f90nml
    import os
    import datetime
    import numpy as np

    projpath = path+'/'
    path = path + '$'                                # add to find end of dtring
    dllfile = "GAP50DLL.dll" # we will not change the file name anymore to allow automatic update
    dllversion="20201026" # see comment line 146 when using different version of the DLL
#    dllversion="GAP50DLL20190503.dll" # see comment line 146

    with open(logfile, 'a', encoding='utf-8') as f:
        f.write('\n' + country.upper() +' ---computing ' + tipo.upper() + ' via GAP50DLL.dll v.' + dllversion)
    lib = ct.CDLL(projpath+"bin/"+dllfile)

    print( country.upper() +' ---computing ' + tipo.upper() + ' via GAP50DLL.dll v.' + dllversion)

    gap50 = getattr(lib, "pytogap")
    if 'testrun' in vintage_name:
        testrun = True
        vintage_name = vintage_name.replace('testrun', '')
        nmlpath = projpath + '/' + vintage_name + '/' + country.upper() + '_' + tipo.upper() + '_' + vintage_name + '_' + modelversion + '.nml'
    else:
        testrun = False
        nmlpath = nmlfromconfig
        modelversion = nmlpath[nmlpath.rfind('_') + 1:nmlpath.find('.nml')]

    nml    = f90nml.read(nmlpath)

    # I set manually the burnins here to override the nml specs
    fast_tfp = False
    if tipo.lower() == 'tfp' and fast_tfp == True:
        burnins= 500
        simulrec = 500
        nml['mcmc']['burnin'] = burnins
        nml['mcmc']['simulrec'] = simulrec
        with open(logfile, 'a', encoding='utf-8') as f:
            f.write('\n\n' + country.upper() + ' ---WARNING WARNING WARNING : burnins was manually lowered to ' + str(burnins)+'!\n')


    nmlstr = str(nml)
    nt   = len(nml['prior']['lab'])       # number of parameters
    ny   = len(nml['ssm']['endogenous'])  # number of endogenous series
    inter = nml['GAP']['Inter']           # INTER: 1=(Back,PC),2=(Back,Cycle),3=(Forw,PC),4=(Forw,Cycle)
    hor  = max(0,nml['GAP']['Anchor'][1]) # horizon for anchored estimates
    # TODO : if there are missing data points, we should override the namelist setting for the start year (2021/03/16)
    # todo : for this we need to have the endo and exo list, we move this code after setting of namelist
    # starty = nml['GAP']['Startyear'] # commented on 2021/03/16


    stri = str(nml['ssm']['exogenous'])
    pos  = list(find_all(stri, ','))

    if len(stri) > 0:
        nz =  len(pos) + 1                   # number of exogenous series
    else:
        nz = 0

    name_vars = list()

    if tipo == 'nawru':
        name_vars.append('LUR')
        lastobsyear = data['LUR'].last_valid_index()
        # we need to have starty to comute nmax (2021/03/16)
        # nmax = data['LUR'].last_valid_index() - starty + 1  # 2021/03/09
        nf = hor
    else:
        name_vars.append('SR')
        lastobsyear = data['SR'].last_valid_index()
        # we need to have starty to comute nmax (2021/03/16)
        # nmax = data['SR'].last_valid_index() - starty + 1 # 2021/03/09
        nf = 10
    if tipo == 'nawru':
        if 'W_ENDO_IND' in data.columns:# (20210903)
            name_vars.append('W_ENDO_IND')# (20210903)
        else:# (20210903)
            if inter < 3:
                name_vars.append('DWINF')
            else:
                name_vars.append('DRULC')
    # TODO : DEBUG
    # else:
     #   name_vars.append('CU')
    elif ny == 2:
        name_vars.append('CU')
    if nz == 1:
        name_vars.append(stri.strip())
    if nz > 1:
        name_vars.append(stri[0:pos[0]].strip())
        for i in range(0,len(pos)-1):
            name_vars.append(stri[pos[i]+1:pos[i+1]].strip())
        name_vars.append( stri[pos[len(pos)-1]+1:].strip())
   # nmax = changey - starty + 1 (commented on 2021/03/09)

    # if we want to be able to have observations beyond t+2 we have to adjust "data" df to go up to t+2 + nf (2021/03/10)
    # data_extend = pd.DataFrame(np.nan, index=range(data.index[-1]+1, changey+nf+1), columns=data.columns)
    # data must go up to last observation + max(nf,hor) (2021/09/02)
    data_extend = pd.DataFrame(np.nan, index=range(data.index[-1] + 1, lastobsyear + max(nf,hor) + 1), columns=data.columns)
    data = data.append(data_extend,verify_integrity=True)
    try: data['CONST'] = 1.
    except: pass


    # the creation of dummies is done from the nml file we use name_vars
    dummies = pd.DataFrame(index=data.index)
    for i in range(len(name_vars)):
        if 'dum' in name_vars[i].lower():
            name = name_vars[i]
            nmlstr = nmlstr.replace(name, name[0:4])
            dummies[name[0:4]] = 0.
            dumsplit = name.split('(')
            for j in dumsplit[1:]:
                year, value = j.split(')')
                dummies.loc[int(year), name[0:4]] = float(value)
            name_vars[i] = name[0:4]

    data = pd.concat([data, dummies], axis=1)
    dummies.columns = [country + '_' + col for col in dummies]


    if tipo == 'nawru':
        # TODO : we want to find the first valid year for all explanatory var (2021/03/16)
        var_starty_list = list()
        for column in name_vars:
            var_starty_list.append(data[column].first_valid_index())
        starty = max(nml['GAP']['Startyear'], max(var_starty_list))
        if starty > nml['GAP']['Startyear']:
            with open(logfile, 'a', encoding='utf-8') as f:
                f.write('\n' + country.upper() + ' ---WARNING : Starting year in namelist is '+ str(nml['GAP']['Startyear'])+', allowed by exogenous var is '+  str(starty))

        # we need to know the variable list to select automatically the starting year (2021/03/16)
        nmax = data['LUR'].last_valid_index() - starty + 1  # moved here on 2021/03/16
    else:
        starty =max(nml['GAP']['Startyear'], data['SR'].first_valid_index())
        # we need to know the variable list to select automatically the starting year (2021/03/16)
        nmax = data['SR'].last_valid_index() - starty + 1  # moved here on 2021/03/16


    #TODO : 12/2021
    data = data.fillna(-99999.0) # moved here on 2021/03/16 to allow searching for the first data point

    # Select variables
#    (inds,indn,xn) = selectdata(data, changey, name_vars[0:ny], nmax)
    (inds,indn,xn) = selectdata(data, lastobsyear+max(nf,hor), name_vars[0:ny], nmax+max(nf,hor)) # (2021/03/09)
    ismax1 = np.amax(inds)    # maximum missing position
    ismax2 = 0
    # TODO DEBUG next line is original
#    if nz > 1:  #number of exog series
# TODO DEBUG change of starting element to allow selectdata to look for CONST series as well
    if nz > 0:  # number of exog series
        # TODO £DEBUG next line is original one
        # (indse, indne, xne) = selectdata(data, changey, name_vars[ny+1:], nmax)
        # TODO next line is a test to use selectdata to build the CONST as well
        #(indse, indne, xne) = selectdata(data, changey, name_vars[ny:], nmax)
        (indse, indne, xne) = selectdata(data, lastobsyear+max(nf,hor), name_vars[ny:], nmax+max(nf,hor)) # (2021/03/09)
        # filling NAN with -9999 is problématic for exogenous variables -> replacing with 0.0 (20210902)
        xne = np.where(xne == -99999.0, 0.0, xne)# (20210902)
        ismax2 = np.amax(indse)   # maximum missing position
    ismax = max(ismax1,ismax2)
    nobs  = nmax-ismax             # number of in-sample observations
    yk = np.arange(0, ny+nz, dtype=float)*0  # setup the nobs+nf - long
    for i in range(0, nobs+max(nf,hor)-1):            # concatenate columns until it is nrow x ncol

        yk = np.c_[yk, np.arange(0, ny+nz, dtype=float) * 0]
    yk[0:ny,0:nobs] = xn[0:ny,ismax:nobs+ismax]
    yk[0:ny,nobs:]  = -99999.0
    if nz > 0:
        # next line is original
        # yk[ny,:] = 1.0   # set the constant series
        # TODO DEBUG try to change exog series organisation
        # yk[ny+3,:] = 1.0   # set the constant series
    # if nz > 1:
            # next line is original
        # yk[ny+1:,0:nobs] = xne[0:,ismax:nobs+ismax]
        # TODO DEBUG try to change exog series organisation
        # we put XNE values to YK
        # yk[ny:,0:nobs] = xne[0:,ismax:nobs+ismax] # 2021/03/16 we add max(hor,nf) as we handle the end of the series
            # using a dataframe + fill with -99999.0
        yk[ny:, 0:nobs+max(hor,nf)] = xne[0:, ismax:nobs + ismax + max(hor,nf)] # modified 2021/03/16

        # TODO this next BLOCK1 is replaced by BLOCK2
        # we remove this as it is problematic with dummies (some are level shift dummy some are temporary) 2021/03/10
        # for j in range(nobs,nobs+max(nf,hor)):
            # yk[ny+1:,j] = 0
            # next one works
            # yk[ny+1:,j]  = xne[0:,nobs+ismax-1]
            # TODO DEBUG = extend dummy when put in position index 2 where CONST was for TFP
            # we remove this as it is problematic with dummies (some are level shift dummy some are temporary) 2021/03/10
            # yk[ny:,j]  = yk[ny:,nobs+ismax-1]
# END BLOCK1
# TODO DEBUG BLOCK2 : try to replace values beyond last obs with 0. if not the constant series
# This is not valid as dummy for IE is level dummy, value must be kept from t+3 to t+10
#        for i in range(ny, ny+nz):
#            if name_vars[i].lower() == 'const':
#                for j in range(nobs,nobs+max(nf,hor)):
#                    yk[i,j] = yk[i,nobs+ismax-1]
#            else:
#                for j in range(nobs, nobs + max(nf, hor)):
#                    yk[i,j] = 0.
# END BLOCK2

# Set other dll Input
    b_string0 = nmlstr.encode('utf-8')
    b_string1 = path.encode('utf-8')
    #
    # 26/10/2020 string that contains the namelist was enlarged by Alessandro and Christophe from 5000 to 10000 chars
    # next line is for version 20190503 of the DLL :
#    arr = (ct.c_char * 5000 * 2)()
    # next line is for version 20201026 of the DLL :
    arr = (ct.c_char * 10000 * 2)()
    arr[0].value = b_string0
    arr[1].value = b_string1
    nstring = ct.pointer(ct.c_int(2))
    nobsp = ct.pointer(ct.c_int(nobs))   # setup the pointer
    nyp   = ct.pointer(ct.c_int(ny))
    nzp   = ct.pointer(ct.c_int(nz))
    nfp   = ct.pointer(ct.c_int(nf))
    horp  = ct.pointer(ct.c_int(hor))
    ntp   = ct.pointer(ct.c_int(nt))

# Set dll Output
# Both ML and Bayes
    unobs = np.arange(0, 26, dtype=float) * 0  # setup the nobs+nf - long
    for i in range(1, nobs+max(nf, hor)):      # concatenate columns until it is nrow x ncol
            unobs = np.c_[unobs, np.arange(0, 26, dtype=float) * 0]
# Bayes
    # TODO DEBUG : next lines are the first version of the DLL
#    ac = np.arange(0, 4*ny, dtype=float)*0  # setup the nobs+nf - long
#    for i in range(1, 5):                   # concatenate columns until it is nrow x ncol
#            ac = np.c_[ac, np.arange(0, 4*ny, dtype=float) * 0]
#    param = np.arange(0, nt, dtype=float)*0  # setup the nobs+nf - long
#    for i in range(1, 409):                   # concatenate columns until it is nrow x ncol
#        param = np.c_[param, np.arange(0, nt, dtype=float) * 0]
#    marginal = np.arange(0, nobs+nf, dtype=float)*0  # setup the nobs+nf - long
#    for i in range(1, 1200):                   # concatenate columns until it is nrow x ncol
#        marginal = np.c_[marginal, np.arange(0, nobs+nf, dtype=float) * 0]
#    margl = np.arange(0, 13, dtype=float)*0  # setup the nobs+nf - long
#    for i in range(1, 2):                   # concatenate columns until it is nrow x ncol
#        margl = np.c_[margl, np.arange(0, 13, dtype=float) * 0]
    # TODO DEBUG END
    # TODO DEBUG next lines are an update from 03-11-2020 to transpose the array to correspond to the FORTRAN
    #  allocation:
    #  ALLOCATE(UNOBSERVABLE(nobs+MAX(nf,Hor),26),AC(4*ny,5),PARAM(nt,409),MARGINAL(nobs+nf,1200),MARGL(13,2))
    ac = np.arange(0, 5, dtype=float) * 0
    for i in range(1, 4 * ny):
        ac = np.c_[ac, np.arange(0, 5, dtype=float) * 0]
    param = np.arange(0, 409, dtype=float) * 0
    for i in range(1, nt):
        param = np.c_[param, np.arange(0, 409, dtype=float) * 0]
    marginal = np.arange(0, 1200, dtype=float) * 0
    for i in range(1, nobs + nf):
        marginal = np.c_[marginal, np.arange(0, 1200, dtype=float) * 0]
    margl = np.arange(0, 2, dtype=float) * 0
    for i in range(1, 13):
        margl = np.c_[margl, np.arange(0, 2, dtype = float) *0]
    # TODO DEBUG END

    with open(logfile, 'a', encoding='utf-8') as f:
        f.write('\n-----Variable list : ' + str(name_vars))

    #TODO : Output of variable for debuging
    # pd.DataFrame(yk).to_excel(projpath + 'yk_' + country + '.xlsx')

    gap50(nstring, arr, nobsp, nyp, nzp, nfp, horp, ntp, np.ctypeslib.as_ctypes(yk), np.ctypeslib.as_ctypes(unobs),
          np.ctypeslib.as_ctypes(ac), np.ctypeslib.as_ctypes(param), np.ctypeslib.as_ctypes(marginal),
          np.ctypeslib.as_ctypes(margl))

    handle = lib._handle
    FreeLibrary(handle)
    # TODO test of 12/2021 to remove -99999.0
    unobs[unobs == -99999.0] = np.nan
    data = data.replace(-99999.0, np.nan)
    # TODO : Output of variables for debuging
    #    gap50returnfile = pd.ExcelWriter(projpath +'gap50return.xlsx')
    #    pd.DataFrame(unobs).to_excel(gap50returnfile, sheet_name='unobs')
    #    pd.DataFrame(marginal).to_excel(gap50returnfile, sheet_name='marginal')
    #    pd.DataFrame(param).to_excel(gap50returnfile, sheet_name='param')
    #    pd.DataFrame(margl).to_excel(gap50returnfile, sheet_name='margl')
    #    pd.DataFrame(ac).to_excel(gap50returnfile, sheet_name='ac')
    #    gap50returnfile.close()
    # test of renaming the LOG and SOL files

    old_file = os.path.join(projpath , 'gap50dll.log')
    if testrun:
        new_file = os.path.join(projpath + 'log/', 'gap50dll_' + tipo.upper() + '_' + country.upper() + '_'
                            + vintage_name + '_TESTRUN' +  str(np.datetime64(datetime.datetime.now())).replace(':', '-') + '.log')
    else:
        new_file = os.path.join(projpath + 'log/', 'gap50dll_' + tipo.upper() + '_' + country.upper() + '_'
                                + vintage_name + str(np.datetime64(datetime.datetime.now())).replace(':', '-') + '.log')
    os.rename(old_file, new_file)


# --------------------------------------------------------
# UNOBSERVABLES (nob+nf,26)  Maximum Likelihood estimates
# 1 series + forecasts, 2 rmse, 3 akrmse,
# 4 smoothed trend + forecast, 5 rmse, 6 akrmse
# 7 smoothed cycle + forecast, 8 rmse, 9 akrmse
# 10 filtered trend, 11 filtered cycle, 12 rmse
# 13 1st series innovations
# 14 PC  series + forecast
# 15 rmse
# 16 akrmse
# 17 PC innovations
# 18 PC idiosync smoothed - empty!
# 19 PC idiosync filtered - empty!
# 20 PC Smoothed component  - mu + beta'*c(t|T)
# 21 PC filtered component  - mu + beta'*c(t|t)"
# 22 PC fitted values - mu + beta'*c(t|T)+gam'*z
# 23 Anchored trend
# 24 Anchored cycle
# ---------------------------------------------------------

    if tipo=='nawru':
        if testrun:
            new_file = os.path.join(projpath + vintage_name + '/',  country.upper() + '_' + tipo.upper() + '_'
                                  + vintage_name + '_TESTRUN.sol')
        else:
            new_file = os.path.join(projpath +  vintage_name + '/', country.upper() + '_' + tipo.upper() + '_'
                                     + vintage_name + '_' + modelversion + '.sol')
        try:
            os.remove(new_file)
        except:
            pass
        old_file = os.path.join(projpath, 'sol.txt')

        os.rename(old_file, new_file)

        if nml['GAP']['Anchor'][1] < 0:
            nawru_series = pd.Series(np.round(unobs[3,0:nmax-ismax+min(10,nf)], 6) + adjfact,
                                     index=range(lastobsyear+1-nmax+ismax, lastobsyear+min(10,nf)+1)).rename('NAWRU')# change of "changey" to "lastobsyear" (2021/09/02)
        else:
            nawru_series = pd.Series(np.round(unobs[22,0:nmax-ismax+min(10,nf)], 6) + adjfact,
                                     index=range(lastobsyear+1-nmax+ismax, lastobsyear+min(10,nf)+1)).rename('NAWRU') # change of "changey" to "lastobsyear" (2021/09/02)

        fitted_values = pd.Series(unobs[21,0:nmax-ismax+min(10,nf)],
                                     index=range(lastobsyear+1-nmax+ismax, lastobsyear+min(10,nf)+1)).rename('fitted values')# change of "changey" to "lastobsyear" (2021/09/02)
        endogenous = data[name_vars[1]].rename(country+'_endo_'+name_vars[1].lower())

#        endogenous = pd.Series(xn[1,0:nmax-ismax+nf] + float(adjfact[country.lower()]),
#                                     index=range(changey+1-nmax+ismax, changey+1)).rename('ENDO'+'_'+name_vars[1])

        with open(logfile, 'a', encoding='utf-8') as f:
            f.write('->PASSED')
        return pd.concat([nawru_series, endogenous, fitted_values], axis = 1), modelversion, dummies


    else:
        # ------------------------------------------------------------------------
        # UNOBSERVABLES, Bayesian estimates
        # by cols: ser1,  p2.5, p5, p95, p97.5, trend, p2.5, p5, p95, p97.5,
        #          cycle, p2.5, p5, p95, p97.5, ser2,  p2.5, p5, p95, p97.5, inn
        #          slope, p2.5, p5, p95, p97.5
        # ------------------------------------------------------------------------

        # we create a file to allow the Matlab interface to plot priors
        np.savetxt(nmlpath[:-3] + 'par', param.reshape(409, 38))
        with open(logfile, 'a', encoding='utf-8') as f:
            f.write('->PASSED')
        gap_sr_ext = pd.Series(unobs[5,0:nmax+nf]+unobs[10,0:nmax+nf], index=range(lastobsyear+1-nmax+ismax, lastobsyear+ismax+nf+1)).rename('SR') # change of "changey" to "lastobsyear" (2021/09/02)
        gap_cu_ext = pd.Series(unobs[15,0:nmax+nf], index=range(lastobsyear+1-nmax+ismax, lastobsyear+ismax+nf+1)).rename('SR') # change of "changey" to "lastobsyear" (2021/09/02)
        return param, pd.Series(unobs[5,0:nmax+nf], index=range(lastobsyear+1-nmax+ismax, lastobsyear+ismax+nf+1)).rename('SRKF'), gap_sr_ext, gap_cu_ext, modelversion, dummies # change of "changey" to "lastobsyear" (2021/09/02)

def find_all(a_str, sub):
    # Finds all occurrences of a sub string inside a string
    start = 0
    while True:
        start = a_str.find(sub, start)
        if start == -1: return
        yield start
        start += len(sub) # use start += 1 to find overlapping matches

# -----------------------------------------------------------
# SELECTDATA
#
# INPUT
#  data: Pandas DataFrame that contains all needed series
#  changey : last year of short term forecast
#  varnames: a list of variables to be selected from "data"
#  nmax: the length of the time series (including missings)
# OUTPUT
#  inds: array containing number of missings
#  indn: array containing number of obs
#  xn: array containing the series by row
# -----------------------------------------------------------


def selectdata(data, changey, varnames, nmax):
    import numpy as np
    nvar = len(varnames)
    indstart = list()
    indnobs = list()
    xn = np.zeros((nvar,nmax))


    for i in range(0,nvar):
        # NOTE : changey will be replace by another variable to allow more observations (beyond t+2)
        # for now it receives last valid year of SR or LUR
        xn[i, :] = data.loc[changey - nmax + 1:changey, varnames[i]].values
        # rounding SR is not needed but allow to match results from the forecast estimated n RATS
        #if varnames[i] == 'SR':
        #    xn[i, :] = np.round(xn[i, :], 6)
        start = data[varnames[i]].loc[changey - nmax + 1:changey].first_valid_index() - (changey - nmax + 1)
        nobs = len(data[varnames[i]].loc[changey - nmax + 1:changey]) - start
        indstart.append(start)
        indnobs.append(nobs)

    inds = np.asarray(indstart)
    indn = np.asarray(indnobs)

    return inds,indn,xn

'''
DESCRIPTION OF THE VARIABLES RETURNED BY THE DLL:
-------------------------------------------------

**** Bayesian Inference (TFP) *****

* ACF.txt  (4* # ser x 5)   
* by rows: ACF at lags 1,2,3,4       
* by cols: p2.5, p25, mean, p75, p97.5

* PARAM.txt  (# par x 400+9) 
* by rows: 1,..,# par
* by cols: x(1:200), fx(1:200),hpr lb,hpr ub,mode,sd,nse,rne,pval,rho(1),rho(5)
where x is the support of the parameter (the order is the same of the namelist)
fx is the density estimate
hpr lb and hpr ub is the High probability density region
mode is the mode of the posterior density
sd is the standard deviation of the posterior density
nse is the monte carlo numerical standard error
rse is the monte carlo relative numerical standard error
pval is the p-value of the tstatistics (H0: beta=0)
rho(1) is the monte carlo autocorrelation at lag 1
rho(5) is the monte carlo autocorrelation at lag 5

* MARGINAL.txt  (nobs+nf x 400*3) nobs # of observation nf # of forecasts
* by rows: 1,...,nobs+nf
* by cols: x(1:600),fx(1:600) trend, cycle, trend growth
the posterior density estimate of the trend cycle and trend growth (one for each time period)

* Unobservable.TXT (nobs+nf x 26) 
* by rows: 1,...,nobs+nf
* by cols: ser1,  p2.5, p5, p95, p97.5, trend, p2.5, p5, p95, p97.5, 
*          cycle, p2.5, p5, p95, p97.5, ser2,  p2.5, p5, p95, p97.5, inn     
*          slope, p2.5, p5, p95, p97.5      
the quantiles of the unobservables (series forecasts, trend, cycle, innovations, and trend slope)

MARGL (13 x 2 )
Marginal likelihooh
by rows 1:11 Harmonic mean estimator 
12:13 Meng wong estimator
by cols 1: marginal likelihood estimate, 2 standard error

******* Maximum likelihood (NAWRU) *****

 UNOBSERVABLES (nob+max(nf,Hor),26)  Hor is the anchor horizon
      bt rows: time
       by columns:
        # 1 series + forecasts, 2 rmse, 3 akrmse,
        # 4 smoothed trend + forecast, 5 rmse, 6 akrmse
        # 7 smoothed cycle + forecast, 8 rmse, 9 akrmse 
        # 10 filtered trend, 11 filtered cycle, 12 rmse
        # 13 1st series innovations
        # 14 PC  series + forecast   
        # 15 rmse
        # 16 akrmse
        # 17 PC innovations  
        # 18 PC idiosync smoothed - empty!
        # 19 PC idiosync filtered - empty!
        # 20 PC Smoothed component  - mu + beta'*c(t|T)
        # 21 PC filtered component  - mu + beta'*c(t|t)"
        # 22 PC fitted values - mu + beta'*c(t|T)+gam'*z 
        # 23 Anchored trend
        # 24 Anchored cycle

AC,PARAM,MARGINAL,MARGL are all empty. Info in this case are into sol.txt file

'''