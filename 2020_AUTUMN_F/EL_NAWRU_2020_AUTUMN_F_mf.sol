 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  17:41:19
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
     # of exog variables:     2
     # of observations:      60
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.6413       0.0730      22.4880    
  AR2:                             -0.8027       0.0733     -10.9469    
  Trend shocks var:               2.500E-03                     LB
  Slope shocks var:               3.567E-03                       
  Cycle shocks var:               6.890E-01                       
  
 Phillips curve *
  Intercept:                       -0.0000       0.0048      -0.0074    
  AR1:                              0.1611       0.1286       1.2525    
  Exog 1:                           0.0580       0.0367       1.5803    
  Exog 2:                          -0.0501       0.0377      -1.3291    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0018       0.0032      -0.5716    
  Beta - lag 1:                     0.0015                      **
  Idiosyncratic var:              1.322E-03                       
  
 -2*log-likelihood:           -64.0071
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.1534
    r(2) = -0.1802
    r(3) = -0.1053
    r(4) = -0.1220
   Approximated standard deviation:    0.1291
   Ljung-Box stat. Q(4) =   5.1140   p-value  =   0.2758

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0305
    r(2) = -0.0252
    r(3) = -0.1774
    r(4) = -0.0268
   Approximated standard deviation            =   0.1291
   Ljung-Box stat. Q(4) =   2.2008   p-value  =   0.6989
    
   R-squared (one-step-ahead predictions)     =   0.0699
   R-squared (fitted values)                  =   0.0595
   % of variance explained by common cycle    =   0.6735
   % reduction in cycle MSE due to 2nd series =   0.4007

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
