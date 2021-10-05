 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:42:39
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
  AR1:                              1.2331       0.1310       9.4150    
  AR2:                             -0.4460       0.1099      -4.0573    
  Trend shocks var:               2.000E-01                     UB
  Slope shocks var:               1.400E-01                     UB
  Cycle shocks var:               1.250E+00                     UB
  
 Phillips curve *
  Intercept:                        0.0003       0.0027       0.1225    
  AR1:                              0.2916       0.1306       2.2323    
  Exog 1:                           0.0527       0.0193       2.7260    
  Exog 2:                          -0.0587       0.0199      -2.9528    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0030       0.0014      -2.1231    
  Beta - lag 1:                     0.0013                      **
  Idiosyncratic var:              3.309E-04                       
  
 -2*log-likelihood:           -41.2696
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0426
    r(2) = -0.0620
    r(3) =  0.1058
    r(4) = -0.0506
   Approximated standard deviation:    0.1302
   Ljung-Box stat. Q(4) =   1.2036   p-value  =   0.8775

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.0101
    r(2) = -0.0871
    r(3) =  0.0869
    r(4) =  0.0760
   Approximated standard deviation            =   0.1302
   Ljung-Box stat. Q(4) =   1.3479   p-value  =   0.8532
    
   R-squared (one-step-ahead predictions)     =   0.2727
   R-squared (fitted values)                  =   0.3110
   % of variance explained by common cycle    =   9.5464
   % reduction in cycle MSE due to 2nd series =  13.6768

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
