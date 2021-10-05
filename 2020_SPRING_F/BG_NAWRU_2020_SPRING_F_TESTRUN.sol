 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  17:17:12
 Input directory:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Output location:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
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
  AR1:                              1.3755       0.3828       3.5936    
  AR2:                             -0.5917       0.3056      -1.9365    
  Trend shocks var:               3.000E-02                     UB
  Slope shocks var:               5.000E-01                     UB
  Cycle shocks var:               9.000E-01                     UB
  
 Phillips curve *
  Intercept:                        0.0201       0.0092       2.1854    
  AR1:                              0.2565       0.2194       1.1690    
  Exog 1:                           0.0415       0.0342       1.2134    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0000       0.0086      -0.0030    
  Beta - lag 1:                     0.0000                      **
  Idiosyncratic var:              1.002E-03                       
  
 -2*log-likelihood:            -7.5997
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.1756
    r(2) = -0.0008
    r(3) = -0.0350
    r(4) =  0.0950
   Approximated standard deviation:    0.2132
   Ljung-Box stat. Q(4) =   0.9939   p-value  =   0.9107

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.1275
    r(2) = -0.3154
    r(3) = -0.1129
    r(4) =  0.2064
   Approximated standard deviation            =   0.2132
   Ljung-Box stat. Q(4) =   4.6393   p-value  =   0.3263
    
   R-squared (one-step-ahead predictions)     =   0.4075
   R-squared (fitted values)                  =   0.0610
   % of variance explained by common cycle    =   0.0002
   % reduction in cycle MSE due to 2nd series =   0.0002

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
