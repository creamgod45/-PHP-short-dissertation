<?php ob_start(); @session_start(); include "sql/sql.inc.php"; date_default_timezone_set("Asia/Taipei"); ?>
<!DOCTYPE html>
<html>
    <head>  
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="Pragma" content="no-cache" />
        <meta http-equiv="Cache-Control" content="no-cache" />
        <meta http-equiv="Expires" content="0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="assets/css/main.css">
        <link rel="stylesheet" href="assets/css/github-card.css">
        <link rel="stylesheet" href="assets/css/bootstrap.css">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="shortcut icon" href="assets/images/airplay.ico" type="image/ico" />
    </head>
    
                <?php 
                    if(@$_SESSION['user'] != null and $_GET['id'] != 0){
                        $mo = $_GET['id'];
                        $user = $_SESSION['user'];
                        $sql = "SELECT * FROM `crash-log` WHERE `id` = '$mo'";
                        $result = mysqli_query($conn,$sql);
                        $row = mysqli_fetch_row($result);
                        echo '
                            <head><title>紀錄檢視器 # '.$_GET['id'].'</title></head>
                            <body class="bg-drakgray display-block">
                                <div class="border-s padding-16 margin-16 bg-white radius">
                                    <div class="media">
                                      <img class="mr-3 radius-100" src="assets/images/user.svg">
                                      <div class="media-body">
                                        <div class="flex"><h4 class="bold-bold jua fsize-18">'.$row[1].'</h4>&nbsp;&nbsp; - &nbsp;&nbsp;
                                        <h5 class="mt-0 MJ">紀錄檢視器 #  '.$_GET['id'].'</h5></div>
                                      </div>
                                    </div>
                                    <div class="list-group">
                                        <a href="javascript:void(0)" class="list-group-item list-group-item-action">來源：'.$row[3].'</a>
                                        <a href="javascript:void(0)" class="list-group-item list-group-item-action">詳細資訊：'.$row[2].'</a>
                                        <a href="javascript:void(0)" class="list-group-item list-group-item-action">管理員操作：'.$row[5].'</a>
                                        <a href="javascript:void(0)" class="list-group-item list-group-item-action">IP 紀錄：'.$row[6].'</a>
                                        <a href="javascript:void(0)" class="list-group-item list-group-item-action">接收時間：'.$row[7].'</a>
                                        <a href="javascript:void(0)" class="list-group-item list-group-item-action">更新時間：'.$row[8].'</a>
                                    </div>
                                </div>
                            </body>
                            ';
                    }else{
                        echo '<head><title>未知網頁</title></head>';
                        echo '<br><h1>&nbsp;&nbsp;404 Not Found</h1>';
                        echo "<script>window.opener=null;window.open('','_parent');window.close();</script>"."\r\n";
                    }
                ?>
            
</html>