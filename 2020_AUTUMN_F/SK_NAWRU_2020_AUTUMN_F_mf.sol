 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  18:46:26
 Input directory:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Output location:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
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
  AR1:                              1.2922       0.1436       8.9959    
  AR2:                             -0.6002       0.1231      -4.8768    
  Trend shocks var:               1.500E-01                     UB
  Slope shocks var:               4.000E-02                     LB
  Cycle shocks var:               1.000E+00                     UB
  
 Phillips curve *
  Intercept:                       -0.0023       0.0044      -0.5099    
  AR1:                              0.3079       0.1506       2.0451    
  Exog 1:                          -1.5974       0.3606      -4.4295    
  Exog 2:                           0.0306       0.0222       1.3740    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0070       0.0028      -2.4976    
  Beta - lag 1:                     0.0041                      **
  Idiosyncratic var:              3.975E-04                       
  
 -2*log-likelihood:           -34.4393
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.1101
    r(2) = -0.2743
    r(3) = -0.0003
    r(4) = -0.0785
   Approximated standard deviation:    0.1925
   Ljung-Box stat. Q(4) =   2.7468   p-value  =   0.6011

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0598
    r(2) = -0.0464
    r(3) = -0.0131
    r(4) = -0.0852
   Approximated standard deviation            =   0.1925
   Ljung-Box stat. Q(4) =   0.4282   p-value  =   0.9801
    
   R-squared (one-step-ahead predictions)     =   0.4368
   R-squared (fitted values)                  =   0.5082
   % of variance explained by common cycle    =  23.1153
   % reduction in cycle MSE due to 2nd series =  20.3750

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
