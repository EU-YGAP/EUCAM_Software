 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  17:46:20
 Input directory:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Output location:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
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
  AR1:                              1.3590       0.1293      10.5116    
  AR2:                             -0.4885       0.1053      -4.6398    
  Trend shocks var:               2.000E-01                     UB
  Slope shocks var:               1.400E-01                     UB
  Cycle shocks var:               1.350E+00                     UB
  
 Phillips curve *
  Intercept:                        0.0001       0.0041       0.0132    
  AR1:                              0.0033       0.1111       0.0299    
  Exog 1:                           0.1222       0.0223       5.4755    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0049       0.0015      -3.1461    
  Beta - lag 1:                     0.0023                      **
  Idiosyncratic var:              4.073E-04                       
  
 -2*log-likelihood:           -45.7545
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0362
    r(2) = -0.1403
    r(3) =  0.0916
    r(4) = -0.0728
   Approximated standard deviation:    0.1291
   Ljung-Box stat. Q(4) =   2.1761   p-value  =   0.7034

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.2588
    r(2) = -0.0601
    r(3) =  0.0508
    r(4) =  0.0995
   Approximated standard deviation            =   0.1291
   Ljung-Box stat. Q(4) =   5.2791   p-value  =   0.2598
    
   R-squared (one-step-ahead predictions)     =   0.3486
   R-squared (fitted values)                  =   0.4702
   % of variance explained by common cycle    =  17.8679
   % reduction in cycle MSE due to 2nd series =  39.0488

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
