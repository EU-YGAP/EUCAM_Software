 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:44:53
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
     # of exog variables:     0
     # of observations:      26
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.2161       0.1037      11.7227    
  AR2:                             -0.6937       0.0885      -7.8416    
  Trend shocks var:               1.400E-01                     UB
  Slope shocks var:               2.000E-01                     UB
  Cycle shocks var:               1.000E+00                     UB
  
 Phillips curve *
  Intercept:                        0.0065       0.0056       1.1568    
  AR1:                              0.2181       0.1379       1.5820    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0149       0.0028      -5.3393    
  Beta - lag 1:                     0.0102                      **
  Idiosyncratic var:              6.084E-04                       
  
 -2*log-likelihood:            13.9371
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0028
    r(2) = -0.3119
    r(3) = -0.0251
    r(4) =  0.0036
   Approximated standard deviation:    0.1961
   Ljung-Box stat. Q(4) =   2.7792   p-value  =   0.5954

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0716
    r(2) =  0.0074
    r(3) =  0.1471
    r(4) = -0.2563
   Approximated standard deviation            =   0.1961
   Ljung-Box stat. Q(4) =   3.0093   p-value  =   0.5563
    
   R-squared (one-step-ahead predictions)     =   0.4287
   R-squared (fitted values)                  =   0.7278
   % of variance explained by common cycle    =  46.0392
   % reduction in cycle MSE due to 2nd series =  32.5122

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
