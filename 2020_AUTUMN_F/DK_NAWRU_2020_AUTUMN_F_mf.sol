 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  17:33:46
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
     # of exog variables:     0
     # of observations:      60
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.1034       0.1147       9.6240    
  AR2:                             -0.3316       0.1025      -3.2360    
  Trend shocks var:               2.500E-02                     UB
  Slope shocks var:               7.000E-03                     LB
  Cycle shocks var:               4.500E-01                     UB
  
 Phillips curve *
  Intercept:                        0.0009       0.0029       0.3202    
  AR1:                              0.0961       0.1301       0.7385    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0058       0.0023      -2.5552    
  Beta - lag 1:                     0.0019                      **
  Idiosyncratic var:              3.611E-04                       
  
 -2*log-likelihood:          -128.8429
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0097
    r(2) = -0.1212
    r(3) =  0.0110
    r(4) = -0.0655
   Approximated standard deviation:    0.1291
   Ljung-Box stat. Q(4) =   1.2026   p-value  =   0.8777

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.0137
    r(2) = -0.0849
    r(3) = -0.0802
    r(4) =  0.0950
   Approximated standard deviation            =   0.1291
   Ljung-Box stat. Q(4) =   1.4931   p-value  =   0.8279
    
   R-squared (one-step-ahead predictions)     =   0.1262
   R-squared (fitted values)                  =   0.1732
   % of variance explained by common cycle    =   8.8971
   % reduction in cycle MSE due to 2nd series =  17.4570

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
