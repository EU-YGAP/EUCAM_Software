 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:15:56
 Input directory:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Output location:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
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
  AR1:                              1.2378       0.1173      10.5553    
  AR2:                             -0.6718       0.1016      -6.6157    
  Trend shocks var:               2.000E-03                     LB
  Slope shocks var:               2.326E-02                       
  Cycle shocks var:               1.948E-01                       
  
 Phillips curve *
  Intercept:                       -0.0009       0.0026      -0.3326    
  Exog 2:                           0.4013       0.1124       3.5697    
  Exog 3:                          -0.1367       0.2091      -0.6535    
  Exog 4:                           0.2626       0.1212       2.1675    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0074       0.0032      -2.2795    
  Idiosyncratic var:              3.162E-04                       
  
 -2*log-likelihood:          -190.8680
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.1386
    r(2) = -0.1514
    r(3) =  0.0259
    r(4) =  0.0540
   Approximated standard deviation:    0.1313
   Ljung-Box stat. Q(4) =   2.7346   p-value  =   0.6032

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.2041
    r(2) = -0.2169
    r(3) = -0.1374
    r(4) =  0.1114
   Approximated standard deviation            =   0.1313
   Ljung-Box stat. Q(4) =   7.4605   p-value  =   0.1135
    
   R-squared (one-step-ahead predictions)     =   0.2047
   R-squared (fitted values)                  =   0.2795
   % of variance explained by common cycle    =  11.9082
   % reduction in cycle MSE due to 2nd series =  13.1934

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
