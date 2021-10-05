 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:42:32
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
     # of exog variables:     2
     # of observations:      59
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.5335       0.0785      19.5311    
  AR2:                             -0.6926       0.0754      -9.1875    
  Trend shocks var:               1.200E-02                     UB
  Slope shocks var:               3.658E-03                       
  Cycle shocks var:               7.500E-01                     UB
  
 Phillips curve *
  Intercept:                       -0.0001       0.0049      -0.0216    
  AR1:                              0.1391       0.1301       1.0691    
  Exog 1:                           0.0388       0.0374       1.0372    
  Exog 2:                          -0.0288       0.0383      -0.7505    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0038       0.0030      -1.2545    
  Beta - lag 1:                     0.0026                      **
  Idiosyncratic var:              1.339E-03                       
  
 -2*log-likelihood:           -17.4038
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0802
    r(2) =  0.0019
    r(3) = -0.0343
    r(4) = -0.0328
   Approximated standard deviation:    0.1302
   Ljung-Box stat. Q(4) =   0.5285   p-value  =   0.9707

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0073
    r(2) = -0.0530
    r(3) = -0.1725
    r(4) = -0.0237
   Approximated standard deviation            =   0.1302
   Ljung-Box stat. Q(4) =   2.1299   p-value  =   0.7119
    
   R-squared (one-step-ahead predictions)     =   0.0347
   R-squared (fitted values)                  =   0.0493
   % of variance explained by common cycle    =   2.3376
   % reduction in cycle MSE due to 2nd series =   2.9527

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
