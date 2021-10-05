 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  18:30:34
 Input directory:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Output location:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      30
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     1
     # of observations:      30
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.3706       0.1067      12.8456    
  AR2:                             -0.6817       0.1053      -6.4710    
  Trend shocks var:               1.000E-08                     LB
  Slope shocks var:               8.604E-02                       
  Cycle shocks var:               8.710E-01                       
  
 Phillips curve *
  Intercept:                       -0.0055       0.0045      -1.2196    
  AR1:                              0.0000                      LB
  Exog 1:                           0.0310       0.0230       1.3481    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0098       0.0029      -3.3859    
  Beta - lag 1:                     0.0066                      **
  Idiosyncratic var:              4.716E-04                       
  
 -2*log-likelihood:           -44.4271
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0089
    r(2) = -0.3667
    r(3) =  0.0601
    r(4) = -0.0114
   Approximated standard deviation:    0.1826
   Ljung-Box stat. Q(4) =   4.4731   p-value  =   0.3458

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.0416
    r(2) =  0.1798
    r(3) = -0.1409
    r(4) =  0.0217
   Approximated standard deviation            =   0.1826
   Ljung-Box stat. Q(4) =   1.8885   p-value  =   0.7563
    
   R-squared (one-step-ahead predictions)     =   0.2202
   R-squared (fitted values)                  =   0.4044
   % of variance explained by common cycle    =  25.9510
   % reduction in cycle MSE due to 2nd series =  25.3662

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
