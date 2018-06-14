/*
	What:			TRIGGERS
	Why:			Ejecución TRIGGERS
	Who:			Diego Andrades
	Creation Date:	23-Mar-2018
	Comment:		. 
*/

USE TriggerEjemplos;
GO

SELECT * FROM dbo.Nominas;
SELECT * FROM dbo.NominasLog;

EXECUTE dbo.trg_DML_Nominas @NIFempleado = '74500600P'
							, @SalarioBase = 1000
							, @IRPF = 21
							, @Fecha = '20180323';


