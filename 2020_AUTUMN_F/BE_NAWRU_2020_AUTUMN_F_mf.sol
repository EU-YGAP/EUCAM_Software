 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  17:14:55
 Input directory:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Output location:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      58
   Second equation
     Specification:        ARMAX                                   
     AR order:                0
     MA order:                0
     # of exog variables:     4
     # of observations:      58
     Endogenous regressors:
       Series # 1  cycle lag 0                                     

 Note: Second equation intercept assigned to cycle.
                         
 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.1040       0.1556       7.0953    
  AR2:                             -0.5802       0.1199      -4.8393    
  Trend shocks var:               1.000E-02                     LB
  Slope shocks var:               4.300E-02                     UB
  Cycle shocks var:               2.615E-01                       
  
 Phillips curve *
  Intercept:                       -0.0015       0.0026      -0.5983    
  Exog 1:                           0.2482       0.1813       1.3690    
  Exog 2:                           0.4387       0.0800       5.4810    
  Exog 3:                           0.0000                      LB
  Exog 4:                           0.0000                      LB
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0100       0.0038      -2.6368    
  Idiosyncratic var:              2.596E-04                       
  
 -2*log-likelihood:          -175.3418
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.2019
    r(2) = -0.1014
    r(3) =  0.0900
    r(4) = -0.0287
   Approximated standard deviation:    0.1313
   Ljung-Box stat. Q(4) =   3.5737   p-value  =   0.4668

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0218
    r(2) = -0.0456
    r(3) = -0.2085
    r(4) = -0.1144
   Approximated standard deviation            =   0.1313
   Ljung-Box stat. Q(4) =   3.7514   p-value  =   0.4407
    
   R-squared (one-step-ahead predictions)     =   0.3762
   R-squared (fitted values)                  =   0.4776
   % of variance explained by common cycle    =  22.7844
   % reduction in cycle MSE due to 2nd series =  26.0993

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
