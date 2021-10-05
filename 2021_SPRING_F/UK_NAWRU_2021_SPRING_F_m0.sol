 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:17:42
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
     # of exog variables:     0
     # of observations:      60
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.3341       0.1158      11.5189    
  AR2:                             -0.6685       0.1059      -6.3125    
  Trend shocks var:               2.000E-03                     LB
  Slope shocks var:               2.000E-02                     UB
  Cycle shocks var:               3.653E-01                       
  
 Phillips curve *
  Intercept:                       -0.0004       0.0038      -0.0943    
  AR1:                              0.9700                      **
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0107       0.0043      -2.4672    
  Beta - lag 1:                     0.0036                      **
  Idiosyncratic var:              7.000E-04                     UB
  
 -2*log-likelihood:           -48.7155
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.1085
    r(2) =  0.0127
    r(3) =  0.0284
    r(4) =  0.0725
   Approximated standard deviation:    0.1291
   Ljung-Box stat. Q(4) =   1.1189   p-value  =   0.8913

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.3697
    r(2) = -0.1770
    r(3) =  0.0713
    r(4) = -0.0824
   Approximated standard deviation            =   0.1291
   Ljung-Box stat. Q(4) =  11.4105   p-value  =   0.0223
    
   R-squared (one-step-ahead predictions)     =   0.0000
   R-squared (fitted values)                  =  -0.0934
   % of variance explained by common cycle    =  20.2171
   % reduction in cycle MSE due to 2nd series =  18.1682

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
