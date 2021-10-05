 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  17:17:10
 Input directory:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Output location:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      22
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     2
     # of observations:      22
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              0.9263       0.5484       1.6890    
  AR2:                             -0.3325       0.4030      -0.8249    
  Trend shocks var:               3.000E-02                     UB
  Slope shocks var:               6.000E-01                     UB
  Cycle shocks var:               6.000E-01                     UB
  
 Phillips curve *
  Intercept:                        0.0198       0.0088       2.2414    
  AR1:                              0.2717       0.1986       1.3679    
  Exog 1:                           0.0500       0.0343       1.4561    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0083       0.0113      -0.7367    
  Beta - lag 1:                     0.0027                      **
  Idiosyncratic var:              9.370E-04                       
  
 -2*log-likelihood:            -6.5381
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0255
    r(2) =  0.0578
    r(3) = -0.0050
    r(4) =  0.0196
   Approximated standard deviation:    0.2132
   Ljung-Box stat. Q(4) =   0.1080   p-value  =   0.9986

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.1130
    r(2) = -0.3104
    r(3) = -0.1194
    r(4) =  0.2138
   Approximated standard deviation            =   0.2132
   Ljung-Box stat. Q(4) =   4.6023   p-value  =   0.3306
    
   R-squared (one-step-ahead predictions)     =   0.4197
   R-squared (fitted values)                  =   0.1705
   % of variance explained by common cycle    =   7.5479
   % reduction in cycle MSE due to 2nd series =   8.7433

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
