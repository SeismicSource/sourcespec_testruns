@ECHO OFF
REM Test run of source_spec on data from Centre de Données Sismologiques
REM des Antilles (CDSA)
source_spec -c config_CDSA.conf^
            -t data/cdsa20100421051050GL.mseed^
            -q data/cdsa20100421051050GL.xml
