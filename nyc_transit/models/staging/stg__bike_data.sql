with source as (

    select * from {{source('main', 'bike_data')}}

),

renamed as (

   select
      tripduration::int as tripduration,
      --starttime::date as starttime,
      --stoptime::date as stoptime,
      CONCAT(starttime, started_at)::date as starttime,
      CONCAT(stoptime, ended_at)::date as stoptime,
      --"start station id" as start_station_id,
      CONCAT("start station id", start_station_id) as start_station_id,
      CONCAT("start station name", start_station_name) as start_station_name,
      --"start station name" as start_station_name,
      CONCAT("start station latitude", start_lat) as start_lat,
      --"start station latitude"::double as start_lat,
      CONCAT("start station longitude", start_lng) as start_lng,
      --"start station longitude"::double as start_lng,
      CONCAT("end station id", end_station_id) as end_station_id,
      --"end station id" as end_station_id,
      CONCAT("end station name", end_station_name) as end_station_name,
      --"end station name" as end_station_name,
      CONCAT("end station latitude", end_lat) as end_lat,
      --"end station latitude"::double as end_lat,
      CONCAT("end station longitude", end_lng) as end_lng,
      --"end station longitude"::double as end_lng,
      bikeid,
      usertype,
      "birth year"::int as birth_year,
      gender::int as gender,
      ride_id,
      rideable_type,
      --started_at::date as started_at,
      --ended_at::date as ended_at,
      --start_station_name,
      --start_station_id,
      --end_station_name,
      --end_station_id,
      --start_lat::double as start_lat,
      --start_lng::double as start_lng,
      --end_lat::double as end_lat,
      --end_lng::double as end_lng,
      member_casual,
      filename

   from source

)

select * from renamed
