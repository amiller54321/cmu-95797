--Interborough taxi trips by weekday
SELECT
  weekday(started_at_ts) as weekday
  COUNT(*) AS total_trips,
  SUM(CASE WHEN pulocationid.borough <> dolocationid.endborough THEN 1 ELSE 0 END) AS trips_different_boroughs,
  (SUM(CASE WHEN pulocationid.borough <> dolocationid.borough THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage_different_boroughs
FROM {{ ref('mart_fact_all_taxi_trips.sql') }}
JOIN
  boroughs_dim bd ON pulocationid = bd.borough
                 AND dolocationid = bd.borough
GROUP BY all
