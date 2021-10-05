 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:16:39
 Input directory:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Output location:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      27
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     1
     # of observations:      27
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.4520       0.1681       8.6363    
  AR2:                             -0.6399       0.1447      -4.4206    
  Trend shocks var:               1.000E-02                     UB
  Slope shocks var:               9.000E-02                     UB
  Cycle shocks var:               2.800E-01                     UB
  
 Phillips curve *
  Intercept:                       -0.0020       0.0036      -0.5555    
  AR1:                              0.1357       0.1519       0.8931    
  Exog 1:                           0.0610       0.0147       4.1505    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0114       0.0035      -3.2510    
  Beta - lag 1:                     0.0072                      **
  Idiosyncratic var:              1.649E-04                       
  
 -2*log-likelihood:           -79.7985
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.2629
    r(2) = -0.1140
    r(3) =  0.1276
    r(4) = -0.1429
   Approximated standard deviation:    0.1925
   Ljung-Box stat. Q(4) =   3.4805   p-value  =   0.4809

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0602
    r(2) = -0.0316
    r(3) =  0.0976
    r(4) = -0.0649
   Approximated standard deviation            =   0.1925
   Ljung-Box stat. Q(4) =   0.5947   p-value  =   0.9636
    
   R-squared (one-step-ahead predictions)     =   0.3587
   R-squared (fitted values)                  =   0.5901
   % of variance explained by common cycle    =  36.9346
   % reduction in cycle MSE due to 2nd series =  48.2953

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
