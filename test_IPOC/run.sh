#!/usr/bin/env bash
# Test run of source_spec on data from Integrated Plate Boundary Observatory
# Chile (IPOC)
../check_version.py || exit
source_spec -c config_IPOC.conf -t data/324_0051-PB05-03077_tr14
