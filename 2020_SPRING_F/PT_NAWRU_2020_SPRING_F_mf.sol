 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:43:49
 Input directory:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Output location:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      59
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     3
     # of observations:      59
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              0.9207       0.1735       5.3052    
  AR2:                             -0.4416       0.1620      -2.7261    
  Trend shocks var:               1.000E-02                     UB
  Slope shocks var:               2.000E-01                     UB
  Cycle shocks var:               3.500E-01                     UB
  
 Phillips curve *
  Intercept:                        0.0003       0.0049       0.0564    
  AR1:                              0.3196       0.1208       2.6470    
  Exog 1:                          -0.7859       0.3295      -2.3851    
  Exog 2:                           0.0799       0.0439       1.8191    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0179       0.0082      -2.1772    
  Beta - lag 1:                     0.0077                      **
  Idiosyncratic var:              1.252E-03                       
  
 -2*log-likelihood:           -27.1926
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.1028
    r(2) = -0.0447
    r(3) = -0.0489
    r(4) = -0.0677
   Approximated standard deviation:    0.1302
   Ljung-Box stat. Q(4) =   1.1966   p-value  =   0.8787

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.1853
    r(2) = -0.2053
    r(3) = -0.1131
    r(4) =  0.0201
   Approximated standard deviation            =   0.1302
   Ljung-Box stat. Q(4) =   5.6410   p-value  =   0.2276
    
   R-squared (one-step-ahead predictions)     =   0.2015
   R-squared (fitted values)                  =   0.2703
   % of variance explained by common cycle    =  12.7593
   % reduction in cycle MSE due to 2nd series =  12.2834

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
