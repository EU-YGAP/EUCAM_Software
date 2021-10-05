 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:44:46
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
     # of exog variables:     2
     # of observations:      26
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.0184       0.0941      10.8190    
  AR2:                             -0.5400       0.0845      -6.3888    
  Trend shocks var:               5.000E-02                     UB
  Slope shocks var:               2.000E-02                     UB
  Cycle shocks var:               8.500E-01                     UB
  
 Phillips curve *
  Intercept:                        0.0082       0.0078       1.0484    
  AR1:                              0.3806       0.1399       2.7202    
  Exog 1:                           0.0499       0.0383       1.3043    
  Exog 2:                          -0.0506       0.0381      -1.3263    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0151       0.0036      -4.2305    
  Beta - lag 1:                     0.0080                      **
  Idiosyncratic var:              1.268E-03                       
  
 -2*log-likelihood:            54.5763
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0045
    r(2) = -0.0603
    r(3) =  0.0343
    r(4) = -0.1465
   Approximated standard deviation:    0.1961
   Ljung-Box stat. Q(4) =   0.8085   p-value  =   0.9373

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.1485
    r(2) =  0.0121
    r(3) =  0.0365
    r(4) = -0.3394
   Approximated standard deviation            =   0.1961
   Ljung-Box stat. Q(4) =   4.4994   p-value  =   0.3426
    
   R-squared (one-step-ahead predictions)     =   0.3800
   R-squared (fitted values)                  =   0.5943
   % of variance explained by common cycle    =  21.6587
   % reduction in cycle MSE due to 2nd series =  13.9879

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
