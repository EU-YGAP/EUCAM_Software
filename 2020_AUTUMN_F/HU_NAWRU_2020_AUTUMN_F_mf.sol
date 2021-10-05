 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  18: 3: 1
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
     # of exog variables:     1
     # of observations:      27
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.4478       0.1655       8.7459    
  AR2:                             -0.6400       0.1428      -4.4835    
  Trend shocks var:               1.000E-02                     UB
  Slope shocks var:               9.000E-02                     UB
  Cycle shocks var:               2.800E-01                     UB
  
 Phillips curve *
  Intercept:                       -0.0024       0.0038      -0.6376    
  AR1:                              0.0502       0.1431       0.3508    
  Exog 1:                           0.0789       0.0160       4.9186    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0127       0.0037      -3.4116    
  Beta - lag 1:                     0.0080                      **
  Idiosyncratic var:              1.825E-04                       
  
 -2*log-likelihood:           -76.0201
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.2718
    r(2) = -0.1097
    r(3) =  0.1218
    r(4) = -0.1510
   Approximated standard deviation:    0.1925
   Ljung-Box stat. Q(4) =   3.6195   p-value  =   0.4599

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.0458
    r(2) =  0.0007
    r(3) =  0.0233
    r(4) = -0.0578
   Approximated standard deviation            =   0.1925
   Ljung-Box stat. Q(4) =   0.1947   p-value  =   0.9956
    
   R-squared (one-step-ahead predictions)     =   0.4287
   R-squared (fitted values)                  =   0.6335
   % of variance explained by common cycle    =  36.4951
   % reduction in cycle MSE due to 2nd series =  50.2623

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
