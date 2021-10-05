 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:17:20
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
  AR1:                              1.4046       0.1015      13.8425    
  AR2:                             -0.7131       0.1039      -6.8609    
  Trend shocks var:               1.000E-08                     LB
  Slope shocks var:               9.137E-02                       
  Cycle shocks var:               7.216E-01                       
  
 Phillips curve *
  Intercept:                       -0.0054       0.0045      -1.2186    
  AR1:                              0.0000                      LB
  Exog 1:                           0.0490       0.0230       2.1341    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0097       0.0030      -3.2021    
  Beta - lag 1:                     0.0068                      **
  Idiosyncratic var:              4.833E-04                       
  
 -2*log-likelihood:           -48.3251
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0085
    r(2) = -0.3822
    r(3) =  0.0861
    r(4) = -0.0226
   Approximated standard deviation:    0.1826
   Ljung-Box stat. Q(4) =   4.9881   p-value  =   0.2885

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.0666
    r(2) =  0.2099
    r(3) = -0.1554
    r(4) =  0.0095
   Approximated standard deviation            =   0.1826
   Ljung-Box stat. Q(4) =   2.5199   p-value  =   0.6411
    
   R-squared (one-step-ahead predictions)     =   0.2686
   R-squared (fitted values)                  =   0.4165
   % of variance explained by common cycle    =  22.7890
   % reduction in cycle MSE due to 2nd series =  21.0263

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
