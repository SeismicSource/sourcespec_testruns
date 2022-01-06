@ECHO OFF
REM Test run of source_spec on Irpinia Seismic Network (ISNet, Italy) data
python ../check_version.py
if %ERRORLEVEL% NEQ 0 exit
source_spec -c config_ISNet.conf -t data/14641r.full.sac.tgz
