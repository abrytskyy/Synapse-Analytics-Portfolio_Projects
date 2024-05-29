-- This is auto-generated code using HTTPS
SELECT
    TOP 10000 *
FROM
    OPENROWSET(
        BULK 'https://sysnapsedl24.dfs.core.windows.net/nyc-taxi-data/raw/taxi_zone.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW=TRUE,
        FIELDTERMINATOR=',',
        ROWTERMINATOR='\n'
    ) AS [result]

--This code is written manually using ADFSS, Header Row, Row and Field Terminator 
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'abfss://nyc-taxi-data@sysnapsedl24.dfs.core.windows.net/raw/taxi_zone.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW=TRUE,
        FIELDTERMINATOR=',',
        ROWTERMINATOR='\n'
    ) AS [result]

--Examine the data type of taxi zone csv
EXEC sp_describe_first_result_set N'SELECT
    TOP 1 *
FROM
    OPENROWSET(
        BULK ''https://sysnapsedl24.dfs.core.windows.net/nyc-taxi-data/raw/taxi_zone.csv'',
        FORMAT = ''CSV'',
        PARSER_VERSION = ''2.0'',
        HEADER_ROW=TRUE
    ) AS [result]'

--This code is written manually using ADFSS, Header Row, Row and Field Terminator 
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'abfss://nyc-taxi-data@sysnapsedl24.dfs.core.windows.net/raw/taxi_zone.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW=TRUE,
        FIELDTERMINATOR=',',
        ROWTERMINATOR='\n'
    ) AS [result]

--Max length of each column
SELECT
    Max(len(LocationID)) as len_LocationId,
    Max(len(Borough)) as len_Borough,
    Max(len(Zone)) as len_Zone,
    Max(len(service_zone)) as len_service_zone
FROM
    OPENROWSET(
        BULK 'abfss://nyc-taxi-data@sysnapsedl24.dfs.core.windows.net/raw/taxi_zone.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW=TRUE,
        FIELDTERMINATOR=',',
        ROWTERMINATOR='\n'
    ) AS [result]

--Use with clause to provide the explicit data type
SELECT
    *
FROM
    OPENROWSET(
        BULK 'abfss://nyc-taxi-data@sysnapsedl24.dfs.core.windows.net/raw/taxi_zone.csv',
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
    ) AS [result]

-- Collation check of database
select name, collation_name from sys.databases

SELECT
    *
FROM
    OPENROWSET(
        BULK 'abfss://nyc-taxi-data@sysnapsedl24.dfs.core.windows.net/raw/taxi_zone.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW=TRUE,
        FIELDTERMINATOR=',',
        ROWTERMINATOR='\n'
    )
    WITH(
        LocationID SMALLINT,
        Borough VARCHAR(15) COLLATE Latin1_General_100_CI_AS_SC_UTF8,
        Zone VARCHAR(50) COLLATE Latin1_General_100_CI_AS_SC_UTF8,
        service_zone VARCHAR(15) COLLATE Latin1_General_100_CI_AS_SC_UTF8
    ) AS [result]

--Create new database
CREATE DATABASE nyc_taxi_discovery
SELECT NAME, collation_name  FROM sys.databases

use nyc_taxi_discovery
ALTER DATABASE nyc_taxi_discovery COLLATE Latin1_General_100_CI_AS_SC_UTF8

--Select specific data set
SELECT
    *
FROM
    OPENROWSET(
        BULK 'abfss://nyc-taxi-data@sysnapsedl24.dfs.core.windows.net/raw/taxi_zone.csv',
        FORMAT = 'CSV',
		PARSER_VERSION = '2.0',
        HEADER_ROW=TRUE,
        FIELDTERMINATOR=',',
        ROWTERMINATOR='\n'
    )
    WITH(
        Borough VARCHAR(15),
        Zone VARCHAR(50),
        service_zone VARCHAR(15)
    ) AS [result]
	
--Read data withou header 
SELECT
    *
FROM
    OPENROWSET(
        BULK 'abfss://nyc-taxi-data@sysnapsedl24.dfs.core.windows.net/raw/taxi_zone_without_header.csv',
        FORMAT = 'CSV',
		PARSER_VERSION = '2.0',
        HEADER_ROW=TRUE,
        FIELDTERMINATOR=',',
        ROWTERMINATOR='\n'
    ) AS [result]
	
--Provide column name of headerless CSV
SELECT
    *
FROM
    OPENROWSET(
        BULK 'abfss://nyc-taxi-data@sysnapsedl24.dfs.core.windows.net/raw/taxi_zone_without_header.csv',
        FORMAT = 'CSV',
		PARSER_VERSION = '2.0',
        FIELDTERMINATOR=',',
        ROWTERMINATOR='\n'
    )WITH(
        LocationID SMALLINT,
        Borough VARCHAR(15),
        Zone VARCHAR(50),
        service_zone VARCHAR(15)
    ) AS [result]

--Provide column name of headerless CSV with position
SELECT
    *
FROM
    OPENROWSET(
        BULK 'abfss://nyc-taxi-data@sysnapsedl24.dfs.core.windows.net/raw/taxi_zone_without_header.csv',
        FORMAT = 'CSV',
		PARSER_VERSION = '2.0',
        FIELDTERMINATOR=',',
        ROWTERMINATOR='\n'
    )WITH(
        Borough VARCHAR(15) 2,
        Zone VARCHAR(50) 3,
        service_zone VARCHAR(15) 4
    ) AS [result]
	
--Create external data source
CREATE EXTERNAL DATA SOURCE nyc_taxi_data
WITH (
		LOCATION = 'abfss://nyc-taxi-data@sysnapsedl24.dfs.core.windows.net/raw/'
	)
	
--Drop external data source
DROP EXTERNAL DATA SOURCE nyc_taxi_data_row

--Select available external data source
SELECT * FROM SYS.EXTERNAL_DATA_SOURCES

--Read data using external data source
SELECT
    *
FROM
    OPENROWSET(
        BULK 'taxi_zone_without_header.csv',
		DATA_SOURCE = 'nyc_taxi_data_row',
        FORMAT = 'CSV',
		PARSER_VERSION = '2.0',
        FIELDTERMINATOR=',',
        ROWTERMINATOR='\n'
    )WITH(
        Borough VARCHAR(15) 2,
        Zone VARCHAR(50) 3,
        service_zone VARCHAR(15) 4
    ) AS [result]



