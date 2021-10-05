 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:45: 7
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
     # of exog variables:     3
     # of observations:      26
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.1303       0.1642       6.8827    
  AR2:                             -0.5230       0.1355      -3.8597    
  Trend shocks var:               1.500E-01                     UB
  Slope shocks var:               9.000E-02                     UB
  Cycle shocks var:               1.000E+00                     UB
  
 Phillips curve *
  Intercept:                       -0.0035       0.0046      -0.7676    
  AR1:                              0.2362       0.1615       1.4628    
  Exog 1:                          -1.5173       0.3711      -4.0887    
  Exog 2:                           0.0399       0.0237       1.6849    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0074       0.0031      -2.3865    
  Beta - lag 1:                     0.0038                      **
  Idiosyncratic var:              4.191E-04                       
  
 -2*log-likelihood:           -20.5648
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.1213
    r(2) = -0.1692
    r(3) =  0.0153
    r(4) = -0.0892
   Approximated standard deviation:    0.1961
   Ljung-Box stat. Q(4) =   1.4663   p-value  =   0.8326

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.0111
    r(2) = -0.0638
    r(3) = -0.0599
    r(4) = -0.1232
   Approximated standard deviation            =   0.1961
   Ljung-Box stat. Q(4) =   0.7432   p-value  =   0.9459
    
   R-squared (one-step-ahead predictions)     =   0.3475
   R-squared (fitted values)                  =   0.4694
   % of variance explained by common cycle    =  20.1333
   % reduction in cycle MSE due to 2nd series =  19.2043

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
