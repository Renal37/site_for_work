<?php
session_start(); 
if (!empty($_SESSION['role'])){
    header('location:../../index.php');
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/regis.css">
    
</head>
<body>
    <div class="form">
    <form class='reg' method="post">
        <h1>Авторизация</h1>
        <a class="close--three" href='../../index.php'>&#x2715</a>
        <div class="col-3">
        <input type="text" class="effect-1" name="login" id=""placeholder="Логин" required>
              <span class="focus-border"></span>
          </div>
          <div class="col-3">
          <input type="password" class="effect-1" name="password" placeholder="Пароль"id="" required>
              <span class="focus-border"></span>
          </div>
       
        <div class="btns">
        <input type="submit" name='btn' value="Авторизация">
        <a href="regis.php"><span>Регистрация</span></a>
        </div>
        <?php
        include('../../connect/connect.php');
        if(isset($_POST['btn'])){
            $login = $_POST['login'];
            $password = md5($_POST['password']);
            $query = "SELECT * from users where login ='$login' and password ='$password'";
            $add = $link-> query($query);
            if(mysqli_num_rows($add)==1){
                foreach($add as $row){
                $_SESSION['user_id'] = $row['user_id'];
                $_SESSION['role'] = $row['role'];
                $_SESSION['login'] = $row['login'];
                header('location:../../index.php');
                }
            }else{
                echo '<p class="error">Ошибочные данные</p>';
            }
        }
        ?>
    </form>
    </div>
</body>
</html>