Powershell.exe -executionpolicy Bypass -File run.ps1

call miniconda\Scripts\activate.bat notebook

jupyter nbextension enable --py --sys-prefix widgetsnbextension
jupyter notebook