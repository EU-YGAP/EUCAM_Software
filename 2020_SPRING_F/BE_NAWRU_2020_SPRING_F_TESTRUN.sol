 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  17:14:56
 Input directory:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Output location:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      58
   Second equation
     Specification:        ARMAX                                   
     AR order:                0
     MA order:                0
     # of exog variables:     4
     # of observations:      58
     Endogenous regressors:
       Series # 1  cycle lag 0                                     

 Note: Second equation intercept assigned to cycle.
                         
 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.5337       0.0278      55.1482    
  AR2:                             -0.9700                      LB
  Trend shocks var:               4.261E-01                       
  Slope shocks var:               3.500E-02                     LB
  Cycle shocks var:               4.333E-03                       
  
 Phillips curve *
  Intercept:                       -0.0014       0.0022      -0.6231    
  Exog 1:                           0.3176       0.1986       1.5991    
  Exog 2:                           0.3965       0.0785       5.0506    
  Exog 3:                           0.0226       0.1985       0.1137    
  Exog 4:                           0.0000                      LB
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0171       0.0077      -2.2058    
  Idiosyncratic var:              2.677E-04                       
  
 -2*log-likelihood:          -166.0834
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.3041
    r(2) = -0.2416
    r(3) = -0.1385
    r(4) = -0.0117
   Approximated standard deviation:    0.1313
   Ljung-Box stat. Q(4) =  10.1560   p-value  =   0.0379

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0369
    r(2) = -0.0535
    r(3) = -0.2111
    r(4) =  0.0202
   Approximated standard deviation            =   0.1313
   Ljung-Box stat. Q(4) =   3.1071   p-value  =   0.5401
    
   R-squared (one-step-ahead predictions)     =   0.3802
   R-squared (fitted values)                  =   0.4516
   % of variance explained by common cycle    =  16.8764
   % reduction in cycle MSE due to 2nd series =  30.2560

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
