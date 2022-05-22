@ECHO OFF
REM Test run of source_spec on data from Centre de Données Sismologiques
REM des Antilles (CDSA)
python ../check_version.py
if %ERRORLEVEL% NEQ 0 exit
source_spec -t data/cdsa20100421051050GL.mseed^
            -q data/cdsa20100421051050GL.xml
