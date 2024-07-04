<?php
$link = mysqli_connect("localhost","root","","APTUBE");
$result = mysqli_query($link, "SELECT * FROM censor");
$censor = array();
while ($row = mysqli_fetch_assoc($result)) {
    $censor[] = $row['censor_name'];
}
?>