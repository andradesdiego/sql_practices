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
           (<id, int,>
           ,<Nombre, varchar(50),>
           ,<Cosecha, smallint,>
           ,<TipoEdadID, tinyint,>
           ,<TipoAzucarID, tinyint,>
           ,<ColorID, tinyint,>
           ,<Espumoso, bit,>
           ,<Varietal, bit,>
           ,<DenominID, smallint,>)

		   (<1, int,>
           ,<Castillo Peñalver, varchar(50),>
           ,<2010, smallint,>
           ,<TipoEdadID, tinyint,>
           ,<TipoAzucarID, tinyint,>
           ,<ColorID, tinyint,>
           ,<Espumoso, bit,>
           ,<Varietal, bit,>
           ,<DenominID, smallint,>)
GO

