 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  17:20:44
 Input directory:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Output location:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
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
     # of exog variables:     2
     # of observations:      26
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.4988       0.1630       9.1960    
  AR2:                             -0.6721       0.1376      -4.8846    
  Trend shocks var:               5.000E-03                     LB
  Slope shocks var:               1.300E-01                     LB
  Cycle shocks var:               9.500E-01                     UB
  
 Phillips curve *
  Intercept:                       -0.0005       0.0054      -0.0922    
  AR1:                              0.0000                      LB
  Exog 1:                           0.0239       0.0264       0.9061    
  Exog 2:                          -0.0187       0.0263      -0.7127    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0035       0.0034      -1.0453    
  Beta - lag 1:                     0.0024                      **
  Idiosyncratic var:              6.499E-04                       
  
 -2*log-likelihood:           -30.1288
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0694
    r(2) = -0.2860
    r(3) = -0.0141
    r(4) =  0.1429
   Approximated standard deviation:    0.1961
   Ljung-Box stat. Q(4) =   3.0941   p-value  =   0.5422

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0792
    r(2) =  0.0469
    r(3) = -0.0706
    r(4) = -0.0755
   Approximated standard deviation            =   0.1961
   Ljung-Box stat. Q(4) =   0.5951   p-value  =   0.9636
    
   R-squared (one-step-ahead predictions)     =   0.1030
   R-squared (fitted values)                  =   0.0959
   % of variance explained by common cycle    =   4.0832
   % reduction in cycle MSE due to 2nd series =   7.3337

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
