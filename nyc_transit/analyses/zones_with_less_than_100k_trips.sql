with all_trips as
(select
   pulocationid,
   count(*) as trips
   from {{ ref('mart__fact_all_taxi_trips') }}
   where pulocationid is not null
   group by pulocationid),

zones as
(select
  count(*) as trips,
  locationid,
  zone
  from {{ ref('mart__dim_locations') }}
  group by locationid, zone
)

select
   zone,
   sum(all_trips.trips) as total_trips
from all_trips
join zones on all_trips.pulocationid = zones.locationid
group by zone
having sum(all_trips.trips) < 100000;
