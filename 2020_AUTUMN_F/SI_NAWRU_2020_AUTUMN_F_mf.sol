 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  18:43:42
 Input directory:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Output location:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Model type:          
   Series # 1
     Trend:                Random walk plus drift   
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      26
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     3
     # of observations:      26
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.5507       0.1368      11.3394    
  AR2:                             -0.7553       0.1358      -5.5606    
  Trend shocks var:               3.000E-02                     LB
  Cycle shocks var:               2.908E-01                       
  
 Phillips curve *
  Intercept:                        0.0007       0.0029       0.2476    
  AR1:                              0.0000                      LB
  Exog 1:                           0.0692       0.0180       3.8477    
  Exog 2:                          -0.4227       0.3167      -1.3349    
  Exog 3:                           0.0719       0.0158       4.5478    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0057       0.0041      -1.3950    
  Beta - lag 1:                     0.0042                      **
  Idiosyncratic var:              1.896E-04                       
  
 -2*log-likelihood:           -96.7886
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0453
    r(2) = -0.2917
    r(3) =  0.0500
    r(4) =  0.2835
   Approximated standard deviation:    0.1961
   Ljung-Box stat. Q(4) =   5.2153   p-value  =   0.2659

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.1586
    r(2) = -0.1676
    r(3) = -0.2149
    r(4) =  0.1282
   Approximated standard deviation            =   0.1961
   Ljung-Box stat. Q(4) =   3.5904   p-value  =   0.4643
    
   R-squared (one-step-ahead predictions)     =   0.7242
   R-squared (fitted values)                  =   0.7104
   % of variance explained by common cycle    =  11.0476
   % reduction in cycle MSE due to 2nd series =   5.7262

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
