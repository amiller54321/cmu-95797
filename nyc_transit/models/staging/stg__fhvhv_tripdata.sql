with source as (

    select * from {{source('main', 'fhvhv_tripdata')}}

),

renamed as (

   select
      hvfhs_license_num,
      dispatching_base_num,
      originating_base_num,
      request_datetime::date as request_datetime,
      on_scene_datetime::date as request_datetime,
      pickup_datetime::date as pickup_datetime,
      dropoff_datetime::date as dropoff_datetime,
      PULocationID::int as PULocationID,
      trip_miles::double as trip_miles,
      trip_time::int as trip_time,
      base_passenger_fare::double as base_passenger_fare,
      tolls::double as tolls,
      bcf::double as bcf,
      sales_tax::double as sales_tax,
      congestion_surcharge::double as congestion_surcharge,
      airport_fee::double as airport_fee,
      tips::double as tips,
      driver_pay::double as driver_pay,
      shared_request_flag,
      shared_match_flag,
      access_a_ride_flag,
      wav_request_flag,
      wav_match_flag,
      DOLocationID::int as DOLocationID,
      filename

   from source

)

select * from renamed
