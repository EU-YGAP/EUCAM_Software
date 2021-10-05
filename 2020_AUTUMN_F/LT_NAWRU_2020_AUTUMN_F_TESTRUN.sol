 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:16:51
 Input directory:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Output location:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      27
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     0
     # of observations:      27
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.2551       0.1213      10.3480    
  AR2:                             -0.6806       0.0991      -6.8653    
  Trend shocks var:               1.400E-01                     UB
  Slope shocks var:               2.000E-01                     UB
  Cycle shocks var:               1.000E+00                     UB
  
 Phillips curve *
  Intercept:                        0.0060       0.0066       0.9134    
  AR1:                              0.4852       0.1398       3.4708    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0100       0.0031      -3.2591    
  Beta - lag 1:                     0.0066                      **
  Idiosyncratic var:              8.909E-04                       
  
 -2*log-likelihood:            30.6424
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0662
    r(2) = -0.2670
    r(3) = -0.0216
    r(4) =  0.1250
   Approximated standard deviation:    0.1925
   Ljung-Box stat. Q(4) =   2.7316   p-value  =   0.6037

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.0036
    r(2) = -0.0725
    r(3) = -0.0077
    r(4) = -0.2913
   Approximated standard deviation            =   0.1925
   Ljung-Box stat. Q(4) =   3.0556   p-value  =   0.5486
    
   R-squared (one-step-ahead predictions)     =   0.4533
   R-squared (fitted values)                  =   0.4507
   % of variance explained by common cycle    =  22.5466
   % reduction in cycle MSE due to 2nd series =  14.8556

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
