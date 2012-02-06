 #  Ce fichier est appele 'dbird'.
 #  Il decrit la succession des canaux presents dans les sites specifies.
 #  Ce fichier a la structure suivante : 
 # 
 #  originating_organization who_has_created_this_file
 #  network_list list_of_networks
 #  Section 'section_station' : 
 # 		'begin_station'
 # 			code_station date_debut date_fin latitude longitude altitude profondeur
 # 			Owner owner_name
 # 			section_location
 # 			section_sensor
 # 			section_ana_filter
 # 			section_digitizer
 # 			section_decimation
 # 			section_channel
 # 
 #  Section 'section_location' : 
 # 		begin_location
 # 			Location location_code latitude longitude altitude profondeur nom
 # 			...
 # 		end_location
 # 
 #  Section 'section_sensor' : 
 # 		begin_sensor
 # 			sensor_flag sensor_type sensor_sn sensor_pzfile sensor_azimut sensor_dip
 # 			...
 # 		end_sensor
 # 
 # 		Conventions : sensor_type est pris parmi la liste du fichier /u/clafouti/users/tgrs/PZ/sensor_list.
 # 		              sensor_azimut est nul au nord, positif vers l'est.
 # 		              sensor_dip est nul horizontalement, positif vers le bas.
 # 
 # 		              L'orientation classique des composantes est, selon la convention Seed :
 # 				Z : azimut =  0.00, dip = -90.00
 # 				N : azimut =  0.00, dip =   0.00
 # 				E : azimut = 90.00, dip =   0.00
 # 
 #  Section 'section_ana_filter' : 
 # 		begin_ana_filter
 # 			ana_filter_flag ana_filter_file
 # 			...
 # 		end_ana_filter
 # 
 #  Section 'section_digitizer' : 
 # 		begin_digitizer
 # 			digitizer_flag digitizer_file
 # 			...
 # 		end_digitizer
 # 
 #  Section 'section_decimation' : 
 # 		begin_decimation
 # 			decimation_flag decimation_file
 # 		end_decimation
 # 
 #  Section 'section_channel' : 
 # 		begin_channel
 # 			location_code channel_iris sensor_flag ana_filter_flag digitizer_flag decimation_flag date_debut date_fin network
 # 			...
 # 		end_channel
 # 
 # 

originating_organization "CRLNET INSU/CNRS, Paris, France"
network_list CL
begin_station
   #  verifier la profondeur du capteur
  PAN 2001.06.08-10:00:00 present 38.37352 22.24975 149.0 00.000 "Panormos, Nafpaktos, Greece"
  Owner "INSU"
  
  begin_location
     #  localisation avec le GPS reftek sur long 38.37346,  22.24976 107
    Location "00" 38.37352 22.24975 149.0 00.000 PAN
  end_location
  
  begin_sensor
     #  EW, NS, et Z
     #  attention sur une certaine periode inconnue capteur N345
    VEL1 L22 "none" "sensor/L22" 90.000 0.000
    VEL2 L22 "none" "sensor/L22" 0.000 0.000
    VEL3 L22 "none" "sensor/L22" 0.000 -90.000
    VEL4 L22 "none" "sensor/L22" 75.000 0.000
    VEL5 L22 "none" "sensor/L22" 345.000 0.000
  end_sensor
   # 
  begin_ana_filter
    GAIN1 "ana_filter/crl_gain5"
    REF32 "ana_filter/reftek_gain32"
  end_ana_filter
  
  begin_digitizer
    DIG1 "digitizer/titan.HI7190.125"
    DIG2 "digitizer/titan.CS5323.125"
    DIG3 "digitizer/reftek130.100"
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
     #  sans doute une periode avec le capteur tourne.....
    
     #  troisieme periode reftek 9631
    "00" EHE VEL4 none DIG3 none 2010.07.05-15:50:00 present CL
    "00" EHN VEL5 none DIG3 none 2010.07.05-15:50:00 present CL
    "00" EHZ VEL3 none DIG3 none 2010.07.05-15:50:00 present CL
     #  quatrieme periode reftek 9631 gain 32 a preciser
     #       00 EHE VEL4 REF32 DIG3 none 2010.07.05-15:50:00 present CL
     #       00 EHN VEL5 REF32 DIG3 none 2010.07.05-15:50:00 present CL
     #       00 EHZ VEL3 REF32 DIG3 none 2010.07.05-15:50:00 present CL
  end_channel
  
   #  fin de la station crl, on pourrait mettre la sttaion grecque
end_station

