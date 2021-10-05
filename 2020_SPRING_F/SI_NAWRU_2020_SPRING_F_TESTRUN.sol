 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  18:43:43
 Input directory:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Output location:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Model type:          
   Series # 1
     Trend:                Random walk plus drift   
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      26
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     2
     # of observations:      26
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.4890       0.1390      10.7094    
  AR2:                             -0.6780       0.1382      -4.9066    
  Trend shocks var:               3.000E-02                     LB
  Cycle shocks var:               3.011E-01                       
  
 Phillips curve *
  Intercept:                        0.0009       0.0038       0.2346    
  AR1:                              0.0684       0.1414       0.4837    
  Exog 1:                           0.0484       0.0220       2.2003    
  Exog 2:                          -1.0087       0.3752      -2.6885    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0037       0.0044      -0.8477    
  Beta - lag 1:                     0.0025                      **
  Idiosyncratic var:              3.489E-04                       
  
 -2*log-likelihood:           -81.6935
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0891
    r(2) = -0.2543
    r(3) =  0.0424
    r(4) =  0.2531
   Approximated standard deviation:    0.1961
   Ljung-Box stat. Q(4) =   4.2366   p-value  =   0.3749

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.1315
    r(2) = -0.1592
    r(3) = -0.2096
    r(4) =  0.1745
   Approximated standard deviation            =   0.1961
   Ljung-Box stat. Q(4) =   3.6699   p-value  =   0.4525
    
   R-squared (one-step-ahead predictions)     =   0.4971
   R-squared (fitted values)                  =   0.4768
   % of variance explained by common cycle    =   2.9301
   % reduction in cycle MSE due to 2nd series =   2.6274

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
