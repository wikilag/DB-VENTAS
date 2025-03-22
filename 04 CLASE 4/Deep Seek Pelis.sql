-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS pelisBigData;
USE pelisBigData;
 
-- Tabla: Tipo_Pelicula (géneros)
CREATE TABLE Tipo_Pelicula (
    id_tipo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
-- Tabla: Pelicula
CREATE TABLE Pelicula (
    id_pelicula INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    id_tipo INT NOT NULL,
    FOREIGN KEY (id_tipo) REFERENCES Tipo_Pelicula(id_tipo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
-- Tabla: Actor
CREATE TABLE Actor (
    id_actor INT PRIMARY KEY AUTO_INCREMENT,
    nombre_artistico VARCHAR(100) NOT NULL,
    nombre_real VARCHAR(100) NOT NULL,
    fecha_nac DATE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
-- Tabla Intermedia: Pelicula_Actor (relación muchos-a-muchos)
CREATE TABLE Pelicula_Actor (
    id_pelicula INT NOT NULL,
    id_actor INT NOT NULL,
    PRIMARY KEY (id_pelicula, id_actor),
    FOREIGN KEY (id_pelicula) REFERENCES Pelicula(id_pelicula),
    FOREIGN KEY (id_actor) REFERENCES Actor(id_actor)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
-- Tabla: Cliente
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    direccion VARCHAR(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
-- Tabla: Alquiler (transacciones)
CREATE TABLE Alquiler (
    id_alquiler INT PRIMARY KEY AUTO_INCREMENT,
    id_pelicula INT NOT NULL,
    id_cliente INT NOT NULL,
    fecha_alquiler DATE NOT NULL,
    fecha_devolucion DATE NOT NULL,
    FOREIGN KEY (id_pelicula) REFERENCES Pelicula(id_pelicula),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
-- Inserción de datos de ejemplo (10 registros por tabla)
INSERT INTO Tipo_Pelicula (nombre) VALUES
('Acción'), ('Comedia'), ('Drama'), ('Ciencia Ficción'), ('Terror');
 
INSERT INTO Pelicula (titulo, id_tipo) VALUES
('Matrix', 1),
('Superbad', 2),
('Inception', 4),
('El Padrino', 3),
('Jurassic Park', 1),
('Titanic', 3),
('Star Wars', 4),
('Scream', 5),
('Forrest Gump', 3),
('Avengers', 1);
 
INSERT INTO Actor (nombre_artistico, nombre_real, fecha_nac) VALUES
('Keanu Reeves', 'Keanu Charles Reeves', '1964-09-02'),
('Jonah Hill', 'Jonah Hill Feldstein', '1983-12-20'),
('Leonardo DiCaprio', 'Leonardo Wilhelm DiCaprio', '1974-11-11'),
('Marlon Brando', 'Marlon Brando Jr.', '1924-04-03'),
('Laura Dern', 'Laura Elizabeth Dern', '1967-02-10');
 
INSERT INTO Pelicula_Actor (id_pelicula, id_actor) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);
 
INSERT INTO Cliente (nombre, apellido, telefono, direccion) VALUES
('Juan', 'Pérez', '3001234567', 'Calle 80 #72-15'),
('María', 'Gómez', '3102345678', 'Carrera 73 #12-34'),
('Carlos', 'López', '3203456789', 'Avenida 68 #45-67');
 
INSERT INTO Alquiler (id_pelicula, id_cliente, fecha_alquiler, fecha_devolucion) VALUES
(1, 1, '2023-10-01', '2023-10-05'),
(2, 2, '2023-10-02', '2023-10-06'),
(3, 3, '2023-10-03', '2023-10-07');

--Prueba de datos
