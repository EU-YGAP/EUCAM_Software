 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:45:25
 Input directory:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Output location:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      24
   Second equation
     Specification:        ARMAX                                   
     AR order:                0
     MA order:                0
     # of exog variables:     6
     # of observations:      24
     Endogenous regressors:
       Series # 1  cycle lag 0                                     

 Note: Second equation intercept assigned to cycle.
                         
 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                             -0.1846       0.2070      -0.8915    
  AR2:                             -0.3713       0.2843      -1.3060    
  Trend shocks var:               1.000E-02                     UB
  Slope shocks var:               1.000E-02                     **
  Cycle shocks var:               8.000E-02                     UB
  
 Phillips curve *
  Exog 1:                          -0.1718       0.2782      -0.6174    
  Exog 2:                           0.3791       0.1141       3.3230    
  Exog 3:                          -0.3182       0.2780      -1.1447    
  Exog 4:                           0.4228       0.1330       3.1792    
  Exog 5:                           0.0493       0.0265       1.8579    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0105       0.0122      -0.8575    
  Idiosyncratic var:              2.202E-04                       
  
 -2*log-likelihood:           -53.1142
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0400
    r(2) = -0.0098
    r(3) = -0.1455
    r(4) = -0.1702
   Approximated standard deviation:    0.2041
   Ljung-Box stat. Q(4) =   1.4806   p-value  =   0.8301

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.1397
    r(2) = -0.4649
    r(3) =  0.3347
    r(4) = -0.1542
   Approximated standard deviation            =   0.2041
   Ljung-Box stat. Q(4) =  10.7301   p-value  =   0.0298
    
   R-squared (one-step-ahead predictions)     =   0.4475
   R-squared (fitted values)                  =   0.4849
   % of variance explained by common cycle    =   4.5162
   % reduction in cycle MSE due to 2nd series =   2.3678

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
