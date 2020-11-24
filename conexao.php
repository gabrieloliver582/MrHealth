<?php
  $server = "localhost";
  $user = "root";
  $password = "root";
  $database = "proa";

  $conn = mysqli_connect($server, $user, $password, $database);
  
  if(!$conn){
    die("Conexão falhou: " . mysqli_connect_error());
  }
?>