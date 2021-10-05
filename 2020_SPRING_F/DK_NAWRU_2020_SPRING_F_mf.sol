 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:42:25
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
  AR1:                              1.0523       0.1182       8.9025    
  AR2:                             -0.2968       0.1062      -2.7961    
  Trend shocks var:               2.500E-02                     UB
  Slope shocks var:               7.000E-03                     LB
  Cycle shocks var:               4.500E-01                     UB
  
 Phillips curve *
  Intercept:                        0.0013       0.0031       0.4208    
  AR1:                              0.0519       0.1360       0.3820    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0059       0.0025      -2.3897    
  Beta - lag 1:                     0.0017                      **
  Idiosyncratic var:              4.009E-04                       
  
 -2*log-likelihood:          -118.7172
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0150
    r(2) = -0.1137
    r(3) =  0.0340
    r(4) = -0.0948
   Approximated standard deviation:    0.1302
   Ljung-Box stat. Q(4) =   1.4465   p-value  =   0.8361

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.0123
    r(2) = -0.0670
    r(3) = -0.0634
    r(4) =  0.0826
   Approximated standard deviation            =   0.1302
   Ljung-Box stat. Q(4) =   0.9975   p-value  =   0.9102
    
   R-squared (one-step-ahead predictions)     =   0.1112
   R-squared (fitted values)                  =   0.1432
   % of variance explained by common cycle    =   7.5123
   % reduction in cycle MSE due to 2nd series =  15.5154

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
