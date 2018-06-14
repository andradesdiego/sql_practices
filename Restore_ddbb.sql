/*
	What:			Restauración de BBDD
	Why:			Práctica de restauración por script
	Who:			Diego Andrades
	Creation Date:	19-Feb-2018
	Comment:		
*/

-- Con este comando vemos la ruta donde el creador de la bbdd alojó el fichero.
-- Nos sirve para obtener el "LogicalName" que usamos para la restauración.
RESTORE FILELISTONLY
	FROM DISK = 'C:\temp\AdventureWorks2017.bak';

-- Con este comando restauramos (creamos primero la carpeta log) la bbdd en la ruta especificada
-- Desde los "logicalNames" hasta "nuestrasRutas" 
RESTORE DATABASE AdventureWorks2017
	FROM DISK = 'C:\temp\AdventureWorks2017.bak'
	WITH MOVE 'AdventureWorks2017' TO 'C:\temp\AdventureWorks2017.mdf'
	, MOVE 'AdventureWorks2017_log' TO 'C:\temp\log\AdventureWorks2017_log.ldf'
	, STATS = 5;
;
