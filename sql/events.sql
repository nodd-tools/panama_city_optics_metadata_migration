-- 1. Events.csv
-- Maps core station details and builds an ISO 8601 UTC timestamp.
SELECT
    s.STATION_ID AS event_id,
    NVL(e.EVENT_TYPE, 'Station') AS event_type,
    s.STATIONREF AS event_name,
    s.COMMENT_STATION AS abstract,
    TO_CHAR(s.STATION_DATE, 'YYYY-MM-DD') || 'T' || NVL(s.CAMERA_IN, s.TRAP_TIME_IN) || 'Z' AS start_time,
    TO_CHAR(s.STATION_DATE, 'YYYY-MM-DD') || 'T' || NVL(s.CAMERA_OUT, s.TRAP_TIME_OUT) || 'Z' AS end_time,
    'POINT (' || s.LONGITUDE || ' ' || s.LATITUDE || ')' AS geometry
FROM
    agrbe_obj.RFS_STATIONS s
LEFT JOIN
    agrbe_obj.RFS_EVENTS e ON s.STATION_ID = e.STATIONKEY;

