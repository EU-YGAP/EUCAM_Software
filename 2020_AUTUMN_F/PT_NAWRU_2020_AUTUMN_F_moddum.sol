 PROGRAM GAP version 5.0 - February 2018

 Date: 10-12-2020  16:16:38
 Input directory:     C:\ProgramData\python\EUCAM\GIT-FB-DEV
 Output location:     C:\ProgramData\python\EUCAM\GIT-FB-DEV
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
     # of exog variables:     3
     # of observations:      60
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.2311       0.1242       9.9099    
  AR2:                             -0.6158       0.1148      -5.3659    
  Trend shocks var:               1.000E-02                     UB
  Slope shocks var:               1.601E-01                       
  Cycle shocks var:               3.500E-01                     UB
  
 Phillips curve *
  Intercept:                        0.0005       0.0049       0.1097    
  AR1:                              0.3449       0.1168       2.9519    
  Exog 1:                          -0.7577       0.3290      -2.3031    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0121       0.0065      -1.8550    
  Beta - lag 1:                     0.0073                      **
  Idiosyncratic var:              1.329E-03                       
  
 -2*log-likelihood:           -57.1994
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.1205
    r(2) = -0.0728
    r(3) =  0.0573
    r(4) = -0.0137
   Approximated standard deviation:    0.1291
   Ljung-Box stat. Q(4) =   1.4356   p-value  =   0.8380

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.1386
    r(2) = -0.2171
    r(3) = -0.1172
    r(4) =  0.0107
   Approximated standard deviation            =   0.1291
   Ljung-Box stat. Q(4) =   5.1382   p-value  =   0.2734
    
   R-squared (one-step-ahead predictions)     =   0.2137
   R-squared (fitted values)                  =   0.2002
   % of variance explained by common cycle    =   8.1387
   % reduction in cycle MSE due to 2nd series =   7.1495

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
