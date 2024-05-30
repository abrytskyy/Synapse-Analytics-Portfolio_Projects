-- This is auto-generated code
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'https://dl0527.dfs.core.windows.net/nyc-taxi-data/raw/trip_data_green_parquet/year=2020/month=01/part-00000-tid-6133789922049958496-2e489315-890a-4453-ae93-a104be9a6f06-106-1-c000.snappy.parquet',
        FORMAT = 'CSV'
    ) AS [result]


USE nyc_taxi_discovery
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'trip_data_green_parquet/year=2020/month=01/part-00000-tid-6133789922049958496-2e489315-890a-4453-ae93-a104be9a6f06-106-1-c000.snappy.parquet',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'PARQUET',
        HEADER_ROW = TRUE
    ) AS [result]


EXEC sp_describe_first_result_set N'USE nyc_taxi_discovery
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK ''trip_data_green_parquet/year=2020/month=01/part-00000-tid-6133789922049958496-2e489315-890a-4453-ae93-a104be9a6f06-106-1-c000.snappy.parquet'',
        DATA_SOURCE = ''nyc_taxi_data_raw'',
        FORMAT = ''PARQUET'',
        HEADER_ROW = TRUE
    ) AS [result]
'


USE nyc_taxi_discovery
SELECT
    MAX(LEN(store_and_fwd_flag)) AS len_store_and_fwd_flag
FROM
    OPENROWSET(
        BULK 'trip_data_green_parquet/year=2020/month=01/part-00000-tid-6133789922049958496-2e489315-890a-4453-ae93-a104be9a6f06-106-1-c000.snappy.parquet',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'PARQUET',
        HEADER_ROW = TRUE
    ) AS [result]


USE nyc_taxi_discovery
SELECT
    [result].filename() as file_name,
    [result].filepath() as file_path
FROM
    OPENROWSET(
        BULK 'trip_data_green_parquet/year=2020/month=01/part-00000-tid-6133789922049958496-2e489315-890a-4453-ae93-a104be9a6f06-106-1-c000.snappy.parquet',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'PARQUET',
        HEADER_ROW = TRUE
    ) AS [result]
