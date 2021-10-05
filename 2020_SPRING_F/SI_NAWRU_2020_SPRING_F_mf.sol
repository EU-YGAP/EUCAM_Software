 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:45:13
 Input directory:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Output location:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Model type:          
   Series # 1
     Trend:                Random walk plus drift   
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      25
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     2
     # of observations:      25
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.0650       0.1952       5.4557    
  AR2:                             -0.3103       0.1879      -1.6519    
  Trend shocks var:               8.000E-02                     UB
  Cycle shocks var:               5.000E-01                     UB
  
 Phillips curve *
  Intercept:                        0.0008       0.0036       0.2090    
  AR1:                              0.0595       0.1552       0.3830    
  Exog 1:                           0.0456       0.0200       2.2774    
  Exog 2:                          -1.0048       0.3533      -2.8444    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0009       0.0031      -0.3062    
  Beta - lag 1:                     0.0003                      **
  Idiosyncratic var:              3.003E-04                       
  
 -2*log-likelihood:           -56.0310
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0507
    r(2) =  0.0154
    r(3) =  0.0550
    r(4) =  0.0287
   Approximated standard deviation:    0.2000
   Ljung-Box stat. Q(4) =   0.1921   p-value  =   0.9957

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0925
    r(2) = -0.1257
    r(3) = -0.2154
    r(4) =  0.1764
   Approximated standard deviation            =   0.2000
   Ljung-Box stat. Q(4) =   3.1273   p-value  =   0.5368
    
   R-squared (one-step-ahead predictions)     =   0.5012
   R-squared (fitted values)                  =   0.4885
   % of variance explained by common cycle    =   0.3151
   % reduction in cycle MSE due to 2nd series =   0.6052

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
