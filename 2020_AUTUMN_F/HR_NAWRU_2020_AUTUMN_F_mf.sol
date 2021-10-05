 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  17:59:42
 Input directory:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Output location:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      23
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     2
     # of observations:      23
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.4667       0.2341       6.2644    
  AR2:                             -0.7426       0.2664      -2.7874    
  Trend shocks var:               6.032E-02                       
  Slope shocks var:               2.700E-01                     LB
  Cycle shocks var:               5.236E-01                       
  
 Phillips curve *
  Intercept:                       -0.0062       0.0041      -1.5142    
  AR1:                              0.0000                      LB
  Exog 1:                          -1.4644       0.5359      -2.7325    
  Exog 2:                           0.1157       0.0205       5.6568    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0056       0.0047      -1.2009    
  Beta - lag 1:                     0.0042                      **
  Idiosyncratic var:              3.278E-04                       
  
 -2*log-likelihood:           -44.3372
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.1078
    r(2) =  0.0012
    r(3) =  0.2074
    r(4) = -0.4020
   Approximated standard deviation:    0.2085
   Ljung-Box stat. Q(4) =   6.0267   p-value  =   0.1972

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.1471
    r(2) = -0.0538
    r(3) = -0.0221
    r(4) = -0.1198
   Approximated standard deviation            =   0.2085
   Ljung-Box stat. Q(4) =   1.0932   p-value  =   0.8953
    
   R-squared (one-step-ahead predictions)     =   0.6565
   R-squared (fitted values)                  =   0.6794
   % of variance explained by common cycle    =  10.5522
   % reduction in cycle MSE due to 2nd series =  12.1224

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
