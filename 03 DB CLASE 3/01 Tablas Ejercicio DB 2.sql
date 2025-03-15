-- Crear tabla CLIENTES
CREATE TABLE Clientes (
    ID_Cliente INT PRIMARY KEY,               -- Clave primaria de la tabla Clientes
    Nombre VARCHAR(100) NOT NULL,             -- Nombre del cliente (obligatorio)
    Direccion VARCHAR(255),                   -- Dirección del cliente (opcional)
    Telefono VARCHAR(20)                      -- Teléfono del cliente (opcional)
);

-- Crear tabla FACTURAS
CREATE TABLE Facturas (
    ID_Factura INT PRIMARY KEY,               -- Clave primaria de la tabla Facturas
    Fecha DATE NOT NULL,                      -- Fecha de la factura (obligatorio)
    ID_Cliente INT,                           -- Clave foránea para relacionar con Clientes
    CONSTRAINT FK_Facturas_Clientes 
        FOREIGN KEY (ID_Cliente) 
        REFERENCES Clientes(ID_Cliente)        -- Establece la relación con la tabla Clientes
);

-- Crear tabla CATEGORIAS
CREATE TABLE Categorias (
    ID_Categoria INT PRIMARY KEY,             -- Clave primaria de la tabla Categorias
    Descripcion VARCHAR(100) NOT NULL         -- Descripción de la categoría (obligatorio)
);

-- Crear tabla PROVEEDORES
CREATE TABLE Proveedores (
    ID_Proveedor INT PRIMARY KEY,             -- Clave primaria de la tabla Proveedores
    Nombre VARCHAR(100) NOT NULL,             -- Nombre del proveedor (obligatorio)
    Direccion VARCHAR(255),                   -- Dirección del proveedor (opcional)
    Telefono VARCHAR(20)                      -- Teléfono del proveedor (opcional)
);

-- Crear tabla PRODUCTOS
CREATE TABLE Productos (
    ID_Producto INT PRIMARY KEY,              -- Clave primaria de la tabla Productos
    Descripcion VARCHAR(255) NOT NULL,        -- Descripción del producto (obligatorio)
    Precio DECIMAL(10,2) NOT NULL,            -- Precio del producto (obligatorio)
    ID_Categoria INT,                         -- Clave foránea para relacionar con Categorias
    ID_Proveedor INT,                         -- Clave foránea para relacionar con Proveedores
    CONSTRAINT FK_Productos_Categorias 
        FOREIGN KEY (ID_Categoria) 
        REFERENCES Categorias(ID_Categoria),   -- Relación con Categorias
    CONSTRAINT FK_Productos_Proveedores 
        FOREIGN KEY (ID_Proveedor) 
        REFERENCES Proveedores(ID_Proveedor)   -- Relación con Proveedores
);

-- Crear tabla VENTAS
CREATE TABLE Ventas (
    ID_Venta INT PRIMARY KEY,                 -- Clave primaria de la tabla Ventas
    ID_Factura INT,                           -- Clave foránea para relacionar con Facturas
    ID_Producto INT,                          -- Clave foránea para relacionar con Productos
    Cantidad INT NOT NULL,                    -- Cantidad de productos vendidos (obligatorio)
    CONSTRAINT FK_Ventas_Facturas 
        FOREIGN KEY (ID_Factura) 
        REFERENCES Facturas(ID_Factura),       -- Relación con Facturas
    CONSTRAINT FK_Ventas_Productos 
        FOREIGN KEY (ID_Producto) 
        REFERENCES Productos(ID_Producto)      -- Relación con Productos
);
