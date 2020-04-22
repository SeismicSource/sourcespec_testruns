<img src="imgs/SourceSpec_logo.png" width="600">

# SourceSpec
**Earthquake source parameters from S-wave displacement spectra**

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3688587.svg)](https://doi.org/10.5281/zenodo.3688587)

(c) 2011-2020 Claudio Satriano <satriano@ipgp.fr>

SourceSpec is a collection of three command line programs (written in
Python): `source_spec`, `source_model` and `source_residuals`.

The code is available at
[github.com/SeismicSource/sourcespec](https://github.com/SeismicSource/sourcespec).

## source_spec

The main code is `source_spec`, which computes earthquake source
parameters (seismic moment and corner frequency), as well as path
parameters (attenuation), by modelling the S-wave displacement
spectrum of a given earthquake recorded at one ore more seismic
stations.

### Theoretical background

The source spectrum is defined as:

<img src="imgs/source_model_equation.png" width="600">

Where:

 - 𝒓 is the hypocentral distance;
 - 𝑹<sub>𝞗𝞥</sub> is the radiation pattern coefficient for S-waves;
 - 𝞺<sub>𝒉</sub> and 𝞺<sub>𝒓</sub> are the medium densities at the
   hypocenter and at the receiver, respectively;
 - 𝜷<sub>𝒉</sub> and 𝜷<sub>𝒓</sub> are the S-wave velocities at the
   hypocenter and at the receiver, respectively;
 - 𝜧<sub>𝑶</sub> is the **seismic moment**;
 - 𝒇 is the frequency;
 - 𝒇<sub>𝒄</sub> is the **corner frequency**;
 - 𝒕* (**t-star**) is the ratio between the S-wave trave time and the
   **quality factor**, quantifying the inelastic attenuation.

`source_spec` computes **seismic moment**, **corner frequency** and
**t-star** are from the modelling of S-wave spectra.  The other
parameters are user defined (density, wave velocity, radiation pattern
coefficient) or derived from station and source location (hypocentral
distance).

Other parameters are computed from the previous ones, namely:
 
 - the moment magnitude Mw;
 - the source radius;
 - the Brune stress drop.

As a bonus, `source_spec` also computes local magnitude. 

### Input/output

`source_spec` reads as input a file, a tgz archive or a directory (which can,
in turn, contain files and/or tgz archives) with traces in any format supported
by [ObsPy](https://obspy.org) (e.g., miniSEED, SAC).

The easiest way of running `source_spec` is by having available:

 - a miniSEED file with waveform data (e.g., `data.mseed`);
 - a StationXML file with station metadata (station locations and instrument
   response) (e.g., `station.xml`);
 - a QuakeML file with event information and possibly arrival picks (e.g.,
   `event.xml`).

In this case, running `source_spec` is as simple as:

    source_spec -c source_spec.conf -d data.mseed -q event.xml

The path to the StationXML file must be specified in the configuration file
`source_spec.conf`.

To get an example configuration file, run:

    source_spec -S

To get help:

    source_spec -h


### Examples

This repository contains several examples:

  - [test_CDSA](test_CDSA):
    - data in miniSEED format
    - event information and phase picks in QuakeML format
    - instrumental response in stationXML format
  - [test_CRL](test_CRL):
    - data in SAC format
    - phase picks in "hypo" format
    - event information in "hypo" format
    - station coordinates in SAC header
    - instrumental response in "dataless SEED" format
  - [test_ISNet](test_ISNet):
    - data in SAC format (tgz archive)
    - phase picks in SAC header
    - event information in SAC header
    - station coordinates in SAC header
    - station sensitivity in SAC header
  - [test_IPOC](test_IPOC):
    - data in SAC format
    - phase picks in SAC header
    - event information in SAC header
    - station coordinates in SAC header
    - traces pre-deconvolved from instrumental response


## source_model
`source_model` plots theoretical spectra (and optionally observed ones), given
one or more values for moment magnitude, corner frequency and t-star.

`source_model` takes similar parameters than `source_spec`.  In addition, you
have to specifiy values or ranges for moment magnitude (`mag`), corner
frequency (`fc`) and t-star (`tstar`), ex:

    --mag=3.0 --fc=6,10 --tstar=0.05,0.07

You will find an example run of `source_model` in [test_CRL](test_CRL).

See the help for more information on the command line syntax:

    source_model -h


## source_residuals
`source_residuals` computes station residuals from the output of `source_spec`.
It takes multiple pickle files in the form:

    EVID-residual.pickle

containing single-event station residual, computes average station residuals,
and store them into a pickle file called:

    residual_mean.pickle

To get help:

    source_residuals -h
