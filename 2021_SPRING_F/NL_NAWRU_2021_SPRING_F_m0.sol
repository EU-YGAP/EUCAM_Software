 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:17:11
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
  AR1:                              1.1318       0.1509       7.5002    
  AR2:                             -0.5145       0.1339      -3.8415    
  Trend shocks var:               1.000E-01                     UB
  Slope shocks var:               5.000E-02                     LB
  Cycle shocks var:               4.308E-01                       
  
 Phillips curve *
  Intercept:                       -0.0021       0.0017      -1.1967    
  Exog 1:                          -0.1961       0.1725      -1.1367    
  Exog 2:                           0.4507       0.1708       2.6384    
  Exog 3:                           0.0938       0.1648       0.5692    
  Exog 4:                          -0.0126       0.0975      -0.1293    
  Exog 10:                          0.5975       0.0997       5.9938    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0036       0.0017      -2.1552    
  Idiosyncratic var:              1.314E-04                       
  
 -2*log-likelihood:          -189.4168
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0850
    r(2) = -0.0763
    r(3) =  0.0780
    r(4) = -0.1177
   Approximated standard deviation:    0.1313
   Ljung-Box stat. Q(4) =   2.0156   p-value  =   0.7329

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.1434
    r(2) =  0.1517
    r(3) =  0.0235
    r(4) = -0.3797
   Approximated standard deviation            =   0.1313
   Ljung-Box stat. Q(4) =  12.0128   p-value  =   0.0173
    
   R-squared (one-step-ahead predictions)     =   0.4708
   R-squared (fitted values)                  =   0.5174
   % of variance explained by common cycle    =  11.6624
   % reduction in cycle MSE due to 2nd series =  16.4067

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
