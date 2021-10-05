 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:45:48
 Input directory:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Output location:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      22
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     1
     # of observations:      22
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              0.6247       0.4348       1.4369    
  AR2:                             -0.0382       0.4262      -0.0896    
  Trend shocks var:               1.050E-01                     UB
  Slope shocks var:               3.500E-01                     UB
  Cycle shocks var:               7.000E-01                     UB
  
 Phillips curve *
  Intercept:                       -0.0048       0.0046      -1.0537    
  AR1:                              0.0000                      LB
  Exog 1:                          -1.8458       0.4495      -4.1061    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0030       0.0037      -0.8172    
  Beta - lag 1:                     0.0001                      **
  Idiosyncratic var:              3.828E-04                       
  
 -2*log-likelihood:            -8.9762
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0790
    r(2) =  0.0795
    r(3) = -0.0123
    r(4) = -0.3667
   Approximated standard deviation:    0.2132
   Ljung-Box stat. Q(4) =   4.0019   p-value  =   0.4057

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.1273
    r(2) = -0.0351
    r(3) =  0.0114
    r(4) = -0.2026
   Approximated standard deviation            =   0.2132
   Ljung-Box stat. Q(4) =   1.6477   p-value  =   0.8002
    
   R-squared (one-step-ahead predictions)     =   0.3958
   R-squared (fitted values)                  =   0.3891
   % of variance explained by common cycle    =   2.4015
   % reduction in cycle MSE due to 2nd series =   3.8907

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
