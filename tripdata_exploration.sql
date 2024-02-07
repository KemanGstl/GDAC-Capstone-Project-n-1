-- Number of rows

SELECT COUNT (*)
  FROM `capstone-cyclistic-408613.tripdata_2022.all_tripdata`;

-- Data types for each column

SELECT column_name, data_type
FROM `capstone-cyclistic-408613.tripdata_2022.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'all_tripdata';

-- Null values for each column
SELECT 
  COUNTIF(ride_id IS NULL) AS ride_id_nulls,
  COUNTIF(rideable_type IS NULL) AS rideable_type_nulls,
  COUNTIF(started_at IS NULL) AS started_at_nulls,
  COUNTIF(ended_at IS NULL) AS ended_at_nulls,
  COUNTIF(start_station_name IS NULL) AS start_station_name_nulls,
  COUNTIF(start_station_id IS NULL) AS start_station_name_nulls,
  COUNTIF(end_station_name IS NULL) AS end_station_name_nulls,
  COUNTIF(end_station_id IS NULL) AS end_station_id_nulls,
  COUNTIF(member_casual IS NULL) AS member_casual_nulls
FROM `capstone-cyclistic-408613.tripdata_2022.all_tripdata`;

-- Null start (name & id missing)
SELECT COUNT (ride_id) AS rows_null_start
FROM `capstone-cyclistic-408613.tripdata_2022.all_tripdata`
WHERE start_station_name IS NULL  OR start_station_id IS NULL;

-- Null end (name & id missing)
SELECT COUNT (ride_id) AS rows_null_end
FROM `capstone-cyclistic-408613.tripdata_2022.all_tripdata`
WHERE end_station_name IS NULL OR end_station_id IS NULL;

-- Null end_coo (lat & lng missing)
SELECT COUNT (ride_id) AS rows_null_end_coo
FROM `capstone-cyclistic-408613.tripdata_2022.all_tripdata`
WHERE end_lat IS NULL OR end_lng IS NULL;

-- Duplicates rows
SELECT
  ride_id,
  rideable_type,
  started_at,
  ended_at,
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  member_casual,
  COUNT(*) as duplicate_count
FROM
  `capstone-cyclistic-408613.tripdata_2022.all_tripdata`
GROUP BY
  ride_id,
  rideable_type,
  started_at,
  ended_at,
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  member_casual
HAVING
  COUNT(*) > 1;

-- Checking inconsistencies in ride_id length
SELECT 
  LENGTH(ride_id) AS length_ride_id,
  COUNT(*) AS number_of_rows
FROM
  `capstone-cyclistic-408613.tripdata_2022.all_tripdata`
GROUP BY
  length_ride_id
ORDER BY
  number_of_rows DESC;

-- Double checking for duplicates in ride_id column
SELECT
  ride_id,
  COUNT(*) as occurences
FROM
  `capstone-cyclistic-408613.tripdata_2022.all_tripdata`
GROUP BY
  ride_id
HAVING
  COUNT(*) > 1
ORDER BY
  occurences DESC;

-- Categories of bicycles
SELECT  DISTINCT rideable_type,
  COUNT(rideable_type) AS no_of_trips
  FROM 
    `capstone-cyclistic-408613.tripdata_2022.all_tripdata`
  GROUP BY rideable_type;

-- Ride length >2 minutes & <1440 minutes
SELECT
  COUNTIF(ride_duration < 2 OR ride_duration > 1440) AS excluded_rides
FROM (
  SELECT
    TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_duration
  FROM
    `capstone-cyclistic-408613.tripdata_2022.all_tripdata`
);

-- Types of riders
SELECT DISTINCT member_casual,
  COUNT(member_casual) AS trips_per_type
FROM `capstone-cyclistic-408613.tripdata_2022.all_tripdata`
GROUP BY member_casual;



