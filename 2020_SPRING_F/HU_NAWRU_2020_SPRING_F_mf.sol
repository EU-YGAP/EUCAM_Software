 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:44:35
 Input directory:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Output location:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      26
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     1
     # of observations:      26
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              0.5250       0.2478       2.1186    
  AR2:                              0.0358       0.2110       0.1694    
  Trend shocks var:               1.000E-02                     UB
  Slope shocks var:               9.000E-02                     UB
  Cycle shocks var:               2.800E-01                     UB
  
 Phillips curve *
  Intercept:                       -0.0008       0.0055      -0.1482    
  AR1:                              0.0000                      LB
  Exog 1:                           0.0877       0.0201       4.3688    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0179       0.0049      -3.6663    
  Beta - lag 1:                    -0.0006                      **
  Idiosyncratic var:              1.844E-04                       
  
 -2*log-likelihood:           -34.1823
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.1367
    r(2) =  0.0608
    r(3) = -0.0137
    r(4) = -0.1781
   Approximated standard deviation:    0.1961
   Ljung-Box stat. Q(4) =   1.6075   p-value  =   0.8075

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.0665
    r(2) =  0.0185
    r(3) =  0.1675
    r(4) = -0.1941
   Approximated standard deviation            =   0.1961
   Ljung-Box stat. Q(4) =   2.2737   p-value  =   0.6856
    
   R-squared (one-step-ahead predictions)     =   0.2942
   R-squared (fitted values)                  =   0.6953
   % of variance explained by common cycle    =  41.9598
   % reduction in cycle MSE due to 2nd series =  50.4552

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
