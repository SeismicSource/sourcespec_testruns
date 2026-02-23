@ECHO OFF
REM Test run of source_spec on data from BELSHAKE database
REM (Royal Observatory of Belgium)
python ../check_version.py
if %ERRORLEVEL% NEQ 0 exit
source_spec -A data/21840/*.asdf^
            -g raw
