"""
Copyright 2019,2020 European Union

Licensed under the EUPL, Version 1.2 or – as soon they will be approved by the European Commission –
subsequent versions of the EUPL (the "Licence");
You may not use this work except in compliance with the Licence.
You may obtain a copy of the Licence at:
http://ec.europa.eu/idabc/eupl

Unless required by applicable law or agreed to in writing, software distributed under the Licence is distributed on
an "AS IS" basis, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the Licence for the specific language governing permissions and limitations under the Licence.

Author: François Blondeau (European Commisssion, Directorate-General for Economic and Financial Affairs)

"""

# This function is the model of equations to solve

def modeltosolve(guesses, params):
    import numpy as np
    ypot, k, iq, y, sr = guesses #unpacking tuple with initial guesses
    totalhs, srkf, dep, klag, iypot, ygap, totalh_mt, alpha = params  # unpacking tuple with parameters
    eq1 = totalhs**alpha * k**(1-alpha) * np.exp(srkf) - ypot #1st equation of the model
    eq2 = iq + (1-dep) * klag - k # 2d equation
    eq3 = iypot / 100 * ypot - iq # 3d equation
    eq4 = ypot * (1 + ygap / 100) - y # 4th equation
    eq5 = np.log( y / (totalh_mt**alpha * k**(1 - alpha))) - sr # 5th and last equation
    return [eq1, eq2, eq3, eq4, eq5]