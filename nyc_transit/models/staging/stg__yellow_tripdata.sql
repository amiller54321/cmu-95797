with source as (

    select * from {{source('main', 'yellow_tripdata')}}

),

renamed as (

   select

      VendorID::int as VendorID,
      tpep_pickup_datetime::date as tpep_pickup_datetime,
      tpep_dropoff_datetime::date as tpep_dropoff_datetime,
      passenger_count::double as passenger_count,
      trip_distance::double as trip_distance,
      RatecodeID::double as RatecodeID,
      store_and_fwd_flag,
      RatecodeID::double as RatecodeID,
      PULocationID::int as PULocationID,
      DOLocationID::int as DOLocationID,
      payment_type::double as payment_type,
      fare_amount::double as fare_amount,
      extra::double as extra,
      mta_tax::double as mta_tax,
      tip_amount::double as tip_amount,
      tolls_amount::double as tolls_amount,
      improvement_surcharge::double as improvement_surcharge,
      total_amount::double as total_amount,
      congestion_surcharge::double as congestion_surcharge,
      airport_fee::double as airport_fee,
      filename

   from source

)

select * from renamed
