 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  17:37: 4
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
     # of exog variables:     0
     # of observations:      28
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              0.9902       0.1099       9.0130    
  AR2:                             -0.5244       0.1024      -5.1202    
  Trend shocks var:               1.500E-01                     UB
  Slope shocks var:               2.402E-04                       
  Cycle shocks var:               1.100E+00                     UB
  
 Phillips curve *
  Intercept:                        0.0074       0.0065       1.1423    
  AR1:                              0.4545       0.1525       2.9800    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0108       0.0029      -3.7870    
  Beta - lag 1:                     0.0055                      **
  Idiosyncratic var:              8.599E-04                       
  
 -2*log-likelihood:            17.6816
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0962
    r(2) = -0.2414
    r(3) = -0.0412
    r(4) = -0.0278
   Approximated standard deviation:    0.1890
   Ljung-Box stat. Q(4) =   2.1161   p-value  =   0.7144

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.1569
    r(2) = -0.1374
    r(3) = -0.1466
    r(4) = -0.0997
   Approximated standard deviation            =   0.1890
   Ljung-Box stat. Q(4) =   2.4456   p-value  =   0.6544
    
   R-squared (one-step-ahead predictions)     =   0.4466
   R-squared (fitted values)                  =   0.5202
   % of variance explained by common cycle    =  20.9611
   % reduction in cycle MSE due to 2nd series =  11.1144

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
