 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:42:10
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
  AR1:                              1.0688       0.1652       6.4717    
  AR2:                             -0.5118       0.1259      -4.0668    
  Trend shocks var:               1.000E-02                     LB
  Slope shocks var:               4.300E-02                     UB
  Cycle shocks var:               2.939E-01                       
  
 Phillips curve *
  Intercept:                       -0.0016       0.0027      -0.5878    
  Exog 1:                           0.2613       0.1989       1.3139    
  Exog 2:                           0.3429       0.0863       3.9723    
  Exog 3:                           0.0071       0.1988       0.0359    
  Exog 4:                           0.0000                      LB
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0097       0.0039      -2.4978    
  Idiosyncratic var:              2.581E-04                       
  
 -2*log-likelihood:          -168.8270
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.1346
    r(2) = -0.0676
    r(3) =  0.1119
    r(4) = -0.0807
   Approximated standard deviation:    0.1325
   Ljung-Box stat. Q(4) =   2.4772   p-value  =   0.6487

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.0396
    r(2) =  0.0079
    r(3) = -0.2723
    r(4) = -0.1048
   Approximated standard deviation            =   0.1325
   Ljung-Box stat. Q(4) =   5.4116   p-value  =   0.2476
    
   R-squared (one-step-ahead predictions)     =   0.2868
   R-squared (fitted values)                  =   0.4125
   % of variance explained by common cycle    =  22.5052
   % reduction in cycle MSE due to 2nd series =  27.9709

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
