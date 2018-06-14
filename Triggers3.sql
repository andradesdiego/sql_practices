/*
	What:			TRIGGERS
	Why:			Creación Trigger
	Who:			Diego Andrades
	Creation Date:	23-Mar-2018
	Comment:		. 
*/

USE TriggerEjemplos;
GO


CREATE TRIGGER dbo.trg_DML_Nominas 
	ON dbo.Nominas
	AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	-- Comprobamos si se está haciendo un INSERT
	IF EXISTS(SELECT 1 FROM inserted) AND NOT EXISTS(SELECT 1 FROM deleted)
	BEGIN
		INSERT INTO dbo.NominasLog (
									FechaOperacion
									, Usuario
									, NIFempleadoNuevo
									, SalarioBaseNuevo
									, IRPFNuevo
									, FechaNuevo
								)
			
					SELECT GETDATE()
							, USER_NAME() -- Usamos el usuario que está ejecutando tu bbdd. Es es usuario en el contexto de la operación.
							, inserted.NIFEmpleado
							, inserted.SalarioBase
							, inserted.IRPF
							, inserted.Fecha
						FROM inserted;

	END
	ELSE
	
		BEGIN
			-- Comprobamos si se está haciendo un UPDATE
			IF EXISTS(SELECT 1 FROM inserted) AND EXISTS(SELECT 1 FROM deleted)
			BEGIN
				INSERT INTO dbo.NominasLog (
											, FechaOperacion 
											, Usuario
											, NIFempleadoAnterior
											, SalarioBaseAnterior
											, IRPFAnterior
											, FechaAnterior
											, NIFempleadoNuevo
											, SalarioBaseNuevo
											, IRPFNuevo
											, FechaNuevo
										)
			
							SELECT GETDATE()
									, USER_NAME() -- Usamos el usuario que está ejecutando tu bbdd. Es es usuario en el contexto de la operación.
									, deleted.NIFEmpleado
									, deleted.SalarioBase
									, deleted.IRPF
									, deleted.Fecha
									, inserted.NIFEmpleado
									, inserted.SalarioBase
									, inserted.IRPF
									, inserted.Fecha
								FROM inserted AS i
									INNER JOIN deleted AS d
									ON i.id = d.id;

			END
	
END


CREATE TRIGGER dbo.trg_AddNominas 
	ON dbo.Nominas
	AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	-- Comprobamos si se está haciendo un DELETE
	IF EXISTS(SELECT 1 FROM deleted) AND NOT EXISTS(SELECT 1 FROM inserted)
	BEGIN
		INSERT INTO dbo.NominasLog (
									FechaOperacion
									, Usuario
									, NIFempleadoAnterior
									, SalarioBaseAnterior
									, IRPFAnterior
									, FechaAnterior
								)
			
					SELECT GETDATE()
							, USER_NAME() -- Usamos el usuario que está ejecutando tu bbdd. Es es usuario en el contexto de la operación.
							, inserted.NIFEmpleado
							, inserted.SalarioBase
							, inserted.IRPF
							, inserted.Fecha
						FROM inserted;

	END
	
END

 