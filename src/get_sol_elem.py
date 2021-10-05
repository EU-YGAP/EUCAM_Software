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

def get_sol_elem(path_to_file, search_string, selection):
    from src import searchline
    file_is_ok = True
    try:
        solfile = open(path_to_file, 'r')
    except:
        file_is_ok = False
    solcontent = ['']
    if file_is_ok:
        solcontent = solfile.readlines()
        solfile.close()
    startline = 1
    elemline = solcontent[searchline.searchline(solcontent, startline, search_string)]
    elemlist = elemline.split(" ")
    floatlist = []
    selectlist = []

    for elem in elemlist:
        try:
            floatlist.append(float(elem))
        except:
            pass

    for id in selection:
        try:
            selectlist.append(floatlist[id])
        except:
            selectlist.append(0)

    return selectlist
