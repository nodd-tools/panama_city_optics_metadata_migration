-- 2. Platforms.csv
-- Extracts distinct vessels utilized for each station event.
SELECT
    LOWER(RAWTOHEX(SYS_GUID())) AS platform_id,
    STATION_ID AS event_id,
    VESSEL AS platform_name,
    NULL AS platform_identifier,
    NULL AS identifier_type
FROM
    agrbe_obj.RFS_STATIONS
WHERE
    VESSEL IS NOT NULL;
