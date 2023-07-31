SELECT *
FROM
(
    SELECT
        borough,
        count(*) AS trips
    FROM {{ ref('mart__fact_all_taxi_trips') }} AS all_trips
    JOIN {{ ref('mart__dim_locations') }} AS lc ON all_trips.pulocationid = lc.locationid
    GROUP BY borough
) AS data
PIVOT
(
    SUM(trips)
    FOR borough IN ('Manhattan', 'Queens', 'Brooklyn', 'Bronx', 'Unknown', 'Staten Island', 'EWR')
) AS pivoted_data;
