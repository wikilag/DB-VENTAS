
-- Crear la base de datos
CREATE DATABASE SistemaAlquiler;
USE SistemaAlquiler;

-- Crear tabla Formato_Cassette
CREATE TABLE Formato_Cassette (
    Cod_Formato INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Formato VARCHAR(50) NOT NULL
);

-- Crear tabla Cassette
CREATE TABLE Cassette (
    Cod_Cassette INT AUTO_INCREMENT PRIMARY KEY,
    Cod_Pelicula INT NOT NULL,
    Cod_Formato INT NOT NULL,
    FOREIGN KEY (Cod_Pelicula) REFERENCES Peliculas(Cod_Pelicula),
    FOREIGN KEY (Cod_Formato) REFERENCES Formato_Cassette(Cod_Formato)
);

-- Crear tabla Tipo_Pelicula
CREATE TABLE Tipo_Pelicula (
    Cod_Tipo INT AUTO_INCREMENT PRIMARY KEY,
    Genero VARCHAR(50) NOT NULL
);

-- Crear tabla Peliculas
CREATE TABLE Peliculas (
    Cod_Pelicula INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(100) NOT NULL,
    Cod_Tipo INT NOT NULL,
    FOREIGN KEY (Cod_Tipo) REFERENCES Tipo_Pelicula(Cod_Tipo)
);

-- Crear tabla Actor
CREATE TABLE Actor (
    Cod_Actor INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Corto VARCHAR(50) NOT NULL,
    Nombre_Real VARCHAR(100) NOT NULL,
    Fecha_Nac DATE
);

-- Crear tabla Peli_Actor (Relación muchos a muchos)
CREATE TABLE Peli_Actor (
    Cod_Pelicula INT NOT NULL,
    Cod_Actor INT NOT NULL,
    PRIMARY KEY (Cod_Pelicula, Cod_Actor),
    FOREIGN KEY (Cod_Pelicula) REFERENCES Peliculas(Cod_Pelicula),
    FOREIGN KEY (Cod_Actor) REFERENCES Actor(Cod_Actor)
);

-- Crear tabla Clientes
CREATE TABLE Clientes (
    Cod_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Telefono VARCHAR(20),
    Direccion VARCHAR(100)
);

-- Crear tabla Alquiler
CREATE TABLE Alquiler (
    Cod_Alquiler INT AUTO_INCREMENT PRIMARY KEY,
    Cod_Cliente INT NOT NULL,
    Fecha_Alquiler DATE NOT NULL,
    Fecha_Devolucion DATE,
    Estado_Alquiler ENUM('Activo', 'Devuelto', 'Retrasado') DEFAULT 'Activo',
    FOREIGN KEY (Cod_Cliente) REFERENCES Clientes(Cod_Cliente)
);

-- Crear tabla Cassette_Alquiler (Relación muchos a muchos)
CREATE TABLE Cassette_Alquiler (
    Cod_Cassette INT NOT NULL,
    Cod_Alquiler INT NOT NULL,
    PRIMARY KEY (Cod_Cassette, Cod_Alquiler),
    FOREIGN KEY (Cod_Cassette) REFERENCES Cassette(Cod_Cassette),
    FOREIGN KEY (Cod_Alquiler) REFERENCES Alquiler(Cod_Alquiler)
);

-- Crear índices para optimizar consultas
CREATE INDEX idx_Cod_Pelicula ON Cassette (Cod_Pelicula);
CREATE INDEX idx_Cod_Formato ON Cassette (Cod_Formato);
CREATE INDEX idx_Cod_Tipo ON Peliculas (Cod_Tipo);
CREATE INDEX idx_Cod_Cliente ON Alquiler (Cod_Cliente);


--Esta es una prueba de merge