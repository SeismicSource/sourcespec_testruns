#!/usr/bin/env python
# test_dataless.py
#
# Checks whether it is possible to read poles and zeroes from a dataless file
# Prints the erorrs to stdout
#
# 2012-02-15 - Claudio Satriano <satriano@ipgp.fr>
from obspy.xseed import Parser
from datetime import timedelta
from glob import glob

for dlessfile in glob('dataless.*'):
    try:
        sp = Parser(dlessfile)
    except IOError:
        print 'Error reading file:', dlessfile
        continue

    blk = sp.blockettes
    net = blk[50][0].network_code
    sta = blk[50][0].station_call_letters

    startdates = [b.start_date for b in blk[52]]
    #enddates = [b.end_date for b in blk[52]]
    chans = [b.channel_identifier for b in blk[52]]
    locs = [b.location_identifier for b in blk[52]]

    for i in range(0, len(startdates)):
        channel_id = net + '.' + sta + '.' + locs[i] + '.' + chans[i]
        # If we do not add at least 7 minutes to the start_time, ObsPy says:
        # "None or more than one channel with the given description"
        # why????
        t = timedelta(minutes=7)
        time = startdates[i] #+ t
        try:
            PAZ = sp.getPAZ(channel_id, time)
            #print PAZ
            #coords = sp.getCoordinates(channel_id, time)
            #print coords['longitude'], coords['latitude'], channel_id.split('.')[1]
        except Exception, error:
            print dlessfile, time, channel_id, error
