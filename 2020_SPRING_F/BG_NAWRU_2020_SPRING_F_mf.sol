 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:45:34
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
     # of exog variables:     1
     # of observations:      21
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              0.7828       0.4218       1.8558    
  AR2:                             -0.2203       0.3552      -0.6204    
  Trend shocks var:               3.000E-02                     UB
  Slope shocks var:               5.000E-01                     UB
  Cycle shocks var:               9.000E-01                     UB
  
 Phillips curve *
  Intercept:                        0.0230       0.0108       2.1184    
  AR1:                              0.1022       0.2276       0.4490    
  Exog 1:                           0.0794       0.0503       1.5796    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0089       0.0133      -0.6651    
  Beta - lag 1:                     0.0019                      **
  Idiosyncratic var:              1.283E-03                       
  
 -2*log-likelihood:             7.0217
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0474
    r(2) =  0.1099
    r(3) = -0.0012
    r(4) = -0.0329
   Approximated standard deviation:    0.2182
   Ljung-Box stat. Q(4) =   0.3623   p-value  =   0.9854

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.2051
    r(2) = -0.2026
    r(3) = -0.1451
    r(4) =  0.1389
   Approximated standard deviation            =   0.2182
   Ljung-Box stat. Q(4) =   3.1731   p-value  =   0.5293
    
   R-squared (one-step-ahead predictions)     =   0.3670
   R-squared (fitted values)                  =   0.2179
   % of variance explained by common cycle    =   7.7187
   % reduction in cycle MSE due to 2nd series =  10.2070

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
