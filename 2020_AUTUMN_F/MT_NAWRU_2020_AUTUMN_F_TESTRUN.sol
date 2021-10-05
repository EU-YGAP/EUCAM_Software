 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:17: 9
 Input directory:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Output location:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
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
  AR1:                              0.8683       0.2827       3.0719    
  AR2:                             -0.2664       0.2400      -1.1098    
  Trend shocks var:               1.000E-08                     LB
  Slope shocks var:               4.736E-03                       
  Cycle shocks var:               1.206E-01                       
  
 Phillips curve *
  Exog 1:                           0.0334       0.3816       0.0875    
  Exog 2:                           0.4067       0.1178       3.4536    
  Exog 3:                          -0.0223       0.4138      -0.0540    
  Exog 4:                           0.4539       0.1456       3.1168    
  Exog 5:                          -0.0572       0.0279      -2.0479    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0015       0.0086      -0.1735    
  Idiosyncratic var:              3.532E-04                       
  
 -2*log-likelihood:           -89.9326
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0897
    r(2) = -0.1039
    r(3) =  0.0559
    r(4) = -0.1713
   Approximated standard deviation:    0.2000
   Ljung-Box stat. Q(4) =   1.4840   p-value  =   0.8295

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.3124
    r(2) = -0.3766
    r(3) =  0.2358
    r(4) =  0.0557
   Approximated standard deviation            =   0.2000
   Ljung-Box stat. Q(4) =   8.7129   p-value  =   0.0687
    
   R-squared (one-step-ahead predictions)     =   0.4183
   R-squared (fitted values)                  =   0.4178
   % of variance explained by common cycle    =   0.1524
   % reduction in cycle MSE due to 2nd series =   0.2824

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
