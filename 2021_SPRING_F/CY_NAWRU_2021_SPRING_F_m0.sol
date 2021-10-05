 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:15:44
 Input directory:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Output location:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      26
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     2
     # of observations:      26
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.5307       0.1562       9.7993    
  AR2:                             -0.7080       0.1338      -5.2896    
  Trend shocks var:               5.000E-03                     LB
  Slope shocks var:               1.300E-01                     LB
  Cycle shocks var:               8.586E-01                       
  
 Phillips curve *
  Intercept:                       -0.0013       0.0054      -0.2392    
  AR1:                              0.0000                      LB
  Exog 1:                           0.0242       0.0266       0.9123    
  Exog 2:                          -0.0264       0.0266      -0.9911    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0034       0.0036      -0.9533    
  Beta - lag 1:                     0.0024                      **
  Idiosyncratic var:              6.675E-04                       
  
 -2*log-likelihood:           -32.4277
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0894
    r(2) = -0.2959
    r(3) = -0.0470
    r(4) =  0.1894
   Approximated standard deviation:    0.1961
   Ljung-Box stat. Q(4) =   3.8859   p-value  =   0.4217

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0715
    r(2) =  0.0505
    r(3) = -0.0658
    r(4) = -0.0682
   Approximated standard deviation            =   0.1961
   Ljung-Box stat. Q(4) =   0.5176   p-value  =   0.9718
    
   R-squared (one-step-ahead predictions)     =   0.1248
   R-squared (fitted values)                  =   0.1085
   % of variance explained by common cycle    =   3.5200
   % reduction in cycle MSE due to 2nd series =   5.6923

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
