#!/usr/bin/env bash
# Test run of source_model on Corinth Rift Laboratory (CRL, Greece) data
../check_version.py || exit
source_model -c config_CRL.conf\
  -t data/2010.01.20-08.10.27/2010.01.20-08.10.27.TRIZ.HHE.SAC\
  -H data/2010.01.20-08.10.27.phs.h\
  -p data/2010.01.20-08.10.27.phs\
  --mag=3.0 --fc=6,10 --tstar=0.05,0.07 -P
