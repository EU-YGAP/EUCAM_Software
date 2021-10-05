 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:16: 6
 Input directory:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Output location:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      28
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     1
     # of observations:      28
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              0.9829       0.1274       7.7171    
  AR2:                             -0.5124       0.1140      -4.4943    
  Trend shocks var:               2.500E-01                     UB
  Slope shocks var:               1.815E-03                       
  Cycle shocks var:               1.400E+00                     UB
  
 Phillips curve *
  Intercept:                        0.0066       0.0061       1.0781    
  AR1:                              0.4801       0.1485       3.2339    
  Exog 1:                           0.0327       0.0285       1.1466    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0119       0.0027      -4.3743    
  Beta - lag 1:                     0.0059                      **
  Idiosyncratic var:              7.035E-04                       
  
 -2*log-likelihood:             3.5630
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.1478
    r(2) = -0.2729
    r(3) = -0.0349
    r(4) = -0.0465
   Approximated standard deviation:    0.1890
   Ljung-Box stat. Q(4) =   3.0049   p-value  =   0.5570

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.1518
    r(2) = -0.1081
    r(3) = -0.2377
    r(4) =  0.0477
   Approximated standard deviation            =   0.1890
   Ljung-Box stat. Q(4) =   3.0724   p-value  =   0.5458
    
   R-squared (one-step-ahead predictions)     =   0.4538
   R-squared (fitted values)                  =   0.6067
   % of variance explained by common cycle    =  33.1820
   % reduction in cycle MSE due to 2nd series =  20.0724

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
