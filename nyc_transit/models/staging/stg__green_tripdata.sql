with source as (

    select * from {{source('main', 'green_tripdata')}}

),

renamed as (

   select
      VendorID::int as VendorID,
      lpep_pickup_datetime::date as lpep_pickup_datetime,
      lpep_dropoff_datetime::date as lpep_dropoff_datetime,
      store_and_fwd_flag,
      RatecodeID::double as RatecodeID,
      PULocationID::int as PULocationID,
      DOLocationID::int as DOLocationID,
      passenger_count::double as passenger_count,
      trip_distance::double as trip_distance,
      fare_amount::double as fare_amount,
      extra::double as extra,
      mta_tax::double as mta_tax,
      tip_amount::double as tip_amount,
      tolls_amount::double as tolls_amount,
      improvement_surcharge::double as improvement_surcharge,
      total_amount::double as total_amount,
      payment_type::double as payment_type,
      trip_type::double as trip_type,
      congestion_surcharge::double as congestion_surcharge,
      filename

   from source

)

select * from renamed
