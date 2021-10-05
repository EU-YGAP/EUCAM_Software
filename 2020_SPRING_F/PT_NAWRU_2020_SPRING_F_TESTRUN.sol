 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  18:34: 5
 Input directory:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Output location:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
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
     # of exog variables:     3
     # of observations:      60
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.2259       0.1248       9.8265    
  AR2:                             -0.6193       0.1134      -5.4592    
  Trend shocks var:               1.000E-02                     UB
  Slope shocks var:               1.636E-01                       
  Cycle shocks var:               3.500E-01                     UB
  
 Phillips curve *
  Intercept:                        0.0006       0.0048       0.1279    
  AR1:                              0.3342       0.1149       2.9076    
  Exog 1:                          -0.7118       0.3227      -2.2057    
  Exog 2:                           0.0663       0.0379       1.7500    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0150       0.0068      -2.2108    
  Beta - lag 1:                     0.0091                      **
  Idiosyncratic var:              1.250E-03                       
  
 -2*log-likelihood:           -60.1982
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.1238
    r(2) = -0.0672
    r(3) =  0.0557
    r(4) = -0.0212
   Approximated standard deviation:    0.1291
   Ljung-Box stat. Q(4) =   1.4416   p-value  =   0.8369

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.1635
    r(2) = -0.2268
    r(3) = -0.1129
    r(4) =  0.0302
   Approximated standard deviation            =   0.1291
   Ljung-Box stat. Q(4) =   5.8753   p-value  =   0.2087
    
   R-squared (one-step-ahead predictions)     =   0.2316
   R-squared (fitted values)                  =   0.2537
   % of variance explained by common cycle    =  12.5547
   % reduction in cycle MSE due to 2nd series =  10.9684

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
