 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:15:34
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
  AR1:                              1.2186       0.1511       8.0654    
  AR2:                             -0.5599       0.1152      -4.8605    
  Trend shocks var:               1.000E-02                     LB
  Slope shocks var:               3.500E-02                     LB
  Cycle shocks var:               2.919E-01                       
  
 Phillips curve *
  Intercept:                       -0.0012       0.0027      -0.4506    
  Exog 1:                           0.2793       0.2061       1.3551    
  Exog 2:                           0.4014       0.0881       4.5570    
  Exog 3:                           0.0560       0.2052       0.2728    
  Exog 4:                           0.0000                      LB
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0068       0.0031      -2.1884    
  Idiosyncratic var:              2.832E-04                       
  
 -2*log-likelihood:          -175.8459
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.1554
    r(2) = -0.1640
    r(3) =  0.0711
    r(4) =  0.0103
   Approximated standard deviation:    0.1313
   Ljung-Box stat. Q(4) =   3.3620   p-value  =   0.4992

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.0056
    r(2) = -0.0534
    r(3) = -0.2442
    r(4) = -0.1405
   Approximated standard deviation            =   0.1313
   Ljung-Box stat. Q(4) =   5.2248   p-value  =   0.2650
    
   R-squared (one-step-ahead predictions)     =   0.2908
   R-squared (fitted values)                  =   0.3842
   % of variance explained by common cycle    =  15.0126
   % reduction in cycle MSE due to 2nd series =  21.2710

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
