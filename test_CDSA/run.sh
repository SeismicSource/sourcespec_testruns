#!/usr/bin/env bash
# Test run of source_spec on data from Centre de Données Sismologiques
# des Antilles (CDSA)
../check_version.py || exit
source_spec -t data/cdsa20100421051050GL.mseed\
            -q data/cdsa20100421051050GL.xml
