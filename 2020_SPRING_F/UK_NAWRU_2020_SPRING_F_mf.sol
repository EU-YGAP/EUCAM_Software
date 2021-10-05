 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:44:18
 Input directory:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Output location:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
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
  AR1:                              1.2074       0.1362       8.8667    
  AR2:                             -0.5247       0.1271      -4.1268    
  Trend shocks var:               4.000E-02                     UB
  Slope shocks var:               2.000E-02                     UB
  Cycle shocks var:               5.000E-01                     UB
  
 Phillips curve *
  Intercept:                        0.0010       0.0038       0.2504    
  AR1:                              0.9700                      **
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0068       0.0039      -1.7548    
  Beta - lag 1:                     0.0018                      **
  Idiosyncratic var:              7.000E-04                     UB
  
 -2*log-likelihood:           -61.1053
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0210
    r(2) =  0.0561
    r(3) =  0.0265
    r(4) =  0.0385
   Approximated standard deviation:    0.1302
   Ljung-Box stat. Q(4) =   0.3564   p-value  =   0.9859

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.3343
    r(2) = -0.2092
    r(3) =  0.0567
    r(4) = -0.1471
   Approximated standard deviation            =   0.1302
   Ljung-Box stat. Q(4) =  11.3203   p-value  =   0.0232
    
   R-squared (one-step-ahead predictions)     =   0.0000
   R-squared (fitted values)                  =  -0.1052
   % of variance explained by common cycle    =  15.4541
   % reduction in cycle MSE due to 2nd series =  11.8606

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
