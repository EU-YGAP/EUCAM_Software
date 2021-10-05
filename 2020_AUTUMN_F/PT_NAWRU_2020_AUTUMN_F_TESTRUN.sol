 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:17:25
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
     # of exog variables:     3
     # of observations:      60
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.2805       0.1260      10.1641    
  AR2:                             -0.6116       0.1101      -5.5571    
  Trend shocks var:               1.000E-02                     UB
  Slope shocks var:               1.327E-01                       
  Cycle shocks var:               3.500E-01                     UB
  
 Phillips curve *
  Intercept:                        0.0006       0.0050       0.1171    
  AR1:                              0.3271       0.1185       2.7599    
  Exog 1:                          -0.7703       0.3333      -2.3114    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0133       0.0065      -2.0379    
  Beta - lag 1:                     0.0080                      **
  Idiosyncratic var:              1.357E-03                       
  
 -2*log-likelihood:           -61.6704
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0994
    r(2) = -0.0491
    r(3) =  0.0910
    r(4) = -0.0387
   Approximated standard deviation:    0.1291
   Ljung-Box stat. Q(4) =   1.3735   p-value  =   0.8488

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.1302
    r(2) = -0.2146
    r(3) = -0.1124
    r(4) =  0.0078
   Approximated standard deviation            =   0.1291
   Ljung-Box stat. Q(4) =   4.8500   p-value  =   0.3030
    
   R-squared (one-step-ahead predictions)     =   0.2100
   R-squared (fitted values)                  =   0.2239
   % of variance explained by common cycle    =  10.0424
   % reduction in cycle MSE due to 2nd series =   9.5788

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
