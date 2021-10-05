 PROGRAM GAP version 5.0 - February 2018

 Date:  9-11-2020  10:44:30
 Input directory:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Output location:     C:\ProgramData\python\EUCAM\0. LAST VERSION DEV
 Model type:          
   Series # 1
     Trend:                2nd order random walk    
     Cycle AR order:          2
     # of exog to trend:      0
     # of exog to cycle:      0
     # of observations:      28
   Second equation
     Specification:        ARMAX with forward looking restriction  
     AR order:                1
     MA order:                0
     # of exog variables:     0
     # of observations:      28
     Endogenous regressors:
       Series # 1  cycle lag 0-1                                   

 Likelihood maximised by sequential quadratic programming method.          
 Standard errors computed using information matrix.      

 MAXIMUM LIKELIHOOD ESTIMATES 

                                Coefficient       S.E.     t-stat
 Series # 1
  AR1:                              0.6931       0.1689       4.1028    
  AR2:                             -0.4196       0.1307      -3.2092    
  Trend shocks var:               1.500E-01                     UB
  Slope shocks var:               3.000E-01                     UB
  Cycle shocks var:               1.100E+00                     UB
  
 Phillips curve *
  Intercept:                        0.0065       0.0065       1.0042    
  AR1:                              0.4839       0.1639       2.9523    
  Endogeneous regressors from series 1
  Beta - lag 0:                    -0.0097       0.0034      -2.8694    
  Beta - lag 1:                     0.0039                      **
  Idiosyncratic var:              8.380E-04                       
  
 -2*log-likelihood:            31.1354
 DIAGNOSTICS

  Equation # 1
   Residuals autocorrelations
    r(1) = -0.0015
    r(2) = -0.0801
    r(3) = -0.0971
    r(4) = -0.0927
   Approximated standard deviation:    0.1890
   Ljung-Box stat. Q(4) =   0.7780   p-value  =   0.9414

  Phillips curve 
   Residuals autocorrelations
    r(1) =  0.0173
    r(2) = -0.1746
    r(3) = -0.2705
    r(4) =  0.0050
   Approximated standard deviation            =   0.1890
   Ljung-Box stat. Q(4) =   3.4525   p-value  =   0.4851
    
   R-squared (one-step-ahead predictions)     =   0.3432
   R-squared (fitted values)                  =   0.3753
   % of variance explained by common cycle    =  13.7393
   % reduction in cycle MSE due to 2nd series =  11.3755

 NOTES: LB: Lower bound reached
        UB: Upper bound reached
        **: Fixed parameter
        NI: Non-identified parameter
        * : Phillips curve exogenous regressors centered at zero
