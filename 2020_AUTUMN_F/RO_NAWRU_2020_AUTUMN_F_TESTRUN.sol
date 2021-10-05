 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:17:29
 Input directory:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Output location:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      22
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     0
     # of observations:      22
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                             -0.3038       0.1599      -1.8995    
  AR2:                              0.0437       0.1276       0.3426    
  Trend shocks var:               1.000E-02                     UB
  Slope shocks var:               8.000E-03                     UB
  Cycle shocks var:               5.500E-02                     UB
  
 Phillips curve *
  Intercept:                        0.0161       0.0126       1.2813    
  AR1:                              0.0000                      LB
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.1153       0.0269      -4.2886    
  Beta - lag 1:                    -0.0050                      **
  Idiosyncratic var:              2.642E-03                       
  
 -2*log-likelihood:            40.0334
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.3848
    r(2) = -0.0618
    r(3) = -0.2855
    r(4) = -0.1899
   Approximated standard deviation:    0.2132
   Ljung-Box stat. Q(4) =   6.6226   p-value  =   0.1572

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.4236
    r(2) =  0.3073
    r(3) = -0.2190
    r(4) = -0.0520
   Approximated standard deviation            =   0.2132
   Ljung-Box stat. Q(4) =   8.4166   p-value  =   0.0775
    
   R-squared (one-step-ahead predictions)     =   0.0696
   R-squared (fitted values)                  =   0.4946
   % of variance explained by common cycle    =  23.1119
   % reduction in cycle MSE due to 2nd series =  14.9774

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
