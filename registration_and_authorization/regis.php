<?php
session_start();
if (!empty($_SESSION['role'])) {
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
            <h1>Регистрация</h1>
            <a class="close--three" href='../../index.php'>&#x2715</a>

            <div class="col-3">
                <input type="text" class="effect-1" name="name" id="" placeholder="ФИО" required>
                <span class="focus-border"></span>
            </div>
            <div class="col-3">
                <input type="text" class="effect-1" name="name" id="" placeholder="Логин" required>
                <span class="focus-border"></span>
            </div>
            <div class="col-3">
                <input type="tel" class="effect-1" name="phone" id="" placeholder="Телефон" required>
                <span class="focus-border"></span>
            </div>
            <div class="col-3">
                <input type="password" class="effect-1" name="password" placeholder="Пароль" id="" required>
                <span class="focus-border"></span>
            </div>
            <div class="col-3">
                <input type="password" class="effect-1" name="second_password" placeholder="Подтвердите пароль" id="" required>
                <span class="focus-border"></span>
            </div>
            <div class="btns">
                <input type="submit" name='btn' value="Регистрация">
                <a href="avtor.php"><span>Авторизация</span></a>
            </div>
            <?php
            include("../../connect/connect.php");
            if (isset($_POST['btn'])) {
                $name = $_POST['name'];
                $phone = $_POST['phone'];
                $password = md5($_POST['password']);
                $found_censored_word = false;
                if (preg_match("/[a-zA-Z]+/", $name)) {
                    $sql = mysqli_query($link, "SELECT * FROM users where name='$name'");
                    if (mysqli_num_rows($sql) == 1) {
                        echo "<p class='error' >Логин уже существует</p>";
                    } else {
                        if ($_POST['password'] == $_POST['second_password']) {
                            $add = mysqli_query($link, "INSERT INTO users(name,password,phone,profile_picture) values('$name','$password',$phone,'profile_3.jpg')");
                            header('location:avtor.php');
                        } else {
                            echo "<p class='error'>Не верный пароль</p>";
                        }
                    }
                } else {
                    echo "<p class='error'>Введите латинские символы в логине</p>";
                }
            }

            ?>
        </form>
    </div>

</body>

</html>