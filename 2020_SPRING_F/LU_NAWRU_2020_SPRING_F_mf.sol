 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:43:30
 Input directory:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Output location:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      42
   Second equation
     Specification:        ARMAX                                   
     AR order:                0
     MA order:                1
     # of exog variables:     4
     # of observations:      42
     Endogenous regressors:
       Series # 1  cycle lag 0                                     

 Note: Second equation intercept assigned to cycle.
                         
 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              0.6628       0.1650       4.0172    
  AR2:                             -0.1177       0.1590      -0.7402    
  Trend shocks var:               1.000E-08                     LB
  Slope shocks var:               1.751E-03                       
  Cycle shocks var:               1.951E-01                       
  
 Phillips curve *
  Intercept:                       -0.0015       0.0009      -1.6330    
  MA1:                             -0.9700                      LB
  Exog 2:                           0.1466       0.0744       1.9709    
  Exog 3:                          -0.0566       0.1246      -0.4546    
  Exog 4:                           0.0882       0.0776       1.1366    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0057       0.0025      -2.2528    
  Idiosyncratic var:              1.473E-04                       
  
 -2*log-likelihood:          -166.7796
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.1333
    r(2) =  0.1762
    r(3) = -0.2488
    r(4) =  0.0289
   Approximated standard deviation:    0.1543
   Ljung-Box stat. Q(4) =   4.9864   p-value  =   0.2887

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.2147
    r(2) = -0.0730
    r(3) =  0.0005
    r(4) = -0.2069
   Approximated standard deviation            =   0.1543
   Ljung-Box stat. Q(4) =   4.4048   p-value  =   0.3540
    
   R-squared (one-step-ahead predictions)     =   0.2168
   R-squared (fitted values)                  =   1.0000
   % of variance explained by common cycle    = 100.0000
   % reduction in cycle MSE due to 2nd series =  42.1412

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
