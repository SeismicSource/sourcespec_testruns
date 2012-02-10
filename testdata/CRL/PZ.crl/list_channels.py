#!/usr/bin/env python
import glob
from obspy.xseed import Parser

for dlessfile in glob.glob('dataless.*'):
	sp = Parser(dlessfile)
	for chan in [ a[0].replace('RESP.','') for a in sp.getRESP() ]:
		print chan
