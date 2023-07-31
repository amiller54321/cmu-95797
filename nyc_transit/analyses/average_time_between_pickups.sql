WITH pickup_times AS (
    SELECT
        att.pulocationid,
        att.pickup_datetime,
        dl.zone,
        LAG(att.pickup_datetime) OVER (PARTITION BY att.pulocationid ORDER BY pickup_datetime) AS previous_pickup_datetime
    FROM mart__fact_all_taxi_trips att
    JOIN mart__dim_locations dl ON att.pulocationid = dl.locationid
)

SELECT
    zone,
    AVG(EXTRACT(EPOCH FROM (pickup_datetime - previous_pickup_datetime))) / 60 AS avg_time_between_pickups_in_minutes
FROM pickup_times
WHERE previous_pickup_datetime IS NOT NULL
GROUP BY zone;
