 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:17:47
 Input directory:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Output location:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
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
  AR1:                              0.8139       0.0959       8.4884    
  AR2:                             -0.2568       0.0912      -2.8165    
  Trend shocks var:               1.000E-04                     UB
  Slope shocks var:               2.000E-03                     UB
  Cycle shocks var:               5.150E-01                     UB
  
 Phillips curve *
  Intercept:                       -0.0003       0.0020      -0.1790    
  Exog 1:                           0.6124       0.3282       1.8660    
  Exog 2:                           0.3068       0.1415       2.1688    
  Exog 3:                           0.4221       0.3160       1.3360    
  Exog 4:                           0.0000                      LB
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0014       0.0014      -0.9805    
  Idiosyncratic var:              2.081E-04                     UB
  
 -2*log-likelihood:           -93.6676
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0012
    r(2) =  0.0175
    r(3) =  0.0185
    r(4) = -0.0092
   Approximated standard deviation:    0.1313
   Ljung-Box stat. Q(4) =   0.0446   p-value  =   0.9998

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.3803
    r(2) =  0.0811
    r(3) = -0.0830
    r(4) = -0.0472
   Approximated standard deviation            =   0.1313
   Ljung-Box stat. Q(4) =   9.8186   p-value  =   0.0436
    
   R-squared (one-step-ahead predictions)     =   0.1149
   R-squared (fitted values)                  =   0.0866
   % of variance explained by common cycle    =   0.8845
   % reduction in cycle MSE due to 2nd series =   1.6222

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
