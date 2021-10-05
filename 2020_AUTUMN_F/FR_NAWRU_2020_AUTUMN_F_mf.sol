 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  17:57:11
 Input directory:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Output location:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      53
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     6
     # of observations:      53
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.0208       0.1730       5.9016    
  AR2:                             -0.3813       0.1367      -2.7889    
  Trend shocks var:               2.500E-02                     UB
  Slope shocks var:               1.000E-02                     UB
  Cycle shocks var:               2.500E-01                     UB
  
 Phillips curve *
  Intercept:                       -0.0006       0.0023      -0.2789    
  AR1:                              0.0000                      LB
  Exog 1:                          -0.6116       0.2378      -2.5722    
  Exog 2:                           0.0483       0.0141       3.4277    
  Exog 3:                           0.0592       0.0142       4.1581    
  Exog 4:                           0.9572       0.7835       1.2217    
  Exog 5:                           0.1176       0.0147       7.9793    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0113       0.0039      -2.8987    
  Beta - lag 1:                     0.0043                      **
  Idiosyncratic var:              1.579E-04                       
  
 -2*log-likelihood:          -190.8557
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0554
    r(2) = -0.1149
    r(3) =  0.0101
    r(4) = -0.0975
   Approximated standard deviation:    0.1374
   Ljung-Box stat. Q(4) =   1.4469   p-value  =   0.8360

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.2558
    r(2) =  0.1138
    r(3) =  0.1462
    r(4) =  0.0376
   Approximated standard deviation            =   0.1374
   Ljung-Box stat. Q(4) =   5.7384   p-value  =   0.2196
    
   R-squared (one-step-ahead predictions)     =   0.7008
   R-squared (fitted values)                  =   0.7869
   % of variance explained by common cycle    =  23.2395
   % reduction in cycle MSE due to 2nd series =  31.2860

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
