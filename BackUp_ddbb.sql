/*
	What:			Creaci�n de backup
	Why:			Guardar una copia para exportar 
	Who:			Diego Andrades
	Creation Date:	19-Feb-2018
	Comment:		. 
*/

-- Asegurarse que existe la ruta donde queremos crear el archivo de backup.
-- Nombramos el backup con extensi�n .bak (Convenci�n)
-- WITH STATS es opcional. Nos muestra el avance de la ejecuci�n cada 5% conseguido.
BACKUP DATABASE [VinosDenominaciones]
	TO DISK = 'C:\temp\backups\VinosDenominaciones20180219.bak'
	WITH STATS = 5;
