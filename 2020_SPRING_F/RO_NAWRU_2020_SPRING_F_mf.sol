 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:45:41
 Input directory:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Output location:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      21
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     0
     # of observations:      21
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                             -0.4502       0.1435      -3.1379    
  AR2:                             -0.0588       0.1628      -0.3613    
  Trend shocks var:               1.000E-02                     UB
  Slope shocks var:               8.000E-03                     UB
  Cycle shocks var:               5.500E-02                     UB
  
 Phillips curve *
  Intercept:                        0.0158       0.0138       1.1462    
  AR1:                              0.0000                      LB
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0736       0.0232      -3.1766    
  Beta - lag 1:                     0.0043                      **
  Idiosyncratic var:              3.509E-03                       
  
 -2*log-likelihood:            88.0885
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.2832
    r(2) = -0.0687
    r(3) = -0.2433
    r(4) = -0.1399
   Approximated standard deviation:    0.2182
   Ljung-Box stat. Q(4) =   3.8851   p-value  =   0.4218

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.4431
    r(2) =  0.3177
    r(3) = -0.2531
    r(4) = -0.0481
   Approximated standard deviation            =   0.2182
   Ljung-Box stat. Q(4) =   9.0928   p-value  =   0.0588
    
   R-squared (one-step-ahead predictions)     =   0.0227
   R-squared (fitted values)                  =   0.3034
   % of variance explained by common cycle    =   9.8658
   % reduction in cycle MSE due to 2nd series =   4.2428

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
