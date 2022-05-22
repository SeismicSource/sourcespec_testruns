@ECHO OFF
REM Test run of source_spec on data from Integrated Plate Boundary Observatory
REM Chile (IPOC)
python ../check_version.py
if %ERRORLEVEL% NEQ 0 exit
source_spec -t data/324_0051-PB05-03077_tr14
