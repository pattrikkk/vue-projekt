<?php
require_once "DB.php";
$db = new DB();
$connection = $db->getConnection();

$query = "SELECT f.*, i.id as interpret_id FROM festival f LEFT JOIN interpret i ON f.id = i.festival_id";
$statement = $connection->prepare($query);
$statement->execute();
$result = $statement->fetchAll(PDO::FETCH_ASSOC);

$organizedResult = [];
foreach ($result as $row) {
    $festivalId = $row['id'];
    
    if (!isset($organizedResult[$festivalId])) {
        // Create a new entry for the festival
        $organizedResult[$festivalId] = [
            'id' => $row['id'],
            'name' => $row['name'],
            'date_from' => $row['date_from'],
            'date_to' => $row['date_to'],
            'price' => $row['price'],
            'country' => $row['country'],
            'city' => $row['city'],
            'street' => $row['street'],
            'st_number' => $row['st_number'],
            'description' => $row['description'],
            'web' => $row['web'],
            'location' => $row['location'],
            'interprets' => [],
        ];
    }

    // Add stage information to the festival
    if ($row['stage_id'] !== null) {
        $organizedResult[$festivalId]['stages'][] = [
            'id' => $row['stage_id'],
            'name' => $row['stage_name'],
        ];
    }
}

// Convert the associative array to JSON
$jsonResult = json_encode(array_values($organizedResult));
echo $jsonResult;
?>