 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  17:23:59
 Input directory:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Output location:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      28
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     0
     # of observations:      28
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              0.7758       0.1551       5.0004    
  AR2:                             -0.8178       0.2329      -3.5107    
  Trend shocks var:               1.500E-01                     UB
  Slope shocks var:               2.000E-01                     UB
  Cycle shocks var:               9.749E-02                       
  
 Phillips curve *
  Intercept:                        0.0014       0.0039       0.3691    
  AR1:                              0.3726       0.1737       2.1451    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0132       0.0072      -1.8316    
  Beta - lag 1:                     0.0106                      **
  Idiosyncratic var:              3.534E-04                       
  
 -2*log-likelihood:           -60.9785
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0042
    r(2) = -0.1819
    r(3) =  0.2293
    r(4) = -0.0997
   Approximated standard deviation:    0.1890
   Ljung-Box stat. Q(4) =   2.9975   p-value  =   0.5582

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0453
    r(2) =  0.0029
    r(3) = -0.1523
    r(4) = -0.1271
   Approximated standard deviation            =   0.1890
   Ljung-Box stat. Q(4) =   1.4090   p-value  =   0.8426
    
   R-squared (one-step-ahead predictions)     =   0.1925
   R-squared (fitted values)                  =   0.2644
   % of variance explained by common cycle    =  14.5801
   % reduction in cycle MSE due to 2nd series =   7.9018

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
