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
