<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

echo "Inicio<br>";

$conn = new mysqli(
    "lab-db.cwrln6b3dhug.us-east-1.rds.amazonaws.com",
    "admin",
    "Tec147-.",
    "transporte_lab",
    3306
);

if ($conn->connect_error) {
    die("Error conexión: " . $conn->connect_error);
}

$conn->set_charset("utf8mb4");

echo "Conectado a RDS<br><br>";

// QUERY
$sql = "SELECT 
    e.id_envio,
    c.nombre AS cliente,
    v.tipo AS vehiculo,
    r.origen,
    r.destino,
    e.estado
FROM envios e
JOIN clientes c ON e.id_cliente = c.id_cliente
JOIN vehiculos v ON e.id_vehiculo = v.id_vehiculo
JOIN rutas r ON e.id_ruta = r.id_ruta;";

$result = $conn->query($sql);

if (!$result) {
    die("Error en query: " . $conn->error);
}

// RESULTADOS
while($row = $result->fetch_assoc()) {
    echo $row["cliente"] . " - " . $row["estado"] . "<br>";
}

$conn->close();
?>