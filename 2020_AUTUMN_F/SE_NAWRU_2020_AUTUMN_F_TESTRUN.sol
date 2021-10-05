 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:17:33
 Input directory:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Output location:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
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
     # of exog variables:     0
     # of observations:      60
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.3033       0.1218      10.7035    
  AR2:                             -0.5670       0.1038      -5.4633    
  Trend shocks var:               1.000E-02                     UB
  Slope shocks var:               5.000E-02                     LB
  Cycle shocks var:               4.000E-01                     UB
  
 Phillips curve *
  Intercept:                       -0.0003       0.0033      -0.0904    
  AR1:                              0.2164       0.1257       1.7217    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0082       0.0038      -2.1379    
  Beta - lag 1:                     0.0046                      **
  Idiosyncratic var:              5.625E-04                       
  
 -2*log-likelihood:          -121.2707
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0427
    r(2) = -0.3198
    r(3) =  0.0846
    r(4) =  0.1191
   Approximated standard deviation:    0.1291
   Ljung-Box stat. Q(4) =   7.8320   p-value  =   0.0979

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.0125
    r(2) = -0.0673
    r(3) = -0.1957
    r(4) =  0.1061
   Approximated standard deviation            =   0.1291
   Ljung-Box stat. Q(4) =   3.5487   p-value  =   0.4705
    
   R-squared (one-step-ahead predictions)     =   0.1634
   R-squared (fitted values)                  =   0.1577
   % of variance explained by common cycle    =  10.1840
   % reduction in cycle MSE due to 2nd series =  12.2358

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
