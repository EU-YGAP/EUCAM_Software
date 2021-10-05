 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  17:29:23
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
  AR1:                              1.2226       0.1180      10.3624    
  AR2:                             -0.6559       0.1024      -6.4045    
  Trend shocks var:               2.000E-03                     LB
  Slope shocks var:               2.608E-02                       
  Cycle shocks var:               1.957E-01                       
  
 Phillips curve *
  Intercept:                       -0.0010       0.0026      -0.3754    
  Exog 2:                           0.4463       0.1120       3.9849    
  Exog 3:                          -0.1343       0.2128      -0.6310    
  Exog 4:                           0.2629       0.1224       2.1474    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0077       0.0033      -2.3365    
  Idiosyncratic var:              3.234E-04                       
  
 -2*log-likelihood:          -188.3518
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.1140
    r(2) = -0.1142
    r(3) =  0.0240
    r(4) =  0.0340
   Approximated standard deviation:    0.1313
   Ljung-Box stat. Q(4) =   1.6595   p-value  =   0.7981

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.2087
    r(2) = -0.2270
    r(3) = -0.1286
    r(4) =  0.1154
   Approximated standard deviation            =   0.1313
   Ljung-Box stat. Q(4) =   7.7656   p-value  =   0.1005
    
   R-squared (one-step-ahead predictions)     =   0.2283
   R-squared (fitted values)                  =   0.3097
   % of variance explained by common cycle    =  12.2179
   % reduction in cycle MSE due to 2nd series =  13.9117

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
