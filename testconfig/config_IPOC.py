# -*- coding: utf-8 -*-
# Parameter file for source_spec.py
# This file has to be valid Python code and can contain scripting


# GENERAL PARAMETERS
#DEBUG=True # True: print debug information
DEBUG=False # True: print debug information
PLOT_SHOW = False
PLOT_SAVE = True
#PLOT_SAVE_FORMAT = 'pdf' #slower
PLOT_SAVE_FORMAT = 'png'

#database_file = 'sourcepar_sample.sqlite'

trace_format = 'IPOC'

# If true, traces are not fully deconvolved
# for the instrumental response: only the
# sensitivity is corrected (faster, especially
# on a large number of traces).
correct_sensitivity_only = False
# Pre-filtering frequencies for instrument correction
# Specify the four corner frequencies (f1,f2,f3,f4)
# of a cosine taper which is one between f2 and f3
# and tapers to zero for f1 < f < f2 and f3 < f < f4.
pre_filt = (0.1, 0.2, 55., 60.)
# -------------------


# INITIAL PARAMETERS
vp=5.5
vs=3.8438
rho=2900 #density
rps=0.67 #radiation pattern coefficient
#qs=12000.
# Brune stress drop
#bsd=20e6 #MPa
bsd=5e6 #Mpa
# -------------------


## S/N PARAMETERS
# Minimum rms (in trace units before instrument corrections)
# to consider a trace as noise
rmsmin = 1e-10 

# s-wave (and noise) window 
pre_p_time   = 0.5 #sec
p_win_length = 3 #sec
pre_noise_time = 5 #sec 
noise_win_length = 3 #sec
#S/N ratio min
sn_min = 1


# SPECTRUM PARAMETERS
time_domain_int = True

# S-wave window
pre_s_time   = 1 #sec
s_win_length = 10 #sec

# Taper
taper_halfwidth = 0.05 #between 0 (no taper) and 0.5

# Band-pass frequencies for accelerometers and velocimeters
# TODO: calculate from sampling rate?
bp_freqmin_acc    =  0.1
bp_freqmax_acc    = 50.0
bp_freqmin_shortp = 0.25
bp_freqmax_shortp = 50.0
bp_freqmin_broadb = 0.25
bp_freqmax_broadb = 50.0

# Filter cut frequencies for accelerometers and velocimeters
freq1_acc    =  0.1
freq2_acc    = 30.0
freq1_shortp =  0.5
freq2_shortp = 50.0
freq1_broadb =  0.5
freq2_broadb = 50.0
# -------------------


# INVERSION PARAMETERS
# Spectral weighting:
#   weight for f<=f_weight
#   1      for f> f_weight
f_weight = 7. #Hz
weight = 5.
# Initial values for fc (optional)
fc_0 = 8.
# initial value for t_star
t_star_0 = 0.045
# -------------------


# POST-PROCESSING PARAMETERS
# Min and max acceptable corner frequencies
min_corner_freq = 2
max_corner_freq = 50
