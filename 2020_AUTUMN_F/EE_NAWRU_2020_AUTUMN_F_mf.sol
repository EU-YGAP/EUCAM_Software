 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  17:37: 3
 Input directory:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Output location:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      28
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     1
     # of observations:      28
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              0.9727       0.1273       7.6394    
  AR2:                             -0.4954       0.1144      -4.3312    
  Trend shocks var:               2.500E-01                     UB
  Slope shocks var:               5.045E-05                       
  Cycle shocks var:               1.400E+00                     UB
  
 Phillips curve *
  Intercept:                        0.0079       0.0063       1.2469    
  AR1:                              0.4203       0.1478       2.8441    
  Exog 1:                           0.0544       0.0295       1.8435    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0119       0.0028      -4.2904    
  Beta - lag 1:                     0.0058                      **
  Idiosyncratic var:              7.407E-04                       
  
 -2*log-likelihood:             6.4697
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.1211
    r(2) = -0.2355
    r(3) = -0.0526
    r(4) = -0.0375
   Approximated standard deviation:    0.1890
   Ljung-Box stat. Q(4) =   2.2432   p-value  =   0.6911

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.1033
    r(2) = -0.1240
    r(3) = -0.2364
    r(4) =  0.0114
   Approximated standard deviation            =   0.1890
   Ljung-Box stat. Q(4) =   2.7113   p-value  =   0.6072
    
   R-squared (one-step-ahead predictions)     =   0.4570
   R-squared (fitted values)                  =   0.5954
   % of variance explained by common cycle    =  32.0393
   % reduction in cycle MSE due to 2nd series =  19.6848

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
