 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  18:12:37
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
     # of exog variables:     0
     # of observations:      58
     Endogenous regressors:
       Series # 1  cycle lag 0-2                                   

 Note: Second equation intercept assigned to cycle.
                         
 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.4387       0.1377      10.4500    
  AR2:                             -0.5760       0.1241      -4.6418    
  Trend shocks var:               1.000E-01                     UB
  Slope shocks var:               6.000E-03                     LB
  Cycle shocks var:               1.750E-01                     UB
  
 Phillips curve *
  Intercept:                       -0.0014       0.0031      -0.4474    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0240       0.0084      -2.8688    
  Beta - lag 1:                     0.0389       0.0143       2.7244    
  Beta - lag 2:                    -0.0171       0.0085      -2.0227    
  Idiosyncratic var:              4.779E-04                       
  
 -2*log-likelihood:          -148.8990
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0322
    r(2) = -0.1627
    r(3) = -0.0371
    r(4) =  0.1553
   Approximated standard deviation:    0.1313
   Ljung-Box stat. Q(4) =   3.2458   p-value  =   0.5176

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0051
    r(2) = -0.1905
    r(3) =  0.1220
    r(4) =  0.0826
   Approximated standard deviation            =   0.1313
   Ljung-Box stat. Q(4) =   3.6362   p-value  =   0.4575
    
   R-squared (one-step-ahead predictions)     =   0.0120
   R-squared (fitted values)                  =   0.2726
   % of variance explained by common cycle    =  18.1997
   % reduction in cycle MSE due to 2nd series =   8.0582

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
