 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:16:26
 Input directory:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Output location:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
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
  AR1:                              1.1694       0.1561       7.4917    
  AR2:                             -0.3560       0.1406      -2.5313    
  Trend shocks var:               1.000E-02                     LB
  Slope shocks var:               5.000E-03                     LB
  Cycle shocks var:               2.500E-01                     UB
  
 Phillips curve *
  Intercept:                       -0.0007       0.0012      -0.5526    
  AR1:                              0.1230       0.0739       1.6631    
  Exog 1:                          -0.5578       0.1572      -3.5491    
  Exog 2:                           0.0428       0.0091       4.6882    
  Exog 3:                           0.0594       0.0093       6.3553    
  Exog 4:                           0.7404       0.5146       1.4387    
  Exog 5:                           0.0340       0.0093       3.6368    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0009       0.0023      -0.3905    
  Beta - lag 1:                     0.0003                      **
  Idiosyncratic var:              7.464E-05                       
  
 -2*log-likelihood:          -250.0204
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0007
    r(2) = -0.1727
    r(3) =  0.0265
    r(4) = -0.0855
   Approximated standard deviation:    0.1374
   Ljung-Box stat. Q(4) =   2.1050   p-value  =   0.7165

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.2033
    r(2) =  0.0966
    r(3) =  0.2797
    r(4) =  0.1041
   Approximated standard deviation            =   0.1374
   Ljung-Box stat. Q(4) =   8.0560   p-value  =   0.0895
    
   R-squared (one-step-ahead predictions)     =   0.7175
   R-squared (fitted values)                  =   0.7065
   % of variance explained by common cycle    =   0.7757
   % reduction in cycle MSE due to 2nd series =   1.8754

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
