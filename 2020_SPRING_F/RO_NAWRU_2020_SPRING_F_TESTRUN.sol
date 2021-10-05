 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  18:36:48
 Input directory:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Output location:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      22
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     0
     # of observations:      22
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                             -0.2588       0.1573      -1.6447    
  AR2:                             -0.1439       0.1284      -1.1208    
  Trend shocks var:               1.000E-02                     UB
  Slope shocks var:               8.000E-03                     UB
  Cycle shocks var:               5.500E-02                     UB
  
 Phillips curve *
  Intercept:                        0.0170       0.0133       1.2789    
  AR1:                              0.0000                      LB
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0770       0.0229      -3.3629    
  Beta - lag 1:                     0.0110                      **
  Idiosyncratic var:              3.383E-03                       
  
 -2*log-likelihood:            85.2914
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.2235
    r(2) = -0.0518
    r(3) = -0.2380
    r(4) = -0.1441
   Approximated standard deviation:    0.2132
   Ljung-Box stat. Q(4) =   3.2599   p-value  =   0.5153

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.4519
    r(2) =  0.3286
    r(3) = -0.2291
    r(4) = -0.0300
   Approximated standard deviation            =   0.2132
   Ljung-Box stat. Q(4) =   9.4711   p-value  =   0.0503
    
   R-squared (one-step-ahead predictions)     =   0.0000
   R-squared (fitted values)                  =   0.3115
   % of variance explained by common cycle    =  10.1063
   % reduction in cycle MSE due to 2nd series =   5.0036

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
