<?php
    require_once "DB.php";
    $db = new DB();
    $connection = $db->getConnection();
    $query = "SELECT * FROM festival";
    $statement = $connection->prepare($query);
    $statement->execute();
    $result = $statement->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($result);
?>