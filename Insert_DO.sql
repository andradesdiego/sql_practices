/*
	What:			Inserci�n de registros en la tabla de D.O.
	Why:			Lanzamiento proyecto Vinos y Denominaciones
	Who:			Diego Andrades
	Creation Date:	09-Feb-2018
	Comment:		 
*/

USE [VinosDenominaciones]
GO

INSERT INTO [dbo].[Denominaciones]
           ([id]
           ,[Nombre]
           ,[Descripcion]
           ,[F_creacion]
           ,[D_protegida]
           ,[PaisID])
     VALUES
           (1
           ,'D.O. Ribera del Duero'
           ,'Comarca de Le�n'
           ,'1995'
           ,1
           ,1),

		    (2
           ,'D.O. Rioja'
           ,'Alrededores de Logro�o'
           ,'1976'
           ,1
           ,1),

		    (3
           ,'D.O. Sierras de M�laga'
           ,'Serran�a de Ronda, Axarqu�a y comarcas varias'
           ,'2001'
           ,1
           ,1)
GO

SELECT*FROM VinosDenominaciones.dbo.Denominaciones;


