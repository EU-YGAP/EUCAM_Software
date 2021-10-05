 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:16:45
 Input directory:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Output location:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
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
     # of exog variables:     0
     # of observations:      58
     Endogenous regressors:
       Series # 1  cycle lag 0-2                                   

 Note: Second equation intercept assigned to cycle.
                         
 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.4810       0.1320      11.2222    
  AR2:                             -0.6042       0.1229      -4.9175    
  Trend shocks var:               1.000E-01                     UB
  Slope shocks var:               6.000E-03                     LB
  Cycle shocks var:               1.750E-01                     UB
  
 Phillips curve *
  Intercept:                       -0.0011       0.0031      -0.3553    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0288       0.0085      -3.3859    
  Beta - lag 1:                     0.0478       0.0148       3.2297    
  Beta - lag 2:                    -0.0217       0.0087      -2.5027    
  Idiosyncratic var:              4.457E-04                       
  
 -2*log-likelihood:          -156.4225
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0332
    r(2) = -0.1588
    r(3) = -0.0490
    r(4) =  0.1600
   Approximated standard deviation:    0.1313
   Ljung-Box stat. Q(4) =   3.3289   p-value  =   0.5044

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0087
    r(2) = -0.1655
    r(3) =  0.1146
    r(4) =  0.0820
   Approximated standard deviation            =   0.1313
   Ljung-Box stat. Q(4) =   2.9708   p-value  =   0.5627
    
   R-squared (one-step-ahead predictions)     =   0.0126
   R-squared (fitted values)                  =   0.3659
   % of variance explained by common cycle    =  25.5327
   % reduction in cycle MSE due to 2nd series =  13.0791

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
