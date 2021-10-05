 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:15:41
 Input directory:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Output location:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      22
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     2
     # of observations:      22
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.0704       0.6184       1.7309    
  AR2:                             -0.4290       0.4593      -0.9340    
  Trend shocks var:               3.000E-02                     UB
  Slope shocks var:               6.000E-01                     UB
  Cycle shocks var:               6.000E-01                     UB
  
 Phillips curve *
  Intercept:                        0.0202       0.0088       2.2837    
  AR1:                              0.2578       0.1972       1.3071    
  Exog 1:                           0.0578       0.0347       1.6677    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0075       0.0131      -0.5714    
  Beta - lag 1:                     0.0032                      **
  Idiosyncratic var:              9.714E-04                       
  
 -2*log-likelihood:            -8.2570
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0100
    r(2) =  0.0481
    r(3) =  0.0072
    r(4) =  0.0631
   Approximated standard deviation:    0.2132
   Ljung-Box stat. Q(4) =   0.1698   p-value  =   0.9966

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.1276
    r(2) = -0.2933
    r(3) = -0.1192
    r(4) =  0.1977
   Approximated standard deviation            =   0.2132
   Ljung-Box stat. Q(4) =   4.2211   p-value  =   0.3769
    
   R-squared (one-step-ahead predictions)     =   0.4272
   R-squared (fitted values)                  =   0.1764
   % of variance explained by common cycle    =   6.4227
   % reduction in cycle MSE due to 2nd series =   7.7635

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
