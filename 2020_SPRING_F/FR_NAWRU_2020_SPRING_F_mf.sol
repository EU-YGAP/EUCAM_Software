 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:43: 7
 Input directory:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Output location:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      52
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     6
     # of observations:      52
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using outer product of gradient

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.1731       0.3356       3.4951    
  AR2:                             -0.3604       0.2704      -1.3328    
  Trend shocks var:               1.029E-02                       
  Slope shocks var:               5.395E-03                       
  Cycle shocks var:               2.500E-01                     UB
  
 Phillips curve *
  Intercept:                       -0.0012       0.4544      -0.0027    
  AR1:                              0.1553       0.1388       1.1189    
  Exog 1:                          -0.5257       0.1320      -3.9839    
  Exog 2:                           0.0434       0.1026       0.4229    
  Exog 3:                           0.0595       0.1467       0.4056    
  Exog 4:                           0.6578       3.3331       0.1973    
  Exog 5:                           0.1271      70.1893       0.0018    
  Exog 6:                          -0.1518      46.5763      -0.0033    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0018       0.0028      -0.6516    
  Beta - lag 1:                     0.0006                      **
  Idiosyncratic var:              6.247E-05                       
  
 -2*log-likelihood:          -251.0517
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0871
    r(2) = -0.0441
    r(3) =  0.0236
    r(4) = -0.0689
   Approximated standard deviation:    0.1387
   Ljung-Box stat. Q(4) =   0.8068   p-value  =   0.9375

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.1140
    r(2) =  0.0582
    r(3) =  0.2945
    r(4) =  0.1254
   Approximated standard deviation            =   0.1387
   Ljung-Box stat. Q(4) =   6.7968   p-value  =   0.1470
    
   R-squared (one-step-ahead predictions)     =   0.9281
   R-squared (fitted values)                  =   0.9148
   % of variance explained by common cycle    =   3.7175
   % reduction in cycle MSE due to 2nd series =   8.0784

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
