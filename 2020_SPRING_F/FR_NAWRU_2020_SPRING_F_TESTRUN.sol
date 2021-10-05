 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  17:57:14
 Input directory:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Output location:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      53
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     6
     # of observations:      53
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.0487       0.1631       6.4287    
  AR2:                             -0.3408       0.1591      -2.1423    
  Trend shocks var:               4.500E-02                     UB
  Slope shocks var:               5.000E-03                     LB
  Cycle shocks var:               2.500E-01                     UB
  
 Phillips curve *
  Intercept:                       -0.0006       0.0011      -0.5454    
  AR1:                              0.2554       0.0600       4.2570    
  Exog 1:                          -0.4708       0.1502      -3.1348    
  Exog 2:                           0.0432       0.0086       5.0303    
  Exog 3:                           0.0612       0.0088       6.9700    
  Exog 4:                           0.6677       0.4920       1.3571    
  Exog 5:                           0.1225       0.0092      13.3866    
  Exog 6:                          -0.1122       0.0116      -9.6492    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0001       0.0025      -0.0313    
  Beta - lag 1:                     0.0000                      **
  Idiosyncratic var:              6.577E-05                       
  
 -2*log-likelihood:          -244.3250
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0062
    r(2) = -0.1012
    r(3) =  0.0363
    r(4) = -0.0614
   Approximated standard deviation:    0.1374
   Ljung-Box stat. Q(4) =   0.8588   p-value  =   0.9304

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.0231
    r(2) = -0.0538
    r(3) =  0.2568
    r(4) =  0.1087
   Approximated standard deviation            =   0.1374
   Ljung-Box stat. Q(4) =   4.7421   p-value  =   0.3148
    
   R-squared (one-step-ahead predictions)     =   0.9030
   R-squared (fitted values)                  =   0.8396
   % of variance explained by common cycle    =   0.0055
   % reduction in cycle MSE due to 2nd series =   0.0080

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
