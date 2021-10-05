 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:16: 4
 Input directory:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Output location:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      29
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     1
     # of observations:      29
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              0.9569       0.1271       7.5309    
  AR2:                             -0.4748       0.1092      -4.3489    
  Trend shocks var:               2.500E-01                     UB
  Slope shocks var:               1.189E-03                       
  Cycle shocks var:               1.400E+00                     UB
  
 Phillips curve *
  Intercept:                        0.0064       0.0062       1.0311    
  AR1:                              0.4583       0.1382       3.3163    
  Exog 1:                           0.0326       0.0288       1.1310    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0119       0.0027      -4.3649    
  Beta - lag 1:                     0.0055                      **
  Idiosyncratic var:              7.244E-04                       
  
 -2*log-likelihood:             3.8054
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.1748
    r(2) = -0.2474
    r(3) = -0.0981
    r(4) = -0.0969
   Approximated standard deviation:    0.1857
   Ljung-Box stat. Q(4) =   3.4705   p-value  =   0.4824

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.1263
    r(2) = -0.0997
    r(3) = -0.2380
    r(4) =  0.0758
   Approximated standard deviation            =   0.1857
   Ljung-Box stat. Q(4) =   3.0086   p-value  =   0.5564
    
   R-squared (one-step-ahead predictions)     =   0.3583
   R-squared (fitted values)                  =   0.5675
   % of variance explained by common cycle    =  32.3979
   % reduction in cycle MSE due to 2nd series =  21.0178

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
