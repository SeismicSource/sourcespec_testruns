#!/usr/bin/env bash
# Test run of source_spec on Irpinia Seismic Network (ISNet, Italy) data
../check_version.py || exit
source_spec -c config_ISNet.conf -t data/14641r.full.sac.tgz
