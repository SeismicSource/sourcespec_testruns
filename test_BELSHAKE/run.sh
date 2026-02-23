#!/usr/bin/env bash
# Test run of source_spec on data from BELSHAKE database
# (Royal Observatory of Belgium)
../check_version.py || exit
source_spec -A data/21840/*.asdf\
            -g raw
