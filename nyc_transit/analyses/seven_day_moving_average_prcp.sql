SELECT
    date,
    prcp,
    AVG(prcp) OVER (
        ORDER BY date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS moving_avg_7_days
FROM {{ ref('stg__central_park_weather') }};
