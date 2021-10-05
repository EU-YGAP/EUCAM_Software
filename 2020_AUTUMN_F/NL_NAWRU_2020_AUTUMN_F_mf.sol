 PROGRAM GAP version 5.0 - February 2018

 Date: 16- 3-2021  18:27:48
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
  AR1:                              1.1155       0.1452       7.6842    
  AR2:                             -0.5293       0.1330      -3.9799    
  Trend shocks var:               1.000E-01                     UB
  Slope shocks var:               5.000E-02                     LB
  Cycle shocks var:               4.761E-01                       
  
 Phillips curve *
  Intercept:                       -0.0021       0.0017      -1.1972    
  Exog 1:                          -0.2165       0.1695      -1.2770    
  Exog 2:                           0.5540       0.1571       3.5260    
  Exog 3:                           0.0306       0.1617       0.1892    
  Exog 4:                           0.0193       0.0962       0.2007    
  Exog 10:                          0.5808       0.1011       5.7461    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0037       0.0016      -2.3401    
  Idiosyncratic var:              1.309E-04                       
  
 -2*log-likelihood:          -185.0763
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0954
    r(2) = -0.0853
    r(3) =  0.0657
    r(4) = -0.1097
   Approximated standard deviation:    0.1313
   Ljung-Box stat. Q(4) =   1.9920   p-value  =   0.7372

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.1581
    r(2) =  0.1254
    r(3) =  0.0180
    r(4) = -0.3825
   Approximated standard deviation            =   0.1313
   Ljung-Box stat. Q(4) =  11.9493   p-value  =   0.0177
    
   R-squared (one-step-ahead predictions)     =   0.4147
   R-squared (fitted values)                  =   0.4724
   % of variance explained by common cycle    =  13.0742
   % reduction in cycle MSE due to 2nd series =  17.2940

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
