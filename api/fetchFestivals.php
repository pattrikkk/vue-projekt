<?php
    require_once "DB.php";
    $db = new DB();
    $connection = $db->getConnection();
    $query = "SELECT * FROM festival";
    $statement = $connection->prepare($query);
    $statement->execute();
    $result = $statement->fetchAll(PDO::FETCH_ASSOC);

    foreach ($result as $key => $value) {
        $query = "SELECT * FROM interpret WHERE id IN (SELECT interpret_id FROM festival_interpret WHERE festival_id = :id)";
        $statement = $connection->prepare($query);
        $statement->bindParam(":id", $value["id"]);
        $statement->execute();
        $interprets = $statement->fetchAll(PDO::FETCH_ASSOC);
        $result[$key]["interprets"] = $interprets;
    }
    echo json_encode($result);
?>