 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:16:50
 Input directory:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Output location:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
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
     # of exog variables:     1
     # of observations:      27
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.2393       0.1187      10.4376    
  AR2:                             -0.6747       0.0957      -7.0502    
  Trend shocks var:               1.400E-01                     UB
  Slope shocks var:               2.000E-01                     UB
  Cycle shocks var:               1.000E+00                     UB
  
 Phillips curve *
  Intercept:                        0.0071       0.0060       1.1696    
  AR1:                              0.4393       0.1338       3.2842    
  Exog 1:                           0.0678       0.0291       2.3343    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0114       0.0029      -3.9231    
  Beta - lag 1:                     0.0075                      **
  Idiosyncratic var:              7.222E-04                       
  
 -2*log-likelihood:            25.6955
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0830
    r(2) = -0.2492
    r(3) = -0.0303
    r(4) =  0.1090
   Approximated standard deviation:    0.1925
   Ljung-Box stat. Q(4) =   2.4254   p-value  =   0.6580

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0385
    r(2) = -0.0799
    r(3) =  0.0365
    r(4) = -0.3225
   Approximated standard deviation            =   0.1925
   Ljung-Box stat. Q(4) =   3.8278   p-value  =   0.4298
    
   R-squared (one-step-ahead predictions)     =   0.4957
   R-squared (fitted values)                  =   0.5679
   % of variance explained by common cycle    =  31.2373
   % reduction in cycle MSE due to 2nd series =  21.4435

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
