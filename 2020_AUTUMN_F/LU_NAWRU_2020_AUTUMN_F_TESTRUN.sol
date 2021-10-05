 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:17: 1
 Input directory:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Output location:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      43
   Second equation
     Specification:        ARMAX                                   
     AR order:                0
     MA order:                1
     # of exog variables:     4
     # of observations:      43
     Endogenous regressors:
       Series # 1  cycle lag 0                                     

 Note: Second equation intercept assigned to cycle.
                         
 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              0.7237       0.1600       4.5243    
  AR2:                             -0.1950       0.1578      -1.2356    
  Trend shocks var:               1.000E-08                     LB
  Slope shocks var:               1.252E-03                       
  Cycle shocks var:               2.013E-01                       
  
 Phillips curve *
  Intercept:                       -0.0016       0.0008      -2.0688    
  MA1:                             -0.9700                      LB
  Exog 2:                           0.1874       0.0812       2.3085    
  Exog 3:                          -0.0428       0.1310      -0.3270    
  Exog 4:                           0.1007       0.0799       1.2610    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0048       0.0024      -2.0225    
  Idiosyncratic var:              1.590E-04                       
  
 -2*log-likelihood:          -168.8896
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.1964
    r(2) =  0.1553
    r(3) = -0.2713
    r(4) = -0.0315
   Approximated standard deviation:    0.1525
   Ljung-Box stat. Q(4) =   6.2528   p-value  =   0.1811

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.2470
    r(2) = -0.0890
    r(3) = -0.0257
    r(4) = -0.1192
   Approximated standard deviation            =   0.1525
   Ljung-Box stat. Q(4) =   3.9220   p-value  =   0.4167
    
   R-squared (one-step-ahead predictions)     =   0.2412
   R-squared (fitted values)                  =   1.0000
   % of variance explained by common cycle    = 100.0000
   % reduction in cycle MSE due to 2nd series =  37.6833

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
