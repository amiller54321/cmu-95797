WITH trip_data AS (
    SELECT
        pulocationid,
        ANY_VALUE(duration_min) AS duration_min,
        COUNT(*) AS trips
    FROM {{ ref('mart__fact_all_taxi_trips') }}
    GROUP BY pulocationid
),

loc AS (
    SELECT
        locationid,
        borough,
        zone
    FROM {{ ref('mart__dim_locations') }}
)

SELECT
    borough,
    zone,
    AVG(trip_data.duration_min) AS avg_duration,
    SUM(trip_data.trips) AS trips
FROM trip_data
JOIN loc ON trip_data.pulocationid = loc.locationid
GROUP BY borough, zone;
