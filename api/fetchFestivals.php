<?php
    require_once "DB.php";
    $db = new DB();
    $connection = $db->getConnection();
    $query = "SELECT * FROM festival";
    $statement = $connection->prepare($query);
    $statement->execute();
    $result = $statement->fetchAll(PDO::FETCH_ASSOC);

    foreach ($result as $key => $value) {
        $query = "SELECT * FROM musician WHERE id IN (SELECT musician_id FROM festival_musician WHERE festival_id = :id)";
        $statement = $connection->prepare($query);
        $statement->bindParam(":id", $value["id"]);
        $statement->execute();
        $musicians = $statement->fetchAll(PDO::FETCH_ASSOC);
        $result[$key]["musicians"] = $musicians;
    }
    echo json_encode($result);
?>