 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:44: 8
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
  AR1:                              1.2149       0.1221       9.9471    
  AR2:                             -0.5097       0.1061      -4.8024    
  Trend shocks var:               1.000E-02                     UB
  Slope shocks var:               5.000E-02                     LB
  Cycle shocks var:               4.000E-01                     UB
  
 Phillips curve *
  Intercept:                        0.0003       0.0033       0.0947    
  AR1:                              0.2462       0.1272       1.9358    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0071       0.0036      -1.9472    
  Beta - lag 1:                     0.0036                      **
  Idiosyncratic var:              5.513E-04                       
  
 -2*log-likelihood:          -105.2376
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0016
    r(2) = -0.2197
    r(3) =  0.0712
    r(4) =  0.0691
   Approximated standard deviation:    0.1302
   Ljung-Box stat. Q(4) =   3.5692   p-value  =   0.4674

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.0372
    r(2) = -0.0743
    r(3) = -0.1941
    r(4) =  0.1014
   Approximated standard deviation            =   0.1302
   Ljung-Box stat. Q(4) =   3.5268   p-value  =   0.4738
    
   R-squared (one-step-ahead predictions)     =   0.1555
   R-squared (fitted values)                  =   0.1381
   % of variance explained by common cycle    =   7.6430
   % reduction in cycle MSE due to 2nd series =   9.0680

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
