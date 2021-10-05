 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:45:19
 Input directory:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Output location:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      25
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     2
     # of observations:      25
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.4505       0.1715       8.4561    
  AR2:                             -0.6295       0.1440      -4.3701    
  Trend shocks var:               3.500E-02                     UB
  Slope shocks var:               1.300E-01                     LB
  Cycle shocks var:               9.500E-01                     UB
  
 Phillips curve *
  Intercept:                        0.0004       0.0058       0.0694    
  AR1:                              0.0000                      LB
  Exog 1:                           0.0017       0.0275       0.0619    
  Exog 2:                           0.0150       0.0276       0.5419    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0041       0.0035      -1.1753    
  Beta - lag 1:                     0.0025                      **
  Idiosyncratic var:              6.994E-04                       
  
 -2*log-likelihood:           -22.0894
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0168
    r(2) = -0.2258
    r(3) =  0.0252
    r(4) =  0.0831
   Approximated standard deviation:    0.2000
   Ljung-Box stat. Q(4) =   1.6309   p-value  =   0.8032

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0986
    r(2) =  0.0820
    r(3) = -0.0655
    r(4) = -0.0676
   Approximated standard deviation            =   0.2000
   Ljung-Box stat. Q(4) =   0.7485   p-value  =   0.9452
    
   R-squared (one-step-ahead predictions)     =   0.0867
   R-squared (fitted values)                  =   0.0883
   % of variance explained by common cycle    =   4.7639
   % reduction in cycle MSE due to 2nd series =   9.0843

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
