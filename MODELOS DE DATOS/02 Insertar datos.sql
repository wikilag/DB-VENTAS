-- Eliminar registros antiguos de las tablas para evitar conflictos de claves foráneas
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE DetalleVenta;
TRUNCATE TABLE Venta;
TRUNCATE TABLE Articulo;
TRUNCATE TABLE Categoria;
TRUNCATE TABLE Cliente;
SET FOREIGN_KEY_CHECKS = 1;

-- Insertar nuevos registros en la tabla Cliente
INSERT INTO Cliente (IdCliente, Nombre, Apellido, TipoDocumento, NumeroDocumento, Direccion, Telefono, CorreoElectronico) VALUES
(1, 'Christian', 'Sarmiento', 'CC', '12345678', 'Calle 1 #45-67', '3124567890', 'christian.sarmiento@gmail.com'),
(2, 'Andrea', 'Peralta', 'CC', '87654321', 'Carrera 12 #34-56', '3209876543', 'andrea.peralta@gmail.com'),
(3, 'Dago', 'Fonseca', 'CC', '45612378', 'Avenida Principal #23-45', '3111234567', 'dago.fonseca@yahoo.com'),
(4, 'Daniel', 'Guzmán', 'CC', '78945612', 'Calle 45 #12-34', '3147894561', 'daniel.guzman@gmail.com'),
(5, 'Elizabeth', 'Tribiño', 'CC', '15975348', 'Carrera 30 #56-78', '3156541234', 'elizabeth.tribino@hotmail.com'),
(6, 'Laura', 'Rojas', 'CC', '95175364', 'Avenida Central #65-21', '3179876543', 'laura.rojas@gmail.com'),
(7, 'Paola', 'Baracaldo', 'CC', '75315946', 'Calle 100 #20-10', '3191234567', 'paola.baracaldo@gmail.com'),
(8, 'Sebastián', 'Torres', 'CC', '35795164', 'Carrera 45 #89-23', '3104567890', 'sebastian.torres@gmail.com'),
(9, 'Wilmer', 'Quilaguy', 'CC', '95175324', 'Transversal 8 #10-20', '3134567891', 'wilmer.quilaguy@gmail.com');

-- Insertar nuevas categorías
INSERT INTO Categoria (IdCategoria, NombreCategoria) VALUES 
(1, 'Aseo'),
(2, 'Bebidas alcohólicas'),
(3, 'Bebidas no alcohólicas'),
(4, 'Alimentos perecederos'),
(5, 'Alimentos no perecederos'),
(6, 'Utensilios de cocina'),
(7, 'Ferretería');

-- Insertar nuevos artículos
INSERT INTO Articulo (IdArticulo, Descripcion, ValorUnitario, IdCategoria) VALUES 
(1, 'Jabón en barra', 2.50, 1),
(2, 'Shampoo', 5.00, 1),
(3, 'Cerveza artesanal', 3.00, 2),
(4, 'Botella de vino tinto', 15.00, 2),
(5, 'Agua mineral', 1.00, 3),
(6, 'Refresco de cola 2L', 2.00, 3),
(7, 'Leche entera', 1.50, 4),
(8, 'Arroz (1 kg)', 2.00, 5),
(9, 'Sartén antiadherente', 12.00, 6),
(10, 'Martillo', 8.00, 7);

-- Insertar nuevas ventas
INSERT INTO Venta (IdVenta, FechaVenta, IdCliente, ValorTotal) VALUES
(1, '2025-03-01', 1, 25.00), -- Christian Sarmiento
(2, '2025-03-02', 2, 18.00), -- Andrea Peralta
(3, '2025-03-03', 3, 7.00),  -- Dago Fonseca
(4, '2025-03-04', 4, 15.00), -- Daniel Guzmán
(5, '2025-03-05', 5, 30.00), -- Elizabeth Tribiño
(6, '2025-03-06', 6, 22.50), -- Laura Rojas
(7, '2025-03-07', 7, 28.00), -- Paola Baracaldo
(8, '2025-03-08', 8, 10.00), -- Sebastián Torres
(9, '2025-03-09', 9, 16.00); -- Wilmer Quilaguy

-- Insertar nuevos detalles de ventas
INSERT INTO DetalleVenta (IdDetalleVenta, IdVenta, IdArticulo, CantidadVendida, PrecioUnitario, Subtotal) VALUES
(1, 1, 1, 2, 2.50, 5.00),  -- Christian Sarmiento compró 2 Jabones
(2, 1, 2, 2, 5.00, 10.00), -- Christian Sarmiento compró 2 Shampoos
(3, 1, 3, 2, 3.00, 6.00),  -- Christian Sarmiento compró 2 Cervezas artesanales
(4, 2, 4, 1, 15.00, 15.00), -- Andrea Peralta compró 1 Botella de vino tinto
(5, 2, 5, 3, 1.00, 3.00),  -- Andrea Peralta compró 3 Aguas minerales
(6, 3, 6, 2, 2.00, 4.00),  -- Dago Fonseca compró 2 Refrescos de cola
(7, 4, 7, 3, 1.50, 4.50),  -- Daniel Guzmán compró 3 Leches enteras
(8, 4, 8, 2, 2.00, 4.00),  -- Daniel Guzmán compró 2 Arroz
(9, 5, 9, 1, 12.00, 12.00), -- Elizabeth Tribiño compró 1 Sartén
(10, 5, 10, 2, 8.00, 16.00), -- Elizabeth Tribiño compró 2 Martillos
(11, 6, 1, 3, 2.50, 7.50), -- Laura Rojas compró 3 Jabones
(12, 6, 2, 1, 5.00, 5.00), -- Laura Rojas compró 1 Shampoo
(13, 7, 3, 4, 3.00, 12.00), -- Paola Baracaldo compró 4 Cervezas
(14, 7, 4, 1, 15.00, 15.00), -- Paola Baracaldo compró 1 Botella de vino tinto
(15, 8, 5, 2, 1.00, 2.00), -- Sebastián Torres compró 2 Aguas minerales
(16, 8, 6, 4, 2.00, 8.00), -- Sebastián Torres compró 4 Refrescos de cola
(17, 9, 7, 1, 1.50, 1.50), -- Wilmer Quilaguy compró 1 Leche entera
(18, 9, 8, 2, 2.00, 4.00); -- Wilmer Quilaguy compró 2 Arroz
