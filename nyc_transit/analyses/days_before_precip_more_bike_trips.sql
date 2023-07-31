WITH bike_trip_counts AS (
    SELECT
        date,
        COUNT(*) AS bike_trips_count
    FROM {{ ref('stg__bike_data') }}
    GROUP BY date
),

weather_flags AS (
    SELECT
        date,
        prcp,
        snow
    FROM {{ ref('stg__central_park_weather') }}
)

SELECT
    wt.date,
    wt.bike_trips_count,
    wf.prcp,
    wf.snow,
    LAG(wt.bike_trips_count) OVER (ORDER BY wt.date) AS prev_bike_trips_count,
    AVG(wt.bike_trips_count) OVER (PARTITION BY wf.prcp, wf.snow) AS avg_bike_trips_count
FROM
    bike_trip_counts wt
JOIN
    weather_flags wf ON wt.date = wf.date;
