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

# The next function implements a mechanical closure.
# Meaning that after n years the gap should be zero

def closure(series, clos_nb_y, changey):
    for i in range (1, clos_nb_y + 1):
        series[changey+i] = (clos_nb_y - i) / clos_nb_y * series[changey]
    series.loc[changey + clos_nb_y + 1:] = 0.

    return series
