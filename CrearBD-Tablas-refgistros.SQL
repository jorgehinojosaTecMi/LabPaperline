-- Crear base de datos
CREATE DATABASE IF NOT EXISTS transporte_lab;
USE transporte_lab;

-- Tabla de clientes
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    telefono VARCHAR(20),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de vehículos
CREATE TABLE IF NOT EXISTS vehiculos (
    id_vehiculo INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50),
    placa VARCHAR(20),
    capacidad INT,
    estado VARCHAR(50)
);

-- Tabla de rutas
CREATE TABLE IF NOT EXISTS rutas (
    id_ruta INT AUTO_INCREMENT PRIMARY KEY,
    origen VARCHAR(100),
    destino VARCHAR(100),
    distancia_km INT
);

-- Tabla de envíos
CREATE TABLE IF NOT EXISTS envios (
    id_envio INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_vehiculo INT,
    id_ruta INT,
    fecha_envio DATE,
    estado VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo),
    FOREIGN KEY (id_ruta) REFERENCES rutas(id_ruta)
);

-- Insertar clientes
INSERT INTO clientes (nombre, email, telefono) VALUES
('Juan Pérez', 'juan@mail.com', '555-1234'),
('María López', 'maria@mail.com', '555-5678'),
('Carlos Sánchez', 'carlos@mail.com', '555-8765');

-- Insertar vehículos
INSERT INTO vehiculos (tipo, placa, capacidad, estado) VALUES
('Camión', 'ABC-123', 1000, 'Disponible'),
('Van', 'XYZ-789', 500, 'En ruta'),
('Tráiler', 'LMN-456', 2000, 'Mantenimiento');

-- Insertar rutas
INSERT INTO rutas (origen, destino, distancia_km) VALUES
('CDMX', 'Guadalajara', 550),
('Toluca', 'Monterrey', 900),
('Puebla', 'Cancún', 1600);

-- Insertar envíos
INSERT INTO envios (id_cliente, id_vehiculo, id_ruta, fecha_envio, estado) VALUES
(1, 1, 1, '2026-04-20', 'Entregado'),
(2, 2, 2, '2026-04-21', 'En tránsito'),
(3, 1, 3, '2026-04-22', 'Pendiente');

-- Consulta de prueba (JOIN)
SELECT 
    e.id_envio,
    c.nombre AS cliente,
    v.tipo AS vehiculo,
    r.origen,
    r.destino,
    e.estado
FROM envios e
JOIN clientes c ON e.id_cliente = c.id_cliente
JOIN vehiculos v ON e.id_vehiculo = v.id_vehiculo
JOIN rutas r ON e.id_ruta = r.id_ruta;