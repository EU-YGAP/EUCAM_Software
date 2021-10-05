 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:42: 5
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
     # of exog variables:    10
     # of observations:      57
     Endogenous regressors:
       Series # 1  cycle lag 0                                     

 Note: Second equation intercept assigned to cycle.
                         
 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              0.6883       0.1739       3.9574    
  AR2:                             -0.1329       0.1555      -0.8545    
  Trend shocks var:               1.000E-08                     LB
  Slope shocks var:               1.000E-02                     LB
  Cycle shocks var:               1.408E-01                       
  
 Phillips curve *
  Intercept:                       -0.0012       0.0012      -1.0350    
  Exog 2:                           0.6574       0.1001       6.5699    
  Exog 10:                          0.8475       0.0931       9.1066    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0044       0.0027      -1.6377    
  Idiosyncratic var:              6.532E-05                       
  
 -2*log-likelihood:          -298.3385
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0772
    r(2) = -0.0083
    r(3) = -0.1136
    r(4) = -0.0686
   Approximated standard deviation:    0.1325
   Ljung-Box stat. Q(4) =   1.4180   p-value  =   0.8411

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.1131
    r(2) =  0.0048
    r(3) =  0.0574
    r(4) = -0.1155
   Approximated standard deviation            =   0.1325
   Ljung-Box stat. Q(4) =   1.8208   p-value  =   0.7687
    
   R-squared (one-step-ahead predictions)     =   0.5814
   R-squared (fitted values)                  =   0.6116
   % of variance explained by common cycle    =   6.3375
   % reduction in cycle MSE due to 2nd series =  10.4028

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
