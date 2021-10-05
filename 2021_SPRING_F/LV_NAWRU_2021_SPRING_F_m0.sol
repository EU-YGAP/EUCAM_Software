 PROGRAM GAP version 5.0 - February 2018

 Date:  1-10-2021  15:17: 3
 Input directory:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Output location:     C:\Users\winuser\Documents\python-projects\ECFIN\GIT-FB-DEV\FB-DEV\dist
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      27
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     2
     # of observations:      27
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              1.0793       0.1130       9.5474    
  AR2:                             -0.6046       0.0953      -6.3455    
  Trend shocks var:               3.000E-01                     UB
  Slope shocks var:               2.000E-02                     UB
  Cycle shocks var:               8.500E-01                     UB
  
 Phillips curve *
  Intercept:                        0.0080       0.0075       1.0700    
  AR1:                              0.3914       0.1387       2.8218    
  Exog 1:                           0.0624       0.0376       1.6593    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0170       0.0040      -4.2826    
  Beta - lag 1:                     0.0100                      **
  Idiosyncratic var:              1.226E-03                       
  
 -2*log-likelihood:            38.4816
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) =  0.0479
    r(2) = -0.1008
    r(3) =  0.0432
    r(4) = -0.0857
   Approximated standard deviation:    0.1925
   Ljung-Box stat. Q(4) =   0.6563   p-value  =   0.9566

  Phillips curve 
   Residuals autocorrelations
    r(1) = -0.1528
    r(2) =  0.0204
    r(3) =  0.0043
    r(4) = -0.3021
   Approximated standard deviation            =   0.1925
   Ljung-Box stat. Q(4) =   3.8239   p-value  =   0.4304
    
   R-squared (one-step-ahead predictions)     =   0.3917
   R-squared (fitted values)                  =   0.6252
   % of variance explained by common cycle    =  28.3180
   % reduction in cycle MSE due to 2nd series =  16.8128

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
