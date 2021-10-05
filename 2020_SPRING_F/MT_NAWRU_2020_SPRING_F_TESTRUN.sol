 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  18:24: 8
 Input directory:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Output location:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      25
   Second equation
     Specification:        ARMAX                                   
     AR order:                0
     MA order:                0
     # of exog variables:     6
     # of observations:      25
     Endogenous regressors:
       Series # 1  cycle lag 0                                     

 Note: Second equation intercept assigned to cycle.
                         
 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              0.4908       0.2427       2.0222    
  AR2:                             -0.3222       0.1844      -1.7477    
  Trend shocks var:               1.000E-02                     UB
  Slope shocks var:               1.000E-02                     **
  Cycle shocks var:               8.000E-02                     UB
  
 Phillips curve *
  Exog 1:                           0.0525       0.4338       0.1210    
  Exog 2:                           0.3121       0.1497       2.0843    
  Exog 3:                          -0.2371       0.4505      -0.5264    
  Exog 4:                           0.2986       0.1469       2.0335    
  Exog 5:                           0.0001       0.0272       0.0055    
  Endogeneous regressors from series 1
  Beta - lag 0:                     0.0022       0.0141       0.1534    
  Idiosyncratic var:              4.391E-04                       
  
 -2*log-likelihood:           -69.7924
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0241
    r(2) = -0.0290
    r(3) = -0.0572
    r(4) = -0.1807
   Approximated standard deviation:    0.2000
   Ljung-Box stat. Q(4) =   1.1210   p-value  =   0.8909

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.4019
    r(2) = -0.2670
    r(3) =  0.3338
    r(4) = -0.2040
   Approximated standard deviation            =   0.2000
   Ljung-Box stat. Q(4) =  11.3917   p-value  =   0.0225
    
   R-squared (one-step-ahead predictions)     =   0.2514
   R-squared (fitted values)                  =   0.2574
   % of variance explained by common cycle    =   0.1100
   % reduction in cycle MSE due to 2nd series =   0.1100

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
