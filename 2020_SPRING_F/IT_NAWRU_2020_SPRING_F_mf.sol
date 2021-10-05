 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:43:19
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
     # of exog variables:     0
     # of observations:      57
     Endogenous regressors:
       Series # 1  cycle lag 0-2                                   

 Note: Second equation intercept assigned to cycle.
                         
 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.3769       0.1529       9.0052    
  AR2:                             -0.5118       0.1375      -3.7233    
  Trend shocks var:               1.000E-01                     UB
  Slope shocks var:               6.000E-03                     LB
  Cycle shocks var:               1.750E-01                     UB
  
 Phillips curve *
  Intercept:                       -0.0014       0.0031      -0.4645    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0245       0.0078      -3.1444    
  Beta - lag 1:                     0.0395       0.0131       3.0184    
  Beta - lag 2:                    -0.0171       0.0080      -2.1455    
  Idiosyncratic var:              4.760E-04                       
  
 -2*log-likelihood:          -134.6645
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0894
    r(2) = -0.0878
    r(3) = -0.0163
    r(4) =  0.1528
   Approximated standard deviation:    0.1325
   Ljung-Box stat. Q(4) =   2.3711   p-value  =   0.6679

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0001
    r(2) = -0.1900
    r(3) =  0.1215
    r(4) =  0.0861
   Approximated standard deviation            =   0.1325
   Ljung-Box stat. Q(4) =   3.5967   p-value  =   0.4633
    
   R-squared (one-step-ahead predictions)     =   0.0175
   R-squared (fitted values)                  =   0.3033
   % of variance explained by common cycle    =  19.2965
   % reduction in cycle MSE due to 2nd series =   7.6150

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
