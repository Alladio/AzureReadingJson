SELECT TOP 100
    jsonContent
/* --> place the keys that you see in JSON documents in the WITH clause:
       , JSON_VALUE (jsonContent, '$.key1') AS header1
       , JSON_VALUE (jsonContent, '$.key2') AS header2
*/
FROM
    OPENROWSET(
        BULK 'https://datalakealladio1.dfs.core.windows.net/datacontainer/raw/log.json',
        FORMAT = 'CSV',
        FIELDQUOTE = '0x0b',
        FIELDTERMINATOR ='0x0b',
        ROWTERMINATOR = '0x0a'
    )
    WITH (
        jsonContent varchar(MAX)
    ) AS [result]
