 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  18:21:23
 Input directory:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Output location:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
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
     # of exog variables:     2
     # of observations:      27
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.0263       0.0945      10.8587    
  AR2:                             -0.5443       0.0846      -6.4313    
  Trend shocks var:               5.000E-02                     UB
  Slope shocks var:               2.000E-02                     UB
  Cycle shocks var:               8.500E-01                     UB
  
 Phillips curve *
  Intercept:                        0.0078       0.0076       1.0301    
  AR1:                              0.3826       0.1405       2.7224    
  Exog 1:                           0.0530       0.0377       1.4042    
  Exog 2:                          -0.0420       0.0378      -1.1120    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0144       0.0036      -4.0325    
  Beta - lag 1:                     0.0077                      **
  Idiosyncratic var:              1.264E-03                       
  
 -2*log-likelihood:            52.4309
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0220
    r(2) = -0.0390
    r(3) =  0.0502
    r(4) = -0.1331
   Approximated standard deviation:    0.1925
   Ljung-Box stat. Q(4) =   0.7049   p-value  =   0.9507

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.1414
    r(2) =  0.0206
    r(3) = -0.0198
    r(4) = -0.3172
   Approximated standard deviation            =   0.1925
   Ljung-Box stat. Q(4) =   4.0531   p-value  =   0.3989
    
   R-squared (one-step-ahead predictions)     =   0.3863
   R-squared (fitted values)                  =   0.5662
   % of variance explained by common cycle    =  20.3173
   % reduction in cycle MSE due to 2nd series =  12.9685

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
