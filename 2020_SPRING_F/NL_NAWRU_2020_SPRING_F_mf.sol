 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:43:41
 Input directory:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Output location:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      57
   Second equation
     Specification:        ARMAX                                   
     AR order:                0
     MA order:                0
     # of exog variables:    10
     # of observations:      57
     Endogenous regressors:
       Series # 1  cycle lag 0                                     

 Note: Second equation intercept assigned to cycle.
                         
 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.0158       0.1578       6.4369    
  AR2:                             -0.4361       0.1413      -3.0852    
  Trend shocks var:               1.000E-01                     UB
  Slope shocks var:               5.000E-02                     LB
  Cycle shocks var:               5.408E-01                       
  
 Phillips curve *
  Intercept:                       -0.0021       0.0018      -1.1289    
  Exog 1:                          -0.2374       0.1706      -1.3914    
  Exog 2:                           0.5745       0.1557       3.6904    
  Exog 3:                           0.0074       0.1630       0.0454    
  Exog 4:                           0.0135       0.1090       0.1239    
  Exog 10:                          0.5822       0.1024       5.6846    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0041       0.0017      -2.4903    
  Idiosyncratic var:              1.332E-04                       
  
 -2*log-likelihood:          -175.2545
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.1006
    r(2) = -0.0513
    r(3) =  0.0557
    r(4) = -0.1178
   Approximated standard deviation:    0.1325
   Ljung-Box stat. Q(4) =   1.7832   p-value  =   0.7755

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.1780
    r(2) =  0.1219
    r(3) =  0.0220
    r(4) = -0.3858
   Approximated standard deviation            =   0.1325
   Ljung-Box stat. Q(4) =  12.2842   p-value  =   0.0154
    
   R-squared (one-step-ahead predictions)     =   0.3997
   R-squared (fitted values)                  =   0.4788
   % of variance explained by common cycle    =  14.5511
   % reduction in cycle MSE due to 2nd series =  20.0816

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
