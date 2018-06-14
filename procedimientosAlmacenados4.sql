/*
	What:			Procedimientos almacenados
	Why:			Stored Procedures
	Who:			Diego Andrades
	Creation Date:	12-Mar-2018
	Comment:		. 
*/

USE AdventureWorks2017;
GO

CREATE PROCEDURE HumanResources.PrintNames
 AS
 BEGIN 
	SELECT name FROM Purchasing.Vendor;

END