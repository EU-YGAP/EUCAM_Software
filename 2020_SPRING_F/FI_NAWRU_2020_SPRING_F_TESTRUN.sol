 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  17:51:45
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
     # of exog variables:     0
     # of observations:      60
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.2313       0.1287       9.5650    
  AR2:                             -0.6680       0.0893      -7.4841    
  Trend shocks var:               5.000E-03                     LB
  Slope shocks var:               2.063E-01                       
  Cycle shocks var:               4.000E-01                     UB
  
 Phillips curve *
  Intercept:                       -0.0011       0.0030      -0.3507    
  AR1:                              0.2678       0.1177       2.2751    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0125       0.0036      -3.4987    
  Beta - lag 1:                     0.0082                      **
  Idiosyncratic var:              5.005E-04                       
  
 -2*log-likelihood:          -103.7996
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0985
    r(2) = -0.1852
    r(3) = -0.1549
    r(4) = -0.0855
   Approximated standard deviation:    0.1291
   Ljung-Box stat. Q(4) =   4.7118   p-value  =   0.3182

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.0497
    r(2) = -0.2952
    r(3) = -0.0295
    r(4) =  0.2181
   Approximated standard deviation            =   0.1291
   Ljung-Box stat. Q(4) =   8.9609   p-value  =   0.0621
    
   R-squared (one-step-ahead predictions)     =   0.2307
   R-squared (fitted values)                  =   0.3268
   % of variance explained by common cycle    =  22.4094
   % reduction in cycle MSE due to 2nd series =  17.8372

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
