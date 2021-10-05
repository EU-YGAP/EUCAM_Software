 PROGRAM GAP version 5.0 - February 2018

 Date: 17- 3-2021  11: 0: 8
 Input directory:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Output location:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      58
   Second equation
     Specification:        ARMAX                                   
     AR order:                0
     MA order:                0
     # of exog variables:     4
     # of observations:      58
     Endogenous regressors:
       Series # 1  cycle lag 0                                     

 Note: Second equation intercept assigned to cycle.
                         
 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              0.9271       0.0988       9.3853    
  AR2:                             -0.3296       0.0948      -3.4758    
  Trend shocks var:               1.000E-04                     UB
  Slope shocks var:               2.000E-03                     UB
  Cycle shocks var:               5.150E-01                     UB
  
 Phillips curve *
  Intercept:                       -0.0008       0.0017      -0.4536    
  Exog 1:                           0.4483       0.2697       1.6620    
  Exog 2:                           0.3291       0.1293       2.5451    
  Exog 3:                           0.4024       0.2675       1.5040    
  Exog 4:                           0.0340       0.1263       0.2689    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0022       0.0012      -1.8809    
  Idiosyncratic var:              1.455E-04                       
  
 -2*log-likelihood:          -148.7176
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0145
    r(2) =  0.0028
    r(3) =  0.0067
    r(4) = -0.0248
   Approximated standard deviation:    0.1313
   Ljung-Box stat. Q(4) =   0.0539   p-value  =   0.9996

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.2187
    r(2) = -0.0723
    r(3) =  0.0712
    r(4) = -0.0787
   Approximated standard deviation            =   0.1313
   Ljung-Box stat. Q(4) =   3.9667   p-value  =   0.4105
    
   R-squared (one-step-ahead predictions)     =   0.1223
   R-squared (fitted values)                  =   0.1532
   % of variance explained by common cycle    =   3.6588
   % reduction in cycle MSE due to 2nd series =   6.6775

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
