 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:16:18
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
     # of exog variables:     2
     # of observations:      60
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.3833       0.1341      10.3123    
  AR2:                             -0.5007       0.1095      -4.5710    
  Trend shocks var:               2.000E-01                     UB
  Slope shocks var:               1.400E-01                     UB
  Cycle shocks var:               1.350E+00                     UB
  
 Phillips curve *
  Intercept:                       -0.0002       0.0038      -0.0393    
  AR1:                              0.0840       0.1220       0.6886    
  Exog 1:                           0.0921       0.0219       4.2001    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0041       0.0015      -2.7291    
  Beta - lag 1:                     0.0021                      **
  Idiosyncratic var:              3.994E-04                       
  
 -2*log-likelihood:           -51.1664
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0241
    r(2) = -0.1475
    r(3) =  0.1011
    r(4) = -0.0687
   Approximated standard deviation:    0.1291
   Ljung-Box stat. Q(4) =   2.3390   p-value  =   0.6737

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.2082
    r(2) = -0.0757
    r(3) =  0.0485
    r(4) =  0.0874
   Approximated standard deviation            =   0.1291
   Ljung-Box stat. Q(4) =   3.7612   p-value  =   0.4393
    
   R-squared (one-step-ahead predictions)     =   0.2707
   R-squared (fitted values)                  =   0.3958
   % of variance explained by common cycle    =  16.4463
   % reduction in cycle MSE due to 2nd series =  35.2950

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
