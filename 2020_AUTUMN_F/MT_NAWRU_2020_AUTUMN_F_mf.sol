 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  18:24: 8
 Input directory:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Output location:     C:\Users\blondfs\Python\EUCAM\GIT-FB-DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      25
   Second equation
     Specification:        ARMAX                                   
     AR order:                0
     MA order:                0
     # of exog variables:     6
     # of observations:      25
     Endogenous regressors:
       Series # 1  cycle lag 0                                     

 Note: Second equation intercept assigned to cycle.
                         
 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              0.7883       0.2836       2.7798    
  AR2:                             -0.2160       0.2424      -0.8909    
  Trend shocks var:               1.000E-08                     LB
  Slope shocks var:               3.472E-03                       
  Cycle shocks var:               1.935E-01                       
  
 Phillips curve *
  Exog 1:                           0.0794       0.3921       0.2024    
  Exog 2:                           0.4202       0.1370       3.0669    
  Exog 3:                          -0.0995       0.4096      -0.2430    
  Exog 4:                           0.4703       0.1508       3.1185    
  Exog 5:                          -0.0492       0.0228      -2.1538    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0021       0.0071      -0.2914    
  Idiosyncratic var:              3.652E-04                       
  
 -2*log-likelihood:           -79.1961
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.1009
    r(2) = -0.0682
    r(3) = -0.0290
    r(4) = -0.1538
   Approximated standard deviation:    0.2000
   Ljung-Box stat. Q(4) =   1.1337   p-value  =   0.8889

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.3269
    r(2) = -0.3960
    r(3) =  0.2788
    r(4) =  0.0640
   Approximated standard deviation            =   0.2000
   Ljung-Box stat. Q(4) =  10.1235   p-value  =   0.0384
    
   R-squared (one-step-ahead predictions)     =   0.3931
   R-squared (fitted values)                  =   0.3946
   % of variance explained by common cycle    =   0.4089
   % reduction in cycle MSE due to 2nd series =   0.7582

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
