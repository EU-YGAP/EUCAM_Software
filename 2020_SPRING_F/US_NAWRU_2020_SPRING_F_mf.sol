 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:45:54
 Input directory:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Output location:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      57
   Second equation
     Specification:        ARMAX                                   
     AR order:                0
     MA order:                0
     # of exog variables:     4
     # of observations:      57
     Endogenous regressors:
       Series # 1  cycle lag 0                                     

 Note: Second equation intercept assigned to cycle.
                         
 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              0.8492       0.0904       9.3952    
  AR2:                             -0.3259       0.0957      -3.4046    
  Trend shocks var:               1.000E-04                     UB
  Slope shocks var:               2.000E-03                     UB
  Cycle shocks var:               5.150E-01                     UB
  
 Phillips curve *
  Intercept:                       -0.0009       0.0016      -0.5842    
  Exog 1:                           0.3673       0.2418       1.5189    
  Exog 2:                           0.3854       0.1128       3.4180    
  Exog 3:                           0.4450       0.2402       1.8526    
  Exog 4:                           0.0920       0.1134       0.8115    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0029       0.0010      -2.8069    
  Idiosyncratic var:              1.170E-04                       
  
 -2*log-likelihood:          -133.9486
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0064
    r(2) =  0.0132
    r(3) = -0.0019
    r(4) = -0.0491
   Approximated standard deviation:    0.1325
   Ljung-Box stat. Q(4) =   0.1611   p-value  =   0.9969

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.1390
    r(2) = -0.0764
    r(3) =  0.0122
    r(4) =  0.0501
   Approximated standard deviation            =   0.1325
   Ljung-Box stat. Q(4) =   1.6865   p-value  =   0.7932
    
   R-squared (one-step-ahead predictions)     =   0.1003
   R-squared (fitted values)                  =   0.2445
   % of variance explained by common cycle    =   6.5808
   % reduction in cycle MSE due to 2nd series =  10.1845

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
