 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:17:36
 Input directory:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Output location:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Model type:          
   Series # 1
     Trend:                Random walk plus drift   
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      26
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     3
     # of observations:      26
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.5535       0.1297      11.9798    
  AR2:                             -0.7730       0.1266      -6.1050    
  Trend shocks var:               3.000E-02                     LB
  Cycle shocks var:               2.714E-01                       
  
 Phillips curve *
  Intercept:                        0.0006       0.0028       0.2216    
  AR1:                              0.0137       0.1068       0.1280    
  Exog 1:                           0.0696       0.0178       3.9049    
  Exog 2:                          -0.4396       0.3174      -1.3850    
  Exog 3:                           0.0712       0.0158       4.5034    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0065       0.0041      -1.5993    
  Beta - lag 1:                     0.0050                      **
  Idiosyncratic var:              1.751E-04                       
  
 -2*log-likelihood:           -99.9819
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0336
    r(2) = -0.2969
    r(3) =  0.0509
    r(4) =  0.2904
   Approximated standard deviation:    0.1961
   Ljung-Box stat. Q(4) =   5.4093   p-value  =   0.2478

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.1440
    r(2) = -0.1148
    r(3) = -0.2658
    r(4) =  0.1417
   Approximated standard deviation            =   0.1961
   Ljung-Box stat. Q(4) =   3.9033   p-value  =   0.4193
    
   R-squared (one-step-ahead predictions)     =   0.7424
   R-squared (fitted values)                  =   0.7300
   % of variance explained by common cycle    =  15.0237
   % reduction in cycle MSE due to 2nd series =   6.0613

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
