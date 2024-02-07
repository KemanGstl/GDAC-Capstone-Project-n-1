--create a new table based on the schema of the files

CREATE TABLE IF NOT EXISTS tripdata_2022.all_tripdata AS
SELECT * FROM `capstone-cyclistic-408613.tripdata_2022.tripdata_202201`
WHERE FALSE;

--append the data from the 12 files

INSERT INTO tripdata_2022.all_tripdata
SELECT * FROM `capstone-cyclistic-408613.tripdata_2022.tripdata_202201`;

INSERT INTO tripdata_2022.all_tripdata
SELECT * FROM `capstone-cyclistic-408613.tripdata_2022.tripdata_202202`;

INSERT INTO tripdata_2022.all_tripdata
SELECT * FROM `capstone-cyclistic-408613.tripdata_2022.tripdata_202203`;

INSERT INTO tripdata_2022.all_tripdata
SELECT * FROM `capstone-cyclistic-408613.tripdata_2022.tripdata_202204`;

INSERT INTO tripdata_2022.all_tripdata
SELECT * FROM `capstone-cyclistic-408613.tripdata_2022.tripdata_202205`;

INSERT INTO tripdata_2022.all_tripdata
SELECT * FROM `capstone-cyclistic-408613.tripdata_2022.tripdata_202206`;

INSERT INTO tripdata_2022.all_tripdata
SELECT * FROM `capstone-cyclistic-408613.tripdata_2022.tripdata_202207`;

INSERT INTO tripdata_2022.all_tripdata
SELECT * FROM `capstone-cyclistic-408613.tripdata_2022.tripdata_202208`;

INSERT INTO tripdata_2022.all_tripdata
SELECT * FROM `capstone-cyclistic-408613.tripdata_2022.tripdata_202209`;

INSERT INTO tripdata_2022.all_tripdata
SELECT * FROM `capstone-cyclistic-408613.tripdata_2022.tripdata_202210`;

INSERT INTO tripdata_2022.all_tripdata
SELECT * FROM `capstone-cyclistic-408613.tripdata_2022.tripdata_202211`;

INSERT INTO tripdata_2022.all_tripdata
SELECT * FROM `capstone-cyclistic-408613.tripdata_2022.tripdata_202212`;


-- counting rows of combined data
SELECT COUNT(*)
FROM `tripdata_2022.all_tripdata`;

