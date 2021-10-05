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

def get_nawru_bounds(nml_path):
    import f90nml
    nml    = f90nml.read(nml_path)
    bound = nml['prior']['hyp'][2]
    slope = bound[2:4]
    bound = nml['prior']['hyp'][3]
    trend = bound[2:4]
    bound = nml['prior']['hyp'][4]
    cycle = bound[2:4]
    boundlist = slope + trend + cycle
    return boundlist
