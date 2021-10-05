 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  18:40: 7
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
  AR1:                              1.2920       0.1197      10.7924    
  AR2:                             -0.5736       0.1030      -5.5706    
  Trend shocks var:               1.000E-02                     UB
  Slope shocks var:               5.000E-02                     LB
  Cycle shocks var:               4.000E-01                     UB
  
 Phillips curve *
  Intercept:                        0.0002       0.0032       0.0511    
  AR1:                              0.2310       0.1247       1.8517    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0079       0.0037      -2.1203    
  Beta - lag 1:                     0.0044                      **
  Idiosyncratic var:              5.521E-04                       
  
 -2*log-likelihood:          -118.8737
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0583
    r(2) = -0.3273
    r(3) =  0.0746
    r(4) =  0.1135
   Approximated standard deviation:    0.1291
   Ljung-Box stat. Q(4) =   8.0465   p-value  =   0.0899

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.0125
    r(2) = -0.0599
    r(3) = -0.1932
    r(4) =  0.1140
   Approximated standard deviation            =   0.1291
   Ljung-Box stat. Q(4) =   3.5390   p-value  =   0.4720
    
   R-squared (one-step-ahead predictions)     =   0.1661
   R-squared (fitted values)                  =   0.1501
   % of variance explained by common cycle    =   9.5082
   % reduction in cycle MSE due to 2nd series =  10.6714

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
