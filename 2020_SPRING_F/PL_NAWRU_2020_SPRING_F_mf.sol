 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:45: 0
 Input directory:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Output location:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      29
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     1
     # of observations:      29
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.2444       0.1262       9.8637    
  AR2:                             -0.5840       0.1183      -4.9386    
  Trend shocks var:               1.500E-01                     UB
  Slope shocks var:               1.320E-01                     UB
  Cycle shocks var:               9.800E-01                     UB
  
 Phillips curve *
  Intercept:                       -0.0051       0.0048      -1.0704    
  AR1:                              0.0000                      LB
  Exog 1:                          -0.0177       0.0245      -0.7208    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0082       0.0028      -2.9553    
  Beta - lag 1:                     0.0048                      **
  Idiosyncratic var:              5.158E-04                       
  
 -2*log-likelihood:           -13.9063
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.2109
    r(2) = -0.0935
    r(3) = -0.0095
    r(4) = -0.0139
   Approximated standard deviation:    0.1857
   Ljung-Box stat. Q(4) =   1.6236   p-value  =   0.8046

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.0906
    r(2) =  0.2219
    r(3) = -0.1449
    r(4) =  0.0071
   Approximated standard deviation            =   0.1857
   Ljung-Box stat. Q(4) =   2.6307   p-value  =   0.6214
    
   R-squared (one-step-ahead predictions)     =   0.1700
   R-squared (fitted values)                  =   0.3323
   % of variance explained by common cycle    =  17.8739
   % reduction in cycle MSE due to 2nd series =  21.0992

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
