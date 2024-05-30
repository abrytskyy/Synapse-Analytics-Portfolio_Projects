-- This is auto-generated code
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'https://dl0527.dfs.core.windows.net/nyc-taxi-data/raw/trip_data_green_delta/_delta_log/00000000000000000000.checkpoint.parquet',
        FORMAT = 'PARQUET'
    ) AS [result]


--json in delta log
-- This is auto-generated code
SELECT TOP 100
    jsonContent
/* --> place the keys that you see in JSON documents in the WITH clause:
       , JSON_VALUE (jsonContent, '$.key1') AS header1
       , JSON_VALUE (jsonContent, '$.key2') AS header2
*/
FROM
    OPENROWSET(
        BULK 'https://dl0527.dfs.core.windows.net/nyc-taxi-data/raw/trip_data_green_delta/_delta_log/00000000000000000000.json',
        FORMAT = 'CSV',
        FIELDQUOTE = '0x0b',
        FIELDTERMINATOR ='0x0b',
        ROWTERMINATOR = '0x0b'
    )
    WITH (
        jsonContent varchar(MAX)
    ) AS [result]


--changing to 0x0a
    SELECT TOP 100
    jsonContent
/* --> place the keys that you see in JSON documents in the WITH clause:
       , JSON_VALUE (jsonContent, '$.key1') AS header1
       , JSON_VALUE (jsonContent, '$.key2') AS header2
*/
FROM
    OPENROWSET(
        BULK 'https://dl0527.dfs.core.windows.net/nyc-taxi-data/raw/trip_data_green_delta/_delta_log/00000000000000000000.json',
        FORMAT = 'CSV',
        FIELDQUOTE = '0x0b',
        FIELDTERMINATOR ='0x0b',
        ROWTERMINATOR = '0x0a'
    )
    WITH (
        jsonContent varchar(MAX)
    ) AS [result]


--DELTA
use nyc_taxi_discovery
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'trip_data_green_delta/',
        DATA_SOURCE='nyc_taxi_data_raw',
        FORMAT = 'DELTA'
    ) AS [result]


-------------------
---Apply condition
-------------------

SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'trip_data_green_delta/',
        DATA_SOURCE='nyc_taxi_data_raw',
        FORMAT = 'DELTA'
    ) AS [result]
where YEAR=2021


SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'trip_data_green_delta/',
        DATA_SOURCE='nyc_taxi_data_raw',
        FORMAT = 'DELTA'
    ) AS [result]
where YEAR=2021 AND MONTH='05'
