 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:15:25
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
     # of exog variables:    10
     # of observations:      58
     Endogenous regressors:
       Series # 1  cycle lag 0                                     

 Note: Second equation intercept assigned to cycle.
                         
 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              0.8037       0.1686       4.7663    
  AR2:                             -0.2156       0.1432      -1.5050    
  Trend shocks var:               1.000E-08                     LB
  Slope shocks var:               1.000E-02                     LB
  Cycle shocks var:               1.168E-01                       
  
 Phillips curve *
  Intercept:                       -0.0011       0.0012      -0.9401    
  Exog 2:                           0.6795       0.0998       6.8057    
  Exog 10:                          0.8632       0.0935       9.2327    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0042       0.0028      -1.5145    
  Idiosyncratic var:              6.750E-05                       
  
 -2*log-likelihood:          -312.6551
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0919
    r(2) = -0.0052
    r(3) = -0.1065
    r(4) = -0.0898
   Approximated standard deviation:    0.1313
   Ljung-Box stat. Q(4) =   1.6989   p-value  =   0.7909

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.1137
    r(2) = -0.0193
    r(3) =  0.0744
    r(4) = -0.1103
   Approximated standard deviation            =   0.1313
   Ljung-Box stat. Q(4) =   1.9471   p-value  =   0.7455
    
   R-squared (one-step-ahead predictions)     =   0.5775
   R-squared (fitted values)                  =   0.6017
   % of variance explained by common cycle    =   5.3340
   % reduction in cycle MSE due to 2nd series =   8.9935

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
