use nyc_taxi_discovery
SELECT 
    TOP 100 *
    --Borough,
    --COUNT(1) as NO_OF_TRIPS
FROM
    OPENROWSET(
        BULK 'taxi_zone.csv',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW=TRUE,
        FIELDTERMINATOR=',',
        ROWTERMINATOR='\n'
    )
    WITH(
        LocationID SMALLINT,
        Borough VARCHAR(15),
        Zone VARCHAR(50),
        service_zone VARCHAR(15)
    ) AS Taxi_Zone


--parquet 01-2020 
-- This is auto-generated code
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'https://dl0527.dfs.core.windows.net/nyc-taxi-data/raw/trip_data_green_parquet/year=2020/month=01/part-00000-tid-6133789922049958496-2e489315-890a-4453-ae93-a104be9a6f06-106-1-c000.snappy.parquet',
        FORMAT = 'PARQUET'
    ) AS [result]



use nyc_taxi_discovery
SELECT 
    TOP 100 *
    --Borough,
    --COUNT(1) as NO_OF_TRIPS
FROM
    OPENROWSET(
        BULK 'taxi_zone.csv',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW=TRUE,
        FIELDTERMINATOR=',',
        ROWTERMINATOR='\n'
    )
    WITH(
        LocationID SMALLINT,
        Borough VARCHAR(15),
        Zone VARCHAR(50),
        service_zone VARCHAR(15)
    ) AS Taxi_Zone
    inner join 
    OPENROWSET(
        BULK 'trip_data_green_parquet/year=2020/month=01/part-00000-tid-6133789922049958496-2e489315-890a-4453-ae93-a104be9a6f06-106-1-c000.snappy.parquet',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'PARQUET',
        FIRSTROW = 2
    ) AS Trip_Data
ON Taxi_Zone.LocationID=Trip_Data.PULocationID
--GROUP BY Borough


use nyc_taxi_discovery
SELECT 
    TOP 100 *
    --Borough,
    --COUNT(1) as NO_OF_TRIPS
FROM
    OPENROWSET(
        BULK 'taxi_zone.csv',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW=TRUE,
        FIELDTERMINATOR=',',
        ROWTERMINATOR='\n'
    )
    WITH(
        LocationID SMALLINT,
        Borough VARCHAR(15),
        Zone VARCHAR(50),
        service_zone VARCHAR(15)
    ) AS Taxi_Zone
    inner join 
    OPENROWSET(
        BULK 'trip_data_green_parquet/year=2020/month=01/',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'PARQUET',
        FIRSTROW = 2
    ) AS Trip_Data
ON Taxi_Zone.LocationID=Trip_Data.PULocationID
--GROUP BY Borough


use nyc_taxi_discovery
SELECT 
    --TOP 100 *
    Borough,
    COUNT(1) as NO_OF_TRIPS
FROM
    OPENROWSET(
        BULK 'taxi_zone.csv',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW=TRUE,
        FIELDTERMINATOR=',',
        ROWTERMINATOR='\n'
    )
    WITH(
        LocationID SMALLINT,
        Borough VARCHAR(15),
        Zone VARCHAR(50),
        service_zone VARCHAR(15)
    ) AS Taxi_Zone
    inner join 
    OPENROWSET(
        BULK 'trip_data_green_parquet/year=2020/month=01/',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'PARQUET',
        FIRSTROW = 2
    ) AS Trip_Data
ON Taxi_Zone.LocationID=Trip_Data.PULocationID
GROUP BY Borough
ORDER BY 2 DESC
