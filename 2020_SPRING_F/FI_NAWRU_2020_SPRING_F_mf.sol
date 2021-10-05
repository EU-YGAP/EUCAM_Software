 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:43:58
 Input directory:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Output location:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      59
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     0
     # of observations:      59
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.4684       0.0924      15.8998    
  AR2:                             -0.6962       0.0759      -9.1735    
  Trend shocks var:               2.972E-01                       
  Slope shocks var:               2.864E-03                       
  Cycle shocks var:               4.000E-01                     UB
  
 Phillips curve *
  Intercept:                       -0.0007       0.0033      -0.1967    
  AR1:                              0.1939       0.1212       1.5998    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0109       0.0031      -3.5224    
  Beta - lag 1:                     0.0075                      **
  Idiosyncratic var:              5.305E-04                       
  
 -2*log-likelihood:           -92.0758
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.2752
    r(2) = -0.2174
    r(3) = -0.2356
    r(4) = -0.0329
   Approximated standard deviation:    0.1302
   Ljung-Box stat. Q(4) =  10.9626   p-value  =   0.0270

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.0480
    r(2) = -0.3149
    r(3) = -0.0934
    r(4) =  0.1993
   Approximated standard deviation            =   0.1302
   Ljung-Box stat. Q(4) =   9.5626   p-value  =   0.0485
    
   R-squared (one-step-ahead predictions)     =   0.2326
   R-squared (fitted values)                  =   0.3090
   % of variance explained by common cycle    =  20.1101
   % reduction in cycle MSE due to 2nd series =  17.4073

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
