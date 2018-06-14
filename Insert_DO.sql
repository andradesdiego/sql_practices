/*
	What:			Inserción de registros en la tabla de D.O.
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
           ,'Comarca de León'
           ,'1995'
           ,1
           ,1),

		    (2
           ,'D.O. Rioja'
           ,'Alrededores de Logroño'
           ,'1976'
           ,1
           ,1),

		    (3
           ,'D.O. Sierras de Málaga'
           ,'Serranía de Ronda, Axarquía y comarcas varias'
           ,'2001'
           ,1
           ,1)
GO

SELECT*FROM VinosDenominaciones.dbo.Denominaciones;


