 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:15:51
 Input directory:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Output location:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      28
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     0
     # of observations:      28
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              0.8853       0.2607       3.3957    
  AR2:                             -0.6157       0.1619      -3.8038    
  Trend shocks var:               1.500E-01                     UB
  Slope shocks var:               1.250E-01                       
  Cycle shocks var:               2.500E-01                     UB
  
 Phillips curve *
  Intercept:                        0.0023       0.0044       0.5317    
  AR1:                              0.2606       0.1792       1.4543    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0163       0.0073      -2.2325    
  Beta - lag 1:                     0.0099                      **
  Idiosyncratic var:              4.398E-04                       
  
 -2*log-likelihood:           -52.1928
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.1092
    r(2) = -0.1863
    r(3) =  0.0966
    r(4) = -0.1076
   Approximated standard deviation:    0.1890
   Ljung-Box stat. Q(4) =   2.0791   p-value  =   0.7212

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0885
    r(2) = -0.0060
    r(3) = -0.1623
    r(4) = -0.0766
   Approximated standard deviation            =   0.1890
   Ljung-Box stat. Q(4) =   1.3355   p-value  =   0.8553
    
   R-squared (one-step-ahead predictions)     =   0.1924
   R-squared (fitted values)                  =   0.3483
   % of variance explained by common cycle    =  21.1911
   % reduction in cycle MSE due to 2nd series =  14.7544

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
