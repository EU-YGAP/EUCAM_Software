 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  18:18:33
 Input directory:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Output location:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      43
   Second equation
     Specification:        ARMAX                                   
     AR order:                0
     MA order:                1
     # of exog variables:     4
     # of observations:      43
     Endogenous regressors:
       Series # 1  cycle lag 0                                     

 Note: Second equation intercept assigned to cycle.
                         
 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              0.7564       0.1794       4.2170    
  AR2:                             -0.1505       0.1658      -0.9076    
  Trend shocks var:               1.000E-08                     LB
  Slope shocks var:               9.132E-04                       
  Cycle shocks var:               2.033E-01                       
  
 Phillips curve *
  Intercept:                       -0.0016       0.0008      -2.0343    
  MA1:                             -0.9700                      LB
  Exog 2:                           0.2949       0.0969       3.0445    
  Exog 3:                           0.0212       0.1608       0.1319    
  Exog 4:                           0.1075       0.0955       1.1257    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0040       0.0026      -1.5163    
  Idiosyncratic var:              2.410E-04                       
  
 -2*log-likelihood:          -154.6469
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.1707
    r(2) =  0.1527
    r(3) = -0.2648
    r(4) = -0.0223
   Approximated standard deviation:    0.1525
   Ljung-Box stat. Q(4) =   5.6148   p-value  =   0.2298

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.2328
    r(2) = -0.1233
    r(3) = -0.0330
    r(4) =  0.0036
   Approximated standard deviation            =   0.1525
   Ljung-Box stat. Q(4) =   3.2676   p-value  =   0.5141
    
   R-squared (one-step-ahead predictions)     =   0.3659
   R-squared (fitted values)                  =   1.0000
   % of variance explained by common cycle    = 100.0000
   % reduction in cycle MSE due to 2nd series =  33.9044

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
