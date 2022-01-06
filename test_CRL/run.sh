#!/usr/bin/env bash
# Test run of source_spec on Corinth Rift Laboratory (CRL, Greece) data
../check_version.py || exit
source_spec -c config_CRL.conf\
  -t data/2010.01.20-08.10.27\
  -H data/2010.01.20-08.10.27.phs.h\
  -p data/2010.01.20-08.10.27.phs
