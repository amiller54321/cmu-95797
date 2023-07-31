select
   yt.pulocationid,
   yt.fare_amount,
   AVG(fare_amount) OVER() AS overall_avg_fare,
   dl.borough,
   dl.zone,
   AVG(yt.fare_amount) OVER (Partition by dl.borough) AS borough_avg_fare,
   AVG(yt.fare_amount) OVER (partition by dl.zone) as zone_avg_fare,
from {{ ref('stg__yellow_tripdata') }} yt
join {{ ref('mart__dim_locations') }} dl on
yt.pulocationid = dl.locationid;
