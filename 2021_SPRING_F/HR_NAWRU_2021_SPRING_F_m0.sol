 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:16:31
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
  AR1:                              1.4354       0.1942       7.3925    
  AR2:                             -0.7326       0.1709      -4.2860    
  Trend shocks var:               1.500E-02                     UB
  Slope shocks var:               3.700E-01                     LB
  Cycle shocks var:               4.893E-01                       
  
 Phillips curve *
  Intercept:                       -0.0070       0.0042      -1.6548    
  AR1:                              0.0000                      LB
  Exog 1:                          -1.3592       0.5294      -2.5674    
  Exog 2:                           0.1094       0.0204       5.3556    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0076       0.0052      -1.4653    
  Beta - lag 1:                     0.0055                      **
  Idiosyncratic var:              3.379E-04                       
  
 -2*log-likelihood:           -43.4277
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.1266
    r(2) =  0.0328
    r(3) =  0.1866
    r(4) = -0.4309
   Approximated standard deviation:    0.2085
   Ljung-Box stat. Q(4) =   6.6240   p-value  =   0.1571

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.1067
    r(2) = -0.0195
    r(3) = -0.0116
    r(4) = -0.1615
   Approximated standard deviation            =   0.2085
   Ljung-Box stat. Q(4) =   1.1017   p-value  =   0.8940
    
   R-squared (one-step-ahead predictions)     =   0.6045
   R-squared (fitted values)                  =   0.6538
   % of variance explained by common cycle    =  15.8174
   % reduction in cycle MSE due to 2nd series =  18.3417

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
