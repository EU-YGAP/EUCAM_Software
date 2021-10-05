 PROGRAM GAP version 5.0 - February 2018

 Date: 17- 3-2021  12:53:41
 Input directory:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV
 Output location:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV
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
     # of exog variables:    10
     # of observations:      58
     Endogenous regressors:
       Series # 1  cycle lag 0                                     

 Note: Second equation intercept assigned to cycle.
                         
 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              0.7918       0.1683       4.7039    
  AR2:                             -0.2124       0.1434      -1.4805    
  Trend shocks var:               1.000E-08                     LB
  Slope shocks var:               1.000E-02                     LB
  Cycle shocks var:               1.192E-01                       
  
 Phillips curve *
  Intercept:                       -0.0011       0.0011      -0.9724    
  Exog 2:                           0.6119       0.1002       6.1095    
  Exog 10:                          0.8128       0.0898       9.0465    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0040       0.0027      -1.4682    
  Idiosyncratic var:              6.345E-05                       
  
 -2*log-likelihood:          -314.8976
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0910
    r(2) = -0.0060
    r(3) = -0.1069
    r(4) = -0.0843
   Approximated standard deviation:    0.1313
   Ljung-Box stat. Q(4) =   1.6349   p-value  =   0.8025

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0830
    r(2) =  0.0031
    r(3) =  0.0600
    r(4) = -0.1333
   Approximated standard deviation            =   0.1313
   Ljung-Box stat. Q(4) =   1.7936   p-value  =   0.7737
    
   R-squared (one-step-ahead predictions)     =   0.6000
   R-squared (fitted values)                  =   0.6208
   % of variance explained by common cycle    =   5.0839
   % reduction in cycle MSE due to 2nd series =   8.4999

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
