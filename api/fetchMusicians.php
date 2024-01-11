<?php
    require_once "DB.php";
    $db = new DB();
    $connection = $db->getConnection();
    $query = "SELECT * FROM musician";
    $statement = $connection->prepare($query);
    $statement->execute();
    $result = $statement->fetchAll(PDO::FETCH_ASSOC);
    foreach ($result as $key => $value) {
        $query = "SELECT * FROM festival WHERE id IN (SELECT festival_id FROM festival_musician WHERE musician_id = :id)";
        $statement = $connection->prepare($query);
        $statement->bindParam(":id", $value["id"]);
        $statement->execute();
        $festivals = $statement->fetchAll(PDO::FETCH_ASSOC);
        $result[$key]["festivals"] = $festivals;
    }
    echo json_encode($result);
?>