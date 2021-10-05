 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  17:59:43
 Input directory:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Output location:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      23
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     1
     # of observations:      23
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.5861       0.1321      12.0112    
  AR2:                             -0.8428       0.1202      -7.0120    
  Trend shocks var:               1.050E-01                     UB
  Slope shocks var:               2.700E-01                     LB
  Cycle shocks var:               4.294E-01                       
  
 Phillips curve *
  Intercept:                       -0.0062       0.0066      -0.9474    
  AR1:                              0.0000                      LB
  Exog 1:                          -1.9842       0.7469      -2.6564    
  Endogeneous regressors from series 1
  Beta - lag 0:                     0.0000                      UB
  Beta - lag 1:                     0.0000                      **
  Idiosyncratic var:              8.993E-04                       
  
 -2*log-likelihood:           -24.2363
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.1224
    r(2) = -0.0913
    r(3) =  0.2172
    r(4) = -0.3351
   Approximated standard deviation:    0.2085
   Ljung-Box stat. Q(4) =   5.0293   p-value  =   0.2843

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.2179
    r(2) =  0.0026
    r(3) = -0.0591
    r(4) = -0.2172
   Approximated standard deviation            =   0.2085
   Ljung-Box stat. Q(4) =   2.7690   p-value  =   0.5972
    
   R-squared (one-step-ahead predictions)     =   0.2655
   R-squared (fitted values)                  =   0.2367
   % of variance explained by common cycle    =   0.0000
   % reduction in cycle MSE due to 2nd series =   0.0000

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
