DECLARE @datetime2_2 DATETIME2(2) = GETDATE();

DECLARE @datetime2 DATETIME2 = GETDATE();

DECLARE @datetime2_7 DATETIME2(7) = GETDATE();

DECLARE @datetime2_4 DATETIME2(4) = GETDATE();

SELECT @datetime2_2 AS 'datetime2_2'
	, DATALENGTH (@datetime2_2) AS 'bytes'
	, @datetime2 AS 'datetime2'
	, DATALENGTH (@datetime2) AS 'bytes'
	, @datetime2_7 AS 'datetime2_7'
	, DATALENGTH (@datetime2_7) AS 'bytes'
	, @datetime2_4 AS 'datetime2_4'
	, DATALENGTH (@datetime2_4) AS 'bytes';


