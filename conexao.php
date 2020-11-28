<?php
  $server = "localhost";
  $user = "root";
  $password = "";
  $database = "bd_mr_health";

  $conect = mysqli_connect($server, $user, $password, $database);
  
  if(!$conect){
    die("Conexão falhou: " . mysqli_connect_error());
  }
?>
