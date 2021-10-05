 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:16:21
 Input directory:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Output location:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      60
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     0
     # of observations:      60
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.2338       0.1292       9.5513    
  AR2:                             -0.6694       0.0879      -7.6153    
  Trend shocks var:               5.000E-03                     LB
  Slope shocks var:               1.969E-01                       
  Cycle shocks var:               4.000E-01                     UB
  
 Phillips curve *
  Intercept:                       -0.0011       0.0029      -0.3662    
  AR1:                              0.2767       0.1160       2.3850    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0130       0.0035      -3.7107    
  Beta - lag 1:                     0.0085                      **
  Idiosyncratic var:              4.598E-04                       
  
 -2*log-likelihood:          -108.9798
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.1104
    r(2) = -0.1894
    r(3) = -0.1633
    r(4) = -0.0857
   Approximated standard deviation:    0.1291
   Ljung-Box stat. Q(4) =   5.1328   p-value  =   0.2739

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.0541
    r(2) = -0.3177
    r(3) =  0.0265
    r(4) =  0.2186
   Approximated standard deviation            =   0.1291
   Ljung-Box stat. Q(4) =   9.8768   p-value  =   0.0426
    
   R-squared (one-step-ahead predictions)     =   0.2353
   R-squared (fitted values)                  =   0.3564
   % of variance explained by common cycle    =  25.3858
   % reduction in cycle MSE due to 2nd series =  20.0964

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
