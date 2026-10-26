-- 4. Variables.csv
-- Unpivots core physical measurement columns from RFS_STATIONS and RFS_CTD_CASTS.
SELECT LOWER(RAWTOHEX(SYS_GUID())) AS variable_id, STATION_ID AS event_id, NULL AS sensor_id, 'BOTTOM_TEMP_C' AS variable_name, 'sea_water_temperature' AS cf_standard_name, 'Bottom temperature in degrees C' AS description, 'Celsius' AS unit_of_measure 
FROM agrbe_obj.RFS_STATIONS WHERE BOTTOM_TEMP_C IS NOT NULL
UNION ALL
SELECT LOWER(RAWTOHEX(SYS_GUID())), STATION_ID, NULL, 'SALINITY_PSU', 'sea_water_salinity', 'Salinity in PPT', 'PSU' 
FROM agrbe_obj.RFS_STATIONS WHERE SALINITY_PSU IS NOT NULL
UNION ALL
SELECT LOWER(RAWTOHEX(SYS_GUID())), STATION_ID, NULL, 'DEPTH_M', 'depth', 'Depth in meters', 'm' 
FROM agrbe_obj.RFS_STATIONS WHERE DEPTH_M IS NOT NULL
UNION ALL
SELECT LOWER(RAWTOHEX(SYS_GUID())), STATION_ID, NULL, 'PH_VALUE', 'sea_water_ph_reported_on_total_scale', 'pH value', '1' 
FROM agrbe_obj.RFS_STATIONS WHERE PH_VALUE IS NOT NULL
UNION ALL
SELECT LOWER(RAWTOHEX(SYS_GUID())), e.STATIONKEY, NULL, 'DENSITY', 'sea_water_density', 'Density from CTD cast profile', 'kg m-3' 
FROM agrbe_obj.RFS_CTD_CASTS c JOIN agrbe_obj.RFS_EVENTS e ON c.EVENT_ID = e.EVENT_ID WHERE c.DENSITY IS NOT NULL
UNION ALL
SELECT LOWER(RAWTOHEX(SYS_GUID())), e.STATIONKEY, NULL, 'FLUORESCENCE', 'mass_concentration_of_chlorophyll_in_sea_water', 'Fluorescence from CTD cast profile', 'mg m-3' 
FROM agrbe_obj.RFS_CTD_CASTS c JOIN agrbe_obj.RFS_EVENTS e ON c.EVENT_ID = e.EVENT_ID WHERE c.FLUORESCENCE IS NOT NULL
UNION ALL
SELECT LOWER(RAWTOHEX(SYS_GUID())), e.STATIONKEY, NULL, 'TRANSMISSIVITY', 'volume_beam_attenuation_coefficient_of_radiative_flux_in_sea_water', 'Transmissivity from CTD cast profile', '%' 
FROM agrbe_obj.RFS_CTD_CASTS c JOIN agrbe_obj.RFS_EVENTS e ON c.EVENT_ID = e.EVENT_ID WHERE c.TRANSMISSIVITY IS NOT NULL
UNION ALL
SELECT LOWER(RAWTOHEX(SYS_GUID())), e.STATIONKEY, NULL, 'OXYGEN_MG_L', 'mass_concentration_of_oxygen_in_sea_water', 'Oxygen mass concentration from CTD cast profile', 'mg/L' 
FROM agrbe_obj.RFS_CTD_CASTS c JOIN agrbe_obj.RFS_EVENTS e ON c.EVENT_ID = e.EVENT_ID WHERE c.OXYGEN_MG_L IS NOT NULL
UNION ALL
SELECT LOWER(RAWTOHEX(SYS_GUID())), e.STATIONKEY, NULL, 'OXYGEN_PCT', 'fractional_saturation_of_oxygen_in_sea_water', 'Percent oxygen from CTD cast profile', '%' 
FROM agrbe_obj.RFS_CTD_CASTS c JOIN agrbe_obj.RFS_EVENTS e ON c.EVENT_ID = e.EVENT_ID WHERE c.OXYGEN_PCT IS NOT NULL
UNION ALL
SELECT LOWER(RAWTOHEX(SYS_GUID())), e.STATIONKEY, NULL, 'SOUND_VELOCITY', 'speed_of_sound_in_sea_water', 'Sound velocity from CTD cast profile', 'm/s' 
FROM agrbe_obj.RFS_CTD_CASTS c JOIN agrbe_obj.RFS_EVENTS e ON c.EVENT_ID = e.EVENT_ID WHERE c.SOUND_VELOCITY IS NOT NULL;
