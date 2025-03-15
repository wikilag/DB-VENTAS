-- 1. Seleccionar todos los clientes de la base de datos
-- Muestra todos los registros de la tabla Cliente
SELECT * FROM Cliente;

-- 2. Mostrar el nombre y el valor total de las ventas realizadas por cada cliente
-- JOIN: Une las tablas Cliente y Venta usando el campo IdCliente
SELECT c.Nombre, c.Apellido, v.ValorTotal
FROM Cliente c
JOIN Venta v ON c.IdCliente = v.IdCliente; -- ON: Define la condición de unión entre las tablas

-- 3. Contar cuántas ventas ha realizado cada cliente
-- LEFT JOIN: Incluye todos los registros de la tabla Cliente, incluso si no hay ventas asociadas
SELECT c.Nombre, c.Apellido, COUNT(v.IdVenta) AS TotalVentas
FROM Cliente c
LEFT JOIN Venta v ON c.IdCliente = v.IdCliente
GROUP BY c.Nombre, c.Apellido; -- GROUP BY: Agrupa los resultados por cliente

-- 4. Mostrar las ventas cuyo valor total sea mayor a $20
-- Filtra las ventas donde el valor total sea mayor a 20
SELECT * 
FROM Venta 
WHERE ValorTotal > 20;

-- 5. Mostrar los artículos vendidos y la cantidad total de ventas de cada uno
-- Suma la cantidad vendida de cada artículo
SELECT a.Descripcion, SUM(dv.CantidadVendida) AS TotalVendido
FROM DetalleVenta dv
JOIN Articulo a ON dv.IdArticulo = a.IdArticulo
GROUP BY a.Descripcion;

-- 6. Mostrar los clientes que han realizado más de 1 venta
-- HAVING COUNT: Filtra los resultados después de agrupar los datos
SELECT c.Nombre, c.Apellido, COUNT(v.IdVenta) AS TotalVentas
FROM Cliente c
JOIN Venta v ON c.IdCliente = v.IdCliente
GROUP BY c.Nombre, c.Apellido
HAVING COUNT(v.IdVenta) > 1;

-- 7. Mostrar el total de ventas por categoría
-- JOIN: Une las tablas para calcular el total de ventas por categoría
SELECT ca.NombreCategoria, SUM(dv.Subtotal) AS TotalVentas
FROM DetalleVenta dv
JOIN Articulo a ON dv.IdArticulo = a.IdArticulo
JOIN Categoria ca ON a.IdCategoria = ca.IdCategoria
GROUP BY ca.NombreCategoria;

-- 8. Mostrar los detalles de venta de una fecha específica
-- Filtra los detalles de venta por una fecha específica
SELECT dv.* 
FROM DetalleVenta dv
JOIN Venta v ON dv.IdVenta = v.IdVenta
WHERE v.FechaVenta = '2025-03-02';

-- 9. Mostrar los artículos que no han sido vendidos
-- LEFT JOIN: Incluye todos los artículos aunque no hayan sido vendidos
SELECT a.*
FROM Articulo a
LEFT JOIN DetalleVenta dv ON a.IdArticulo = dv.IdArticulo
WHERE dv.IdArticulo IS NULL;

-- 10. Mostrar las ventas ordenadas por el valor total de manera descendente
-- ORDER BY DESC: Ordena los resultados en orden descendente
SELECT * 
FROM Venta 
ORDER BY ValorTotal DESC;

-- 11. Mostrar el cliente que ha gastado más en total
-- LIMIT 1: Limita el resultado al primer registro
SELECT c.Nombre, c.Apellido, SUM(v.ValorTotal) AS TotalGastado
FROM Cliente c
JOIN Venta v ON c.IdCliente = v.IdCliente
GROUP BY c.Nombre, c.Apellido
ORDER BY TotalGastado DESC
LIMIT 1;

-- 12. Mostrar las ventas realizadas en los últimos 7 días
-- Filtra las ventas que ocurrieron en los últimos 7 días
SELECT * 
FROM Venta
WHERE FechaVenta >= CURDATE() - INTERVAL 7 DAY;

-- 13. Mostrar el precio promedio de los artículos vendidos por categoría
-- AVG: Calcula el promedio de los valores
SELECT ca.NombreCategoria, AVG(dv.PrecioUnitario) AS PrecioPromedio
FROM DetalleVenta dv
JOIN Articulo a ON dv.IdArticulo = a.IdArticulo
JOIN Categoria ca ON a.IdCategoria = ca.IdCategoria
GROUP BY ca.NombreCategoria;

-- 14. Mostrar el nombre y el total gastado por cada cliente (incluso si no ha comprado)
-- LEFT JOIN: Incluye clientes sin ventas asociadas
SELECT c.Nombre, c.Apellido, IFNULL(SUM(v.ValorTotal), 0) AS TotalGastado
FROM Cliente c
LEFT JOIN Venta v ON c.IdCliente = v.IdCliente
GROUP BY c.Nombre, c.Apellido;

-- 15. Mostrar los artículos con el precio más alto y más bajo
-- UNION: Combina dos conjuntos de resultados
(SELECT Descripcion, ValorUnitario 
 FROM Articulo 
 ORDER BY ValorUnitario ASC
 LIMIT 1)
UNION
(SELECT Descripcion, ValorUnitario 
 FROM Articulo 
 ORDER BY ValorUnitario DESC
 LIMIT 1);

-- 16. Mostrar las ventas donde el total vendido por venta supere los $30
-- HAVING: Filtra después de la agregación
SELECT v.IdVenta, SUM(dv.Subtotal) AS TotalVenta
FROM Venta v
JOIN DetalleVenta dv ON v.IdVenta = dv.IdVenta
GROUP BY v.IdVenta
HAVING SUM(dv.Subtotal) > 30;

-- 17. Mostrar la fecha de la última venta
-- MAX: Encuentra el valor máximo de la columna
SELECT MAX(FechaVenta) AS UltimaVenta
FROM Venta;

-- 18. Mostrar el cliente que realizó la última compra
-- Subconsulta: Encuentra el valor máximo en una consulta anidada
SELECT c.Nombre, c.Apellido, v.FechaVenta
FROM Cliente c
JOIN Venta v ON c.IdCliente = v.IdCliente
WHERE v.FechaVenta = (SELECT MAX(FechaVenta) FROM Venta);

-- 19. Mostrar el total de ventas realizadas por cada categoría en orden descendente
-- ORDER BY DESC: Ordena los resultados en orden descendente
SELECT ca.NombreCategoria, SUM(dv.Subtotal) AS TotalVendido
FROM DetalleVenta dv
JOIN Articulo a ON dv.IdArticulo = a.IdArticulo
JOIN Categoria ca ON a.IdCategoria = ca.IdCategoria
GROUP BY ca.NombreCategoria
ORDER BY TotalVendido DESC;

-- 20. Mostrar el nombre del cliente y el valor promedio que ha gastado en cada compra
-- AVG: Calcula el promedio de los valores
SELECT c.Nombre, c.Apellido, AVG(v.ValorTotal) AS PromedioGasto
FROM Cliente c
JOIN Venta v ON c.IdCliente = v.IdCliente
GROUP BY c.Nombre, c.Apellido;
