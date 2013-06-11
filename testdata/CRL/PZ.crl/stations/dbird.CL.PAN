originating_organization "CRLNET INSU/CNRS, Paris, France"
network_list CL
# on considere PAN pour les données Titan

begin_station
  PAN 2001.06.08-10:00:00 present 38.37352 22.24975 149.0 00.000 "Panormos, Nafpaktos, Greece"
  Owner "INSU"
  
  begin_location
#  localisation avec le GPS reftek sur long 38.37346,  22.24976 107
    Location "00" 38.37352 22.24975 149.0 00.000 PAN
  end_location
  
  begin_sensor
#  EW, NS, et Z, Z inverse
    VEL1 L22 "none" "sensor/L22" 90.000 0.000
    VEL2 L22 "none" "sensor/L22" 0.000 0.000
    VEL3 L22 "none" "sensor/L22" 0.000 -90.000
# on ne sait pas bien quand le capteur a ete tourne
#    VEL4 L22 "none" "sensor/L22" 75.000 0.000
#    VEL5 L22 "none" "sensor/L22" 345.000 0.000
  end_sensor
   # 
  begin_ana_filter
    GAIN1 "ana_filter/crl_gain5"
  end_ana_filter
  
  begin_digitizer
    DIG1 "digitizer/titan.HI7190.125"
    DIG2 "digitizer/titan.CS5323.125"
  end_digitizer
  
  begin_channel
     #  premiere periode minititan3XT ipgp-4, 020084, 020083
    "00" EHE VEL1 none DIG1 none 2001.06.08-10:00:00 2006.10.11-09:35:00 CL
    "00" EHN VEL2 none DIG1 none 2001.06.08-10:00:00 2006.10.11-09:35:00 CL
    "00" EHZ VEL3 none DIG1 none 2001.06.08-10:00:00 2006.10.11-09:35:00 CL
     #  deuxieme periode titan3NT 250007
    "00" EHE VEL1 GAIN1 DIG2 none 2006.10.11-09:40:00 2010.07.05-15:45:00 CL
    "00" EHN VEL2 GAIN1 DIG2 none 2006.10.11-09:40:00 2010.07.05-15:45:00 CL
    "00" EHZ VEL3 GAIN1 DIG2 none 2006.10.11-09:40:00 2010.07.05-15:45:00 CL

# sans doute une periode avec le capteur tourne
    
  end_channel
  
end_station

