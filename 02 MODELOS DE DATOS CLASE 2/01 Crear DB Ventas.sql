-- 1. Crear la Base de Datos

CREATE DATABASE VENTAS;

USE VENTAS;


-- 2. Crear la Tabla Cliente
CREATE TABLE Cliente (
    IdCliente INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    TipoDocumento VARCHAR(20) NOT NULL,
    NumeroDocumento VARCHAR(30) UNIQUE NOT NULL,
    Direccion VARCHAR(100),
    Telefono VARCHAR(20),
    CorreoElectronico VARCHAR(100) UNIQUE
);

-- 3. Crear la Tabla Categoria
CREATE TABLE Categoria (
    IdCategoria INT PRIMARY KEY,
    NombreCategoria VARCHAR(50) NOT NULL
);

-- 4. Crear la Tabla Articulo
CREATE TABLE Articulo (
    IdArticulo INT PRIMARY KEY,
    Descripcion VARCHAR(255) NOT NULL,
    ValorUnitario DECIMAL(10,2) NOT NULL,
    IdCategoria INT NOT NULL,
    CONSTRAINT FK_Articulo_Categoria FOREIGN KEY (IdCategoria) REFERENCES Categoria(IdCategoria)
);

-- 5. Crear la Tabla Venta
CREATE TABLE Venta (
    IdVenta INT PRIMARY KEY,
    FechaVenta DATE NOT NULL,
    IdCliente INT NOT NULL,
    ValorTotal DECIMAL(10,2) NOT NULL CHECK (ValorTotal > 0),
    CONSTRAINT FK_Venta_Cliente FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente)
);

-- 6. Crear la Tabla DetalleVenta
CREATE TABLE DetalleVenta (
    IdDetalleVenta INT PRIMARY KEY,
    IdVenta INT NOT NULL,
    IdArticulo INT NOT NULL,
    CantidadVendida INT NOT NULL CHECK (CantidadVendida > 0),
    PrecioUnitario DECIMAL(10,2) NOT NULL CHECK (PrecioUnitario > 0),
    Subtotal DECIMAL(10,2) NOT NULL CHECK (Subtotal > 0),
    CONSTRAINT FK_DetalleVenta_Venta FOREIGN KEY (IdVenta) REFERENCES Venta(IdVenta),
    CONSTRAINT FK_DetalleVenta_Articulo FOREIGN KEY (IdArticulo) REFERENCES Articulo(IdArticulo)
);

-- 7. Crear Índices para Optimizar Consultas
-- Índice en Cliente para consultas rápidas por documento
CREATE INDEX IX_Cliente_NumeroDocumento ON Cliente (NumeroDocumento);

-- Índice en Venta para búsquedas por fecha y cliente
CREATE INDEX IX_Venta_FechaVenta ON Venta (FechaVenta);
CREATE INDEX IX_Venta_IdCliente ON Venta (IdCliente);

-- Índice en Artículo para búsquedas por descripción y categoría
CREATE INDEX IX_Articulo_Descripcion ON Articulo (Descripcion);
CREATE INDEX IX_Articulo_IdCategoria ON Articulo (IdCategoria);

-- Índice en DetalleVenta para búsquedas rápidas por artículo y venta
CREATE INDEX IX_DetalleVenta_IdVenta ON DetalleVenta (IdVenta);
CREATE INDEX IX_DetalleVenta_IdArticulo ON DetalleVenta (IdArticulo);