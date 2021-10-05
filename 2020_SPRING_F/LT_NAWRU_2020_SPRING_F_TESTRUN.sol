 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  18:15:19
 Input directory:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Output location:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      27
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     0
     # of observations:      27
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.2707       0.1029      12.3523    
  AR2:                             -0.7220       0.0868      -8.3212    
  Trend shocks var:               1.400E-01                     UB
  Slope shocks var:               2.000E-01                     UB
  Cycle shocks var:               1.000E+00                     UB
  
 Phillips curve *
  Intercept:                        0.0055       0.0054       1.0189    
  AR1:                              0.3104       0.1344       2.3098    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0132       0.0028      -4.8111    
  Beta - lag 1:                     0.0094                      **
  Idiosyncratic var:              5.999E-04                       
  
 -2*log-likelihood:             5.3747
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0077
    r(2) = -0.3435
    r(3) = -0.0204
    r(4) =  0.0185
   Approximated standard deviation:    0.1925
   Ljung-Box stat. Q(4) =   3.4877   p-value  =   0.4798

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0416
    r(2) = -0.0392
    r(3) =  0.1290
    r(4) = -0.2529
   Approximated standard deviation            =   0.1925
   Ljung-Box stat. Q(4) =   2.8209   p-value  =   0.5882
    
   R-squared (one-step-ahead predictions)     =   0.4962
   R-squared (fitted values)                  =   0.6995
   % of variance explained by common cycle    =  44.1439
   % reduction in cycle MSE due to 2nd series =  28.5802

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
