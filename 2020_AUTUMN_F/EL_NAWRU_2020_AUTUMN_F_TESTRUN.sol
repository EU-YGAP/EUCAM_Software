 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:16:11
 Input directory:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Output location:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
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
     # of exog variables:     2
     # of observations:      60
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.6706       0.0659      25.3468    
  AR2:                             -0.8383       0.0667     -12.5641    
  Trend shocks var:               2.500E-03                     LB
  Slope shocks var:               3.916E-03                       
  Cycle shocks var:               5.805E-01                       
  
 Phillips curve *
  Intercept:                        0.0003       0.0048       0.0679    
  AR1:                              0.1604       0.1303       1.2313    
  Exog 1:                           0.0808       0.0374       2.1604    
  Exog 2:                          -0.0359       0.0387      -0.9272    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0015       0.0033      -0.4422    
  Beta - lag 1:                     0.0012                      **
  Idiosyncratic var:              1.339E-03                       
  
 -2*log-likelihood:           -72.2765
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.1955
    r(2) = -0.1953
    r(3) = -0.1225
    r(4) = -0.2045
   Approximated standard deviation:    0.1291
   Ljung-Box stat. Q(4) =   8.3509   p-value  =   0.0795

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0276
    r(2) = -0.0244
    r(3) = -0.1763
    r(4) = -0.0292
   Approximated standard deviation            =   0.1291
   Ljung-Box stat. Q(4) =   2.1710   p-value  =   0.7043
    
   R-squared (one-step-ahead predictions)     =   0.0940
   R-squared (fitted values)                  =   0.0813
   % of variance explained by common cycle    =   0.4091
   % reduction in cycle MSE due to 2nd series =   0.1699

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
