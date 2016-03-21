# source_spec
**Earthquake source parameters from S-wave displacement spectra**

## Sample runs

### source_spec
source_spec reads as input a file, a tgz archive or a directory (which can,
in turn, contain files and/or tgz archives) with traces in any format supported
by ObsPy.

Optionally, one can specify:

 - a file or a dir path containing station metadata
 - a hypocenter file
 - a phase file with P and S arrivals

To run the CRL test:

    source_spec -c testconfig/config_CRL.conf\
      -t testdata/CRL/2010.01.20-08.10.27\
      -H testdata/CRL/2010.01.20-08.10.27.phs.h\
      -p testdata/CRL/2010.01.20-08.10.27.phs

To run the ISNet test:

    source_spec -c testconfig/config_ISNet.conf\
      -t testdata/ISNet/14641r.full.sac.tgz

To run the IPOC test:

    source_spec -c testconfig/config_IPOC.conf\
      -t testdata/IPOC/324_0051-PB05-03077_tr14

To get help:

    source_spec -h


### source_model
source_model plots theoretical spectra (and optionally observed ones),
given one or more values for Mw, fc and t*.

To run source_model test on CRL:

    source_model -c testconfig/config_CRL.conf\
      -t testdata/CRL/2010.01.20-08.10.27/2010.01.20-08.10.27.TRIZ.HHE.SAC\
      -H testdata/CRL/2010.01.20-08.10.27.phs.h\
      -p testdata/CRL/2010.01.20-08.10.27.phs\
      --mag=3.0 --fc=6,10 --tstar=0.05,0.07 -P

To get help:

    source_model -h


### source_residuals
source_residuals computes station residuals from the output of source_spec.
It takes multiple pickle files in the form:

    EVID-residual.pickle

containing single-event station residual, computes average station residuals,
and store them into a pickle file called:

    residual_mean.pickle

To get help:

    source_residuals -h
