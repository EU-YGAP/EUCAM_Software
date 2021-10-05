 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:17:18
 Input directory:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Output location:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      30
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     1
     # of observations:      30
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.4240       0.1110      12.8236    
  AR2:                             -0.7414       0.1335      -5.5554    
  Trend shocks var:               1.500E-01                     **
  Slope shocks var:               9.400E-02                       
  Cycle shocks var:               6.041E-01                       
  
 Phillips curve *
  Intercept:                       -0.0055       0.0045      -1.2350    
  AR1:                              0.0019       0.1821       0.0105    
  Exog 1:                           0.0498       0.0231       2.1561    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0102       0.0034      -2.9518    
  Beta - lag 1:                     0.0075                      **
  Idiosyncratic var:              4.789E-04                       
  
 -2*log-likelihood:           -47.1821
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0598
    r(2) = -0.3833
    r(3) =  0.0489
    r(4) = -0.0101
   Approximated standard deviation:    0.1826
   Ljung-Box stat. Q(4) =   4.9405   p-value  =   0.2935

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.0600
    r(2) =  0.2131
    r(3) = -0.1508
    r(4) =  0.0135
   Approximated standard deviation            =   0.1826
   Ljung-Box stat. Q(4) =   2.4915   p-value  =   0.6462
    
   R-squared (one-step-ahead predictions)     =   0.2662
   R-squared (fitted values)                  =   0.4297
   % of variance explained by common cycle    =  22.8103
   % reduction in cycle MSE due to 2nd series =  19.7982

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
