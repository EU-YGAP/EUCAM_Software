 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  17:46:22
 Input directory:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Output location:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      60
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     2
     # of observations:      60
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.3775       0.1211      11.3767    
  AR2:                             -0.5603       0.1027      -5.4582    
  Trend shocks var:               2.000E-01                     UB
  Slope shocks var:               1.400E-01                     UB
  Cycle shocks var:               1.250E+00                     UB
  
 Phillips curve *
  Intercept:                        0.0002       0.0026       0.0743    
  AR1:                              0.3505       0.1143       3.0669    
  Exog 1:                           0.1048       0.0190       5.5266    
  Exog 2:                          -0.1093       0.0230      -4.7498    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0027       0.0014      -1.8799    
  Beta - lag 1:                     0.0015                      **
  Idiosyncratic var:              3.371E-04                       
  
 -2*log-likelihood:           -62.2908
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0164
    r(2) = -0.1570
    r(3) =  0.1280
    r(4) = -0.0523
   Approximated standard deviation:    0.1291
   Ljung-Box stat. Q(4) =   2.7618   p-value  =   0.5984

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0373
    r(2) = -0.1100
    r(3) =  0.0744
    r(4) =  0.0740
   Approximated standard deviation            =   0.1291
   Ljung-Box stat. Q(4) =   1.5894   p-value  =   0.8107
    
   R-squared (one-step-ahead predictions)     =   0.4981
   R-squared (fitted values)                  =   0.4549
   % of variance explained by common cycle    =   8.5577
   % reduction in cycle MSE due to 2nd series =  11.3127

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
