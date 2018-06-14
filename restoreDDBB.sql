USE [master]
GO

RESTORE DATABASE [AdventureWorks2017] 
	FROM  DISK = N'C:\temp\AdventureWorks2017.bak' 
	WITH  MOVE N'AdventureWorks2017' TO N'C:\temp\AdventureWorks2017.mdf'
		, MOVE N'AdventureWorks2017_log' TO N'C:\temp\AdventureWorks2017_log.ldf'
		,  STATS = 5;

GO

USE [AdventureWorks2017] 
GO
SELECT *
	FROM HumanResources.Employee
	