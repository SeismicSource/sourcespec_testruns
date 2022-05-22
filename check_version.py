#!/usr/bin/env python
# -*- coding: utf8 -*-
import sys
from distutils.version import LooseVersion
try:
    from sourcespec import __version__
except Exception:
    sys.stderr.write("Error: SourceSpec doesn't seem to be installed\n")
    sys.exit(1)

min_version = '1.5'

# Fix for old version numbers starting with 'v'
__version__ = __version__.lstrip('v')

if LooseVersion(__version__) < LooseVersion(min_version):
    sys.stderr.write(
        'Error:\n'
        '  These tests are designed for SourceSpec >= {}\n'
        '  You have version: {}\n'.format(min_version, __version__)
    )
    sys.exit(1)
