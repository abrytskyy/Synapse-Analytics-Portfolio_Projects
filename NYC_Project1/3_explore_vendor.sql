--Read data using external data source from vendor.csv

--without quatation in csv file in vendor_name Creative Mobile Technologies, LLC. Result - Creative Mobile Technologies 
SELECT
    *
FROM
    OPENROWSET(
        BULK 'vendor_unquoted.csv',
	DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'CSV',
        HEADER_ROW = TRUE,
	PARSER_VERSION = '2.0',
        FIELDTERMINATOR=',',
        ROWTERMINATOR='\n',
	FIELDQUOTE='"'
    ) AS [result]

--with quatation in csv file in vendor_name "Creative Mobile Technologies, LLC". Result - Creative Mobile Technologies, LLC
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
