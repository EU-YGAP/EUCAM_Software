 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:16:36
 Input directory:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Output location:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
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
  AR1:                              1.4817       0.2649       5.5923    
  AR2:                             -0.7688       0.3129      -2.4572    
  Trend shocks var:               7.903E-02                       
  Slope shocks var:               2.700E-01                     LB
  Cycle shocks var:               4.492E-01                       
  
 Phillips curve *
  Intercept:                       -0.0071       0.0042      -1.6687    
  AR1:                              0.0000                      LB
  Exog 1:                          -1.3480       0.5679      -2.3735    
  Exog 2:                           0.1078       0.0215       5.0185    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0067       0.0053      -1.2735    
  Beta - lag 1:                     0.0051                      **
  Idiosyncratic var:              3.527E-04                       
  
 -2*log-likelihood:           -43.5725
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0957
    r(2) =  0.0075
    r(3) =  0.1831
    r(4) = -0.3963
   Approximated standard deviation:    0.2085
   Ljung-Box stat. Q(4) =   5.5833   p-value  =   0.2325

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0982
    r(2) = -0.0205
    r(3) = -0.0162
    r(4) = -0.1623
   Approximated standard deviation            =   0.2085
   Ljung-Box stat. Q(4) =   1.0686   p-value  =   0.8992
    
   R-squared (one-step-ahead predictions)     =   0.6082
   R-squared (fitted values)                  =   0.6350
   % of variance explained by common cycle    =  12.6172
   % reduction in cycle MSE due to 2nd series =  13.3676

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
