## PHP實作之動態網頁淺談

- ### GET
  - ```user``` **前往用戶資料**
  -  ```manager``` **前往程式管理**
  - ```notfication``` **前往警訊通知**
  - ```debug``` **前往錯誤排解**
- ### SESSION
  - ```user``` **帳號**
  - ```nick``` **暱稱**
  - ```email``` **信箱**
  - ```url``` **個人專案檢視網址**
  - ```Record``` **紀錄**
  - ```GM``` **管理員**
  - ```reg_ip``` **註冊IP**
  - ```reg_date``` **註冊時間**
  - ```update_date``` **更新時間**

### 系統功能
#### 登入註冊系統
```php
<?php
    @$email = $_POST["email"];
    @$user = $_POST["user"];
    @$ps = $_POST["ps"];
    @$nick = $_POST["nick"];
    @$url = $_POST["user"];
    @$rps = $_POST["rps"];
    if(!empty($_SERVER['HTTP_CLIENT_IP'])){
        $myip = $_SERVER['HTTP_CLIENT_IP'];
    }else if(!empty($_SERVER['HTTP_X_FORWARDED_FOR'])){
        $myip = $_SERVER['HTTP_X_FORWARDED_FOR'];
    }else{
        $myip= $_SERVER['REMOTE_ADDR'];
    }
    if($myip == "::1"){
        $myip = "127.0.0.1";
    }
    $today = date("Y-m-d H:i:s"); 
    if(@$_POST["auth"] == "register"){
        if(@$email != null AND $user != null AND $ps == $rps AND $ps != null AND $rps != null AND $nick != null AND $url != null){
            @$sql = "INSERT INTO `username`(`user`, `nick`, `password`, `email`, `profile_url`, `Record`, `GM`, `reg_ip`, `reg_date`) VALUES ('$user', '$nick', '$ps', '$email', '$url', '0', 'false', '$myip', '$today')";
            if ($conn->query($sql) === TRUE) {
                echo "<h1>建立帳號成功</h1>";
                $html = 'user/'.@$_SESSION['user'].'.json';
                $file = fopen($html,'w');
                fwrite($file,'{'."\n");
                fwrite($file,'  "user":"'.@$_SESSION['user'].'",'."\n");
                fwrite($file,'  "email":"'.@$_SESSION['email'].'",'."\n");
                fwrite($file,'  "nick":"'.@$_SESSION['nick'].'",'."\n");
                fwrite($file,'  "profile_url":"'.@$_SESSION['url'].'",'."\n");
                fwrite($file,'  "reg_date":"'.@$_SESSION['reg_date'].'",'."\n");
                fwrite($file,'  "update_date":"'.@$_SESSION['update_date'].'"'."\n");
                fwrite($file,'}'."\n");
                fclose($file);
                unset($sql);
                @$sql = "INSERT INTO `crash-log`(`user`, `message`, `source`, `backup`, `GM`, `reg_ip`, `reg_date`) VALUES ('$user','成功註冊會員:[$user]','Register','false','false','$myip','$today')";
                $conn->query($sql);
                $conn->close();
                header('refresh:0;url="index.php"');
            }else{
                echo "Error: " . $sql . "<br>" . $conn->error;
                echo "<h1>錯誤</h1>";
                unset($_POST["email"]);
                unset($_POST["nick"]);
                unset($_POST["user"]);
                unset($_POST["ps"]);
                unset($_POST["rps"]);
                unset($_POST["url"]);
                unset($_POST["auth"]);
                header('refresh:2;url="index.php"');
            }
        }else{
            echo "<h1>資料錯誤</h1>";
            if($email == null){
                echo "信箱:錯誤<br>";
            }
            if($user == null){
                echo "帳號:錯誤<br>";
            }
            if($ps == null){
                echo "密碼:錯誤<br>";
            }
            if($rps == null){
                echo "重複密碼:錯誤<br>";
            }
            if($nick == null){
                echo "名稱:錯誤<br>";
            }
            if($url == null){
                echo "個人網址:錯誤<br>";
            }
            header('refresh:2;url="index.php"');
        }
    }elseif(@$_POST["auth"] == "login"){
        $sqls = "SELECT * FROM username where user = '$user'";
        $result = mysqli_query($conn,$sqls);
        @$row = mysqli_fetch_row($result);
        $_SESSION['user'] = $row[1];
        if($user != $row[1] AND $ps === $row[3]){
            echo "<h1>登入失敗</h1>";
            header('refresh:2;url="index.php"');
        }elseif($user === $row[1] AND $ps != $row[3]){
            echo "<h1>登入失敗</h1>";
            header('refresh:2;url="index.php"');
        }elseif($user != null AND $user === $row[1] AND $ps === $row[3]){
            echo "<h1>登入成功</h1>";
            $_SESSION['user'] = $row[1];
            $_SESSION['nick'] = $row[2];
            $_SESSION['email'] = $row[4];
            $_SESSION['url'] = $row[5];
            $_SESSION['Record'] = $row[6];
            $_SESSION['GM'] = $row[7];
            $_SESSION['reg_ip'] = $row[8];
            $_SESSION['reg_date'] = $row[9];
            $_SESSION['update_date'] = $row[10];
            $html = 'user/'.@$_SESSION['user'].'.json';
            $file = fopen($html,'w');
            fwrite($file,'{'."\n");
            fwrite($file,'  "user":"'.@$_SESSION['user'].'",'."\n");
            fwrite($file,'  "email":"'.@$_SESSION['email'].'",'."\n");
            fwrite($file,'  "nick":"'.@$_SESSION['nick'].'",'."\n");
            fwrite($file,'  "profile_url":"'.@$_SESSION['url'].'",'."\n");
            fwrite($file,'  "reg_date":"'.@$_SESSION['reg_date'].'",'."\n");
            fwrite($file,'  "update_date":"'.@$_SESSION['update_date'].'"'."\n");
            fwrite($file,'}'."\n");
            fclose($file);
            $user = @$_SESSION['user'];
            @$sql = "INSERT INTO `crash-log`(`user`, `message`, `source`, `backup`, `GM`, `reg_ip`, `reg_date`) VALUES ('$user','登入成功','Login','false','false','$myip','$today')";
            $conn->query($sql);
            $conn->close();
            header('refresh:0;url="index.php"');
        }else{
            echo "<h1>登入失敗</h1>";
            header('refresh:2;url="index.php"');
        }
?>
```
#### 登出系統

```php
<?php
    if(@$_GET["auth"] == "logout"){
        $user = @$_SESSION['user'];
        @$sql = "INSERT INTO `crash-log`(`user`, `message`, `source`, `backup`, `GM`, `reg_ip`, `reg_date`) VALUES ('$user','登出成功','Logout','false','false','$myip','$today')";
        $conn->query($sql);
        unset($_SESSION['user']);
        unset($_SESSION['nick']);
        unset($_SESSION['email']);
        unset($_SESSION['url']);
        unset($_SESSION['Record']);
        unset($_SESSION['GM']);
        unset($_SESSION['reg_ip']);
        unset($_SESSION['reg_date']);
        unset($_SESSION['update_date']);
        header('refresh:0;url="index.php"');
    }
?>
```

### 支援和聯絡

如果有遇到[問題](mailto:creamgod45@yun.sk)可以詢問，我會給予你相關的解答或更新。

