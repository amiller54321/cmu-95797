SELECT * FROM read_csv_auto('data/fhv_bases.csv')as fhv_bases;
SELECT * FROM read_csv_auto('data/bike/*.gz', union_by_name=True, filename=True, ALL_VARCHAR=1) as bike_data;
SELECT * FROM read_csv_auto('data/daily_citi_bike_trip_counts_and_weather.csv') as daily_citi_bike_trip_counts_and_weather;
SELECT * FROM read_csv_auto('data/central_park_weather.csv') as central_park_weather;


