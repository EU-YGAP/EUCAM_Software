 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  18:49:50
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
  AR1:                              1.2689       0.1178      10.7694    
  AR2:                             -0.6599       0.1136      -5.8080    
  Trend shocks var:               2.000E-03                     LB
  Slope shocks var:               2.000E-02                     UB
  Cycle shocks var:               4.422E-01                       
  
 Phillips curve *
  Intercept:                        0.0006       0.0039       0.1605    
  AR1:                              0.9700                      **
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0121       0.0042      -2.9001    
  Beta - lag 1:                     0.0040                      **
  Idiosyncratic var:              7.000E-04                     UB
  
 -2*log-likelihood:           -49.9557
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.1227
    r(2) =  0.0177
    r(3) =  0.0707
    r(4) =  0.0443
   Approximated standard deviation:    0.1291
   Ljung-Box stat. Q(4) =   1.3821   p-value  =   0.8473

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.4009
    r(2) = -0.1618
    r(3) =  0.0861
    r(4) = -0.0885
   Approximated standard deviation            =   0.1291
   Ljung-Box stat. Q(4) =  12.8178   p-value  =   0.0122
    
   R-squared (one-step-ahead predictions)     =   0.0000
   R-squared (fitted values)                  =  -0.1262
   % of variance explained by common cycle    =  22.5239
   % reduction in cycle MSE due to 2nd series =  20.9917

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
