with source as (

    select * from {{source('main', 'daily_citi_bike_trip_counts_and_weather')}}

),

renamed as (

   select
      date::date as date,
      trips::int as trips,
      precipitation::int as precipitation,
      max_temperature::double as max_temp,
      min_temperature::double as min_temp,
      average_wind_speed::double as ave_wind_speed,
      dow::int as dow,
      year::int as year,
      month::int as month,
      holiday::boolean as holiday,
      stations_in_service::int stations_in_service,
      weekday::boolean as weekday,
      weekday_non_holiday::boolean as weekday_non_holiday,
      filename,
      snow_depth::double as snow_depth

   from source

)

select * from renamed
