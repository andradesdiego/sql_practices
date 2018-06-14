/*
	What:			TRIGGERS
	Why:			Storage Procedure
	Who:			Diego Andrades
	Creation Date:	23-Mar-2018
	Comment:		. 
*/

USE TriggerEjemplos;
GO

CREATE PROCEDURE dbo.usp_AddNomina (
	@NIFempleado CHAR(9)
	, @SalarioBase DECIMAL(10,3)
	, @IRPF DECIMAL(5,3)
	, @Fecha DATE
)
AS
BEGIN 
	INSERT INTO dbo.Nominas (
	NIFempleado
	, SalarioBase
	, IRPF
	, Fecha
	) 
	VALUES (
	@NIFempleado
	, @SalarioBase
	, @IRPF
	, @Fecha
	);
END

