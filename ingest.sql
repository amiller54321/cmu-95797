--ingest individual csv files
create table fhv_bases as select * from read_csv_auto('./data/fhv_bases.csv', union_by_name=True, filename=True, all_varchar=1, header=True);
create table daily_citi_bike_trip_counts_and_weather as select * from read_csv_auto('./data/daily_citi_bike_trip_counts_and_weather.csv', union_by_name=True, filename=True, all_varchar=1);
create table central_park_weather as select * from read_csv_auto('./data/central_park_weather.csv', union_by_name=True, filename=True, all_varchar=1, header=True);

--ingest taxi data from parquet files
create table yellow_tripdata as select * from read_parquet('./data/taxi/yellow_tripdata*.parquet', union_by_name=True, filename=True);
create table green_tripdata as select * from read_parquet('./data/taxi/green_tripdata*.parquet', union_by_name=True, filename=True);
create table fhvhv_tripdata as select * from read_parquet('./data/taxi/fhvhv_tripdata*.parquet', union_by_name=True, filename=True);
create table fhv_tripdata as select * from read_parquet('./data/taxi/fhv_tripdata*.parquet', union_by_name=True, filename=True);

--ingest bike data.  Unable to ingest this data.  Assuming it is due to memory issues, but have not been able to resolve
--create table bike_data as select * from read_csv_auto('./data/bike/*-citibike-tripdata.csv.gz', union_by_name=True, filename=True, all_varchar=1);

