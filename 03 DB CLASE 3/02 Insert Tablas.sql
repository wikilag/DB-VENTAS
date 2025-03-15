-- Insertar datos en la tabla CLIENTES
INSERT INTO Clientes (ID_Cliente, Nombre, Direccion, Telefono) VALUES
(1, 'Juan Pérez', 'Calle 1 #45-67', '3124567890'),
(2, 'Ana García', 'Carrera 12 #34-56', '3209876543'),
(3, 'Carlos López', 'Avenida Principal #23-45', '3111234567'),
(4, 'María Martínez', 'Calle 45 #12-34', '3147894561'),
(5, 'José Ramírez', 'Carrera 30 #56-78', '3156541234'),
(6, 'Laura Torres', 'Calle 100 #20-10', '3174567890'),
(7, 'Pedro Sánchez', 'Carrera 5 #22-44', '3191234567'),
(8, 'Paula Jiménez', 'Transversal 8 #10-20', '3134567891'),
(9, 'Elena Rojas', 'Diagonal 18 #67-45', '3187654321'),
(10, 'Andrés Gómez', 'Calle 33 #90-32', '3123456789');

-- Insertar datos en la tabla CATEGORIAS
INSERT INTO Categorias (ID_Categoria, Descripcion) VALUES
(1, 'Electrónica'),
(2, 'Alimentos'),
(3, 'Bebidas'),
(4, 'Hogar'),
(5, 'Moda'),
(6, 'Deportes'),
(7, 'Automotriz'),
(8, 'Juguetes'),
(9, 'Libros'),
(10, 'Salud');

-- Insertar datos en la tabla PROVEEDORES
INSERT INTO Proveedores (ID_Proveedor, Nombre, Direccion, Telefono) VALUES
(1, 'ElectroTech', 'Zona Industrial #45', '3112345678'),
(2, 'FoodMarket', 'Centro Comercial #23', '3209876543'),
(3, 'DrinkHouse', 'Avenida 12 #34-56', '3101234567'),
(4, 'HomeSolutions', 'Calle 33 #10-45', '3144567890'),
(5, 'FashionWorld', 'Zona Rosa #12', '3167891234'),
(6, 'SportLand', 'Mall Deportivo #45', '3129876543'),
(7, 'AutoParts', 'Carrera 45 #89-23', '3194567891'),
(8, 'ToyStore', 'Centro Comercial #18', '3136541234'),
(9, 'BookCenter', 'Plaza de Mercado #45', '3171234567'),
(10, 'HealthCare', 'Calle 45 #56-78', '3187654321');

-- Insertar datos en la tabla PRODUCTOS
INSERT INTO Productos (ID_Producto, Descripcion, Precio, ID_Categoria, ID_Proveedor) VALUES
(1, 'Smartphone', 500.00, 1, 1),
(2, 'Laptop', 800.00, 1, 1),
(3, 'Pan de Maíz', 1.50, 2, 2),
(4, 'Cerveza Artesanal', 3.00, 3, 3),
(5, 'Licuadora', 45.00, 4, 4),
(6, 'Camiseta Deportiva', 20.00, 5, 5),
(7, 'Bicicleta', 300.00, 6, 6),
(8, 'Aceite de Motor', 10.00, 7, 7),
(9, 'Muñeca Barbie', 15.00, 8, 8),
(10, 'Libro de Ciencia', 25.00, 9, 9);

-- Insertar datos en la tabla FACTURAS
INSERT INTO Facturas (ID_Factura, Fecha, ID_Cliente) VALUES
(1, '2025-03-01', 1),
(2, '2025-03-02', 2),
(3, '2025-03-03', 3),
(4, '2025-03-04', 4),
(5, '2025-03-05', 5),
(6, '2025-03-06', 6),
(7, '2025-03-07', 7),
(8, '2025-03-08', 8),
(9, '2025-03-09', 9),
(10, '2025-03-10', 10);

-- Insertar datos en la tabla VENTAS
INSERT INTO Ventas (ID_Venta, ID_Factura, ID_Producto, Cantidad) VALUES
(1, 1, 1, 2), -- Juan Pérez compró 2 Smartphones
(2, 2, 2, 1), -- Ana García compró 1 Laptop
(3, 3, 3, 5), -- Carlos López compró 5 Panes de Maíz
(4, 4, 4, 3), -- María Martínez compró 3 Cervezas Artesanales
(5, 5, 5, 1), -- José Ramírez compró 1 Licuadora
(6, 6, 6, 2), -- Laura Torres compró 2 Camisetas Deportivas
(7, 7, 7, 1), -- Pedro Sánchez compró 1 Bicicleta
(8, 8, 8, 4), -- Paula Jiménez compró 4 Aceites de Motor
(9, 9, 9, 2), -- Elena Rojas compró 2 Muñecas Barbie
(10, 10, 10, 3); -- Andrés Gómez compró 3 Libros de Ciencia
