<?php 
    $servername = "127.0.0.1";
    $username = "root";
    $passwords = "";
    $dbname = "database";
    @$conn = new mysqli($servername, $username, $passwords, $dbname);
    @mysqli_set_charset($conn,"utf8");
?>