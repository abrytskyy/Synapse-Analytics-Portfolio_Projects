--Read data using external data source from vendor.csv
SELECT
    *
FROM
    OPENROWSET(
        BULK 'vendor_unquoted.csv',
		DATA_SOURCE = 'nyc_taxi_data',
        FORMAT = 'CSV',
        HEADER_ROW = TRUE,
		PARSER_VERSION = '2.0',
        FIELDTERMINATOR=',',
        ROWTERMINATOR='\n',
		FIELDQUOTE='"'
    ) AS [result]
	
SELECT
    *
FROM
    OPENROWSET(
        BULK 'vendor.csv',
		DATA_SOURCE = 'nyc_taxi_data',
        FORMAT = 'CSV',
        HEADER_ROW = TRUE,
		PARSER_VERSION = '2.0',
        FIELDTERMINATOR=',',
        ROWTERMINATOR='\n',
		FIELDQUOTE='"'
    ) AS [result]