 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:17:39
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
     # of exog variables:     3
     # of observations:      27
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.2892       0.1453       8.8708    
  AR2:                             -0.5986       0.1236      -4.8442    
  Trend shocks var:               1.500E-01                     UB
  Slope shocks var:               4.000E-02                     LB
  Cycle shocks var:               1.000E+00                     UB
  
 Phillips curve *
  Intercept:                       -0.0027       0.0046      -0.5863    
  AR1:                              0.2867       0.1548       1.8516    
  Exog 1:                          -1.5466       0.3727      -4.1497    
  Exog 2:                           0.0345       0.0219       1.5725    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0072       0.0029      -2.4386    
  Beta - lag 1:                     0.0042                      **
  Idiosyncratic var:              4.198E-04                       
  
 -2*log-likelihood:           -33.3185
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.1090
    r(2) = -0.2674
    r(3) =  0.0042
    r(4) = -0.0794
   Approximated standard deviation:    0.1925
   Ljung-Box stat. Q(4) =   2.6353   p-value  =   0.6206

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0192
    r(2) = -0.0622
    r(3) = -0.0336
    r(4) = -0.0899
   Approximated standard deviation            =   0.1925
   Ljung-Box stat. Q(4) =   0.4443   p-value  =   0.9787
    
   R-squared (one-step-ahead predictions)     =   0.3789
   R-squared (fitted values)                  =   0.4705
   % of variance explained by common cycle    =  22.8316
   % reduction in cycle MSE due to 2nd series =  20.4265

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
