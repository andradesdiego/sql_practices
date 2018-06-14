<?php
$serverName = "http://localhost/A1012"; //serverName\instanceName
$connectionInfo = array( "Database"=>"VinosDenominaciones", "UID"=>"appLogin", "PWD"=>"1234");
$conn = sqlsrv_connect( $serverName, $connectionInfo);

if( $conn ) {
     echo "Connection established.<br />";
}else{
     echo "Connection could not be established.<br />";
     die( print_r( sqlsrv_errors(), true));
}


?>