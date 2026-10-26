-- 3. Sensors.csv
-- Unions camera and water quality instrument fields into a consolidated list.
SELECT
    LOWER(RAWTOHEX(SYS_GUID())) AS sensor_id,
    STATION_ID AS event_id,
    CAMERA_NAME AS sensor_name,
    'Camera' AS instrument_type
FROM
    agrbe_obj.RFS_STATIONS
WHERE
    CAMERA_NAME IS NOT NULL
UNION ALL
SELECT
    LOWER(RAWTOHEX(SYS_GUID())) AS sensor_id,
    STATION_ID AS event_id,
    INSTRUMENT_TYPE AS sensor_name,
    'CTD/Water Quality' AS instrument_type
FROM
    agrbe_obj.RFS_STATIONS
WHERE
    INSTRUMENT_TYPE IS NOT NULL;
