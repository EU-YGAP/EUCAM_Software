 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:42:17
 Input directory:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Output location:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      57
   Second equation
     Specification:        ARMAX                                   
     AR order:                0
     MA order:                0
     # of exog variables:     4
     # of observations:      57
     Endogenous regressors:
       Series # 1  cycle lag 0                                     

 Note: Second equation intercept assigned to cycle.
                         
 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.2212       0.1213      10.0665    
  AR2:                             -0.6488       0.1047      -6.1951    
  Trend shocks var:               2.000E-03                     LB
  Slope shocks var:               2.305E-02                       
  Cycle shocks var:               2.063E-01                       
  
 Phillips curve *
  Intercept:                       -0.0009       0.0026      -0.3273    
  Exog 2:                           0.4332       0.1032       4.1954    
  Exog 3:                          -0.1415       0.2118      -0.6680    
  Exog 4:                           0.2936       0.1345       2.1834    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0074       0.0033      -2.2184    
  Idiosyncratic var:              3.224E-04                       
  
 -2*log-likelihood:          -183.8803
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.1134
    r(2) = -0.1164
    r(3) =  0.0251
    r(4) =  0.0281
   Approximated standard deviation:    0.1325
   Ljung-Box stat. Q(4) =   1.6343   p-value  =   0.8026

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.2031
    r(2) = -0.2145
    r(3) = -0.1451
    r(4) =  0.1198
   Approximated standard deviation            =   0.1325
   Ljung-Box stat. Q(4) =   7.5126   p-value  =   0.1112
    
   R-squared (one-step-ahead predictions)     =   0.2548
   R-squared (fitted values)                  =   0.3285
   % of variance explained by common cycle    =  11.9048
   % reduction in cycle MSE due to 2nd series =  13.7577

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
