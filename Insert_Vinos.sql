USE [VinosDenominaciones]
GO

INSERT INTO [dbo].[VinosGeneral]
           ([id]
           ,[Nombre]
           ,[Cosecha]
           ,[TipoEdadID]
           ,[TipoAzucarID]
           ,[ColorID]
           ,[Espumoso]
           ,[Varietal]
           ,[DenominID])
     VALUES
           (1
           ,'Ramón Bilbao'
           ,'2011'
           ,1
           ,2
           ,3
           ,0
           ,1
           ,2),

		   (2
           ,'Castillo Peñalver'
           ,'2010'
           ,2
           ,3
           ,2
           ,0
           ,1
           ,3),

		   (3
           ,'Muga'
           ,'2012'
           ,1
           ,3
           ,3
           ,1
           ,0
           ,3),

		   (4
           ,'Izadi'
           ,'2015'
           ,2
           ,3
           ,3
           ,1
           ,1
           ,1),

           (5
           ,'Pago de Carraovejas'
           ,'2016'
           ,4
           ,4
           ,3
           ,0
           ,0
           ,2)

GO

SELECT*FROM VinosDenominaciones.dbo.VinosGeneral;

-- DELETE FROM VinosDenominaciones.dbo.VinosGeneral;