select
count(*) as trips
from {{ ref('mart__fact_all_taxi_trips')}} trips
join {{ ref('mart__dim_locations') }} loc on
trips.pulocationid = loc.locationid
where loc.locationid is null;
