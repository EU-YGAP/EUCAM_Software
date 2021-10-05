 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:16: 0
 Input directory:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Output location:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      59
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     0
     # of observations:      59
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.1062       0.1149       9.6261    
  AR2:                             -0.3388       0.1040      -3.2569    
  Trend shocks var:               2.500E-02                     UB
  Slope shocks var:               7.000E-03                     LB
  Cycle shocks var:               4.500E-01                     UB
  
 Phillips curve *
  Intercept:                       -0.0002       0.0028      -0.0715    
  AR1:                              0.1278       0.1252       1.0211    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0055       0.0022      -2.5109    
  Beta - lag 1:                     0.0018                      **
  Idiosyncratic var:              3.301E-04                       
  
 -2*log-likelihood:          -134.1749
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0133
    r(2) = -0.1197
    r(3) =  0.0073
    r(4) = -0.0674
   Approximated standard deviation:    0.1302
   Ljung-Box stat. Q(4) =   1.1783   p-value  =   0.8817

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0018
    r(2) = -0.0929
    r(3) = -0.0749
    r(4) =  0.0884
   Approximated standard deviation            =   0.1302
   Ljung-Box stat. Q(4) =   1.4160   p-value  =   0.8414
    
   R-squared (one-step-ahead predictions)     =   0.1220
   R-squared (fitted values)                  =   0.1735
   % of variance explained by common cycle    =   8.9992
   % reduction in cycle MSE due to 2nd series =  16.7106

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
