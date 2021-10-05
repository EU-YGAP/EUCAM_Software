 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:17: 6
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
     # of exog variables:     2
     # of observations:      27
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.0269       0.0943      10.8906    
  AR2:                             -0.5537       0.0849      -6.5190    
  Trend shocks var:               5.000E-02                     UB
  Slope shocks var:               2.000E-02                     UB
  Cycle shocks var:               8.500E-01                     UB
  
 Phillips curve *
  Intercept:                        0.0079       0.0076       1.0404    
  AR1:                              0.3969       0.1413       2.8089    
  Exog 1:                           0.0582       0.0381       1.5299    
  Exog 2:                          -0.0284       0.0385      -0.7374    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0144       0.0036      -3.9745    
  Beta - lag 1:                     0.0078                      **
  Idiosyncratic var:              1.287E-03                       
  
 -2*log-likelihood:            51.7812
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0415
    r(2) = -0.0482
    r(3) =  0.0610
    r(4) = -0.1269
   Approximated standard deviation:    0.1925
   Ljung-Box stat. Q(4) =   0.7483   p-value  =   0.9452

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.1475
    r(2) =  0.0213
    r(3) = -0.0102
    r(4) = -0.3193
   Approximated standard deviation            =   0.1925
   Ljung-Box stat. Q(4) =   4.1429   p-value  =   0.3870
    
   R-squared (one-step-ahead predictions)     =   0.3914
   R-squared (fitted values)                  =   0.5646
   % of variance explained by common cycle    =  20.0460
   % reduction in cycle MSE due to 2nd series =  12.3120

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
