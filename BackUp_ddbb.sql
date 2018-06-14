/*
	What:			Creación de backup
	Why:			Guardar una copia para exportar 
	Who:			Diego Andrades
	Creation Date:	19-Feb-2018
	Comment:		. 
*/

-- Asegurarse que existe la ruta donde queremos crear el archivo de backup.
-- Nombramos el backup con extensión .bak (Convención)
-- WITH STATS es opcional. Nos muestra el avance de la ejecución cada 5% conseguido.
BACKUP DATABASE [VinosDenominaciones]
	TO DISK = 'C:\temp\backups\VinosDenominaciones20180219.bak'
	WITH STATS = 5;
