--Trips ending at the airport
SELECT COUNT(*) AS total_trips_to_airport
FROM {{ ref('mart__fact_all_taxi_trips') }}
WHERE dolocationid IN ('Airport', 'Newark');
group by all

