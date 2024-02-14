-- Create table based on the schema of the appended data + considerations from tripdata_exploration
CREATE TABLE IF NOT EXISTS tripdata_2022.all_tripdata_cleaned AS
SELECT *,
-- adding day of the week and month columns
  FORMAT_TIMESTAMP('%A', started_at) AS day,
  FORMAT_TIMESTAMP('%B', started_at) AS month
FROM `capstone-cyclistic-408613.tripdata_2022.all_tripdata`
WHERE
-- excluding rows with missing values
  start_station_name IS NOT NULL AND
  start_station_id IS NOT NULL AND
  end_station_name IS NOT NULL AND
  end_station_id IS NOT NULL AND
  end_lat IS NOT NULL AND
  end_lng IS NOT NULL AND
-- excluding ride lenghts <2min and >1440 minutes
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) > 2 AND
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) < 1440;
