 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:44:24
 Input directory:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Output location:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      27
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     0
     # of observations:      27
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              0.6138       0.2289       2.6816    
  AR2:                             -0.7027       0.1793      -3.9187    
  Trend shocks var:               1.500E-01                     UB
  Slope shocks var:               2.000E-01                     UB
  Cycle shocks var:               2.500E-01                     UB
  
 Phillips curve *
  Intercept:                        0.0044       0.0041       1.0815    
  AR1:                              0.2376       0.1779       1.3362    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0034       0.0051      -0.6735    
  Beta - lag 1:                     0.0024                      **
  Idiosyncratic var:              3.448E-04                       
  
 -2*log-likelihood:           -44.6992
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0963
    r(2) = -0.0615
    r(3) =  0.0164
    r(4) = -0.1428
   Approximated standard deviation:    0.1925
   Ljung-Box stat. Q(4) =   1.0362   p-value  =   0.9043

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0219
    r(2) =  0.0231
    r(3) = -0.2129
    r(4) = -0.1670
   Approximated standard deviation            =   0.1925
   Ljung-Box stat. Q(4) =   2.4594   p-value  =   0.6519
    
   R-squared (one-step-ahead predictions)     =   0.1836
   R-squared (fitted values)                  =   0.0498
   % of variance explained by common cycle    =   1.8830
   % reduction in cycle MSE due to 2nd series =   0.8500

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
