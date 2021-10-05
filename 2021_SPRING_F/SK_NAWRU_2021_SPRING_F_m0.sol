 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:17:38
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
     # of exog variables:     3
     # of observations:      27
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.3097       0.1586       8.2567    
  AR2:                             -0.6133       0.1313      -4.6702    
  Trend shocks var:               2.844E-01                       
  Slope shocks var:               4.000E-02                     LB
  Cycle shocks var:               1.000E+00                     UB
  
 Phillips curve *
  Intercept:                       -0.0026       0.0046      -0.5772    
  AR1:                              0.2840       0.1565       1.8149    
  Exog 1:                          -1.5317       0.3749      -4.0856    
  Exog 2:                           0.0345       0.0220       1.5689    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0073       0.0031      -2.3549    
  Beta - lag 1:                     0.0044                      **
  Idiosyncratic var:              4.194E-04                       
  
 -2*log-likelihood:           -33.4859
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0934
    r(2) = -0.2872
    r(3) = -0.0082
    r(4) = -0.0656
   Approximated standard deviation:    0.1925
   Ljung-Box stat. Q(4) =   2.8064   p-value  =   0.5907

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0247
    r(2) = -0.0662
    r(3) = -0.0317
    r(4) = -0.0874
   Approximated standard deviation            =   0.1925
   Ljung-Box stat. Q(4) =   0.4486   p-value  =   0.9783
    
   R-squared (one-step-ahead predictions)     =   0.3796
   R-squared (fitted values)                  =   0.4805
   % of variance explained by common cycle    =  24.0543
   % reduction in cycle MSE due to 2nd series =  21.3319

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
