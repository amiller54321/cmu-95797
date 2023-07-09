with source as (

    select * from {{source('main', 'fhv_tripdata')}}

),

renamed as (

   select
      dispatching_base_num::varchar as dispatching_base_num,
      pickup_datetime::date as pickup_datetime,
      dropOff_datetime::date as dropoff_datetime,
      PUlocationID::double as PUlocationID,
      DOlocationID::double as DOlocationID,
      Affiliated_base_number,
      filename

   from source

)

select * from renamed
