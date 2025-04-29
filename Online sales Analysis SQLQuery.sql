USE SalesAnalysis;
GO

--  Drop & re-create empty staging table
IF OBJECT_ID('dbo.sales_data_raw','U') IS NOT NULL
    DROP TABLE dbo.sales_data_raw;
GO
CREATE TABLE dbo.sales_data_raw (
    Customer_id    INT,
    Age            INT,
    Gender         TINYINT,
    Revenue_Total  FLOAT,
    N_Purchases    INT,
    Purchase_DATE  VARCHAR(20),   -- e.g. '22.06.21'
    Purchase_VALUE FLOAT,
    Pay_Method     TINYINT,
    Time_Spent     INT,
    Browser        TINYINT,
    Newsletter     TINYINT,
    Voucher        TINYINT
);
GO

--  Bulk load your CSV 
BULK INSERT dbo.sales_data_raw
FROM 'D:\Online Shop Customer Sales Data.csv'
WITH
(
  FIRSTROW     = 2,            -- skip header
  FIELDTERMINATOR = ',',       -- CSV delimiter
  ROWTERMINATOR   = '\n',      
  TABLOCK
);
GO

--  Quick sanity check: you should see >0 rows
SELECT COUNT(*) AS rows_loaded
FROM dbo.sales_data_raw;
GO

--  Sales Trend analysis:
SELECT
    YEAR(CONVERT(date, Purchase_DATE, 3))  AS order_year,
    MONTH(CONVERT(date, Purchase_DATE, 3)) AS order_month,
    SUM(Purchase_VALUE)                    AS total_revenue,
    COUNT(DISTINCT 
          CONCAT(
            CONVERT(varchar(10), 
                    CONVERT(date, Purchase_DATE, 3), 120
                   ),
            '_',
            Customer_id
          )
    )                                      AS total_orders
FROM
    dbo.sales_data_raw
WHERE
    CONVERT(date, Purchase_DATE, 3)
      BETWEEN '2021-01-01' AND '2021-12-31'
GROUP BY
    YEAR(CONVERT(date, Purchase_DATE, 3)),
    MONTH(CONVERT(date, Purchase_DATE, 3))
ORDER BY
    YEAR(CONVERT(date, Purchase_DATE, 3)),
    MONTH(CONVERT(date, Purchase_DATE, 3));
GO
