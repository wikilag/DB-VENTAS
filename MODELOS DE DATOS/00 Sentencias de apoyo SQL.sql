-- Iniciar sesión en MySQL:
mysql -h localhos -u root -p

-- 1. Mostrar la lista de Bases de Datos creadas en el servidor MySQL
SHOW DATABASES;

-- 2. Usar una Base de Datos (Ventas)
USE Ventas;

-- 3. Listar las tablas de la Base de Datos Ventas
SHOW TABLES;

-- 4. Vaciar (TRUNCATE) todas las tablas de la Base de Datos
-- Si deseas vaciar (eliminar todos los registros pero mantener la estructura) de todas las tablas, primero necesitas desactivar las restricciones de clave foránea (para evitar errores):
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE DetalleVenta;
TRUNCATE TABLE Venta;
TRUNCATE TABLE Articulo;
TRUNCATE TABLE Cliente;
TRUNCATE TABLE Categoria;

SET FOREIGN_KEY_CHECKS = 1;

-- TRUNCATE TABLE elimina todos los registros pero conserva la estructura de la tabla.
-- SET FOREIGN_KEY_CHECKS = 0 permite eliminar los registros sin conflictos por las restricciones de clave foránea.

-- 5. Eliminar una, varias y todas las tablas de la Base de Datos
-- Eliminar una tabla específica:
DROP TABLE IF EXISTS DetalleVenta;

-- Eliminar varias tablas a la vez:
DROP TABLE IF EXISTS DetalleVenta, Venta, Articulo;

-- Eliminar todas las tablas de la base de datos:
-- Primero, desactiva las restricciones de clave foránea:
SET FOREIGN_KEY_CHECKS = 0;

-- Después, elimina todas las tablas automáticamente:
SELECT CONCAT('DROP TABLE IF EXISTS ', table_name, ';')
FROM information_schema.tables
WHERE table_schema = 'Ventas';

-- Copia y ejecuta el resultado del SELECT para eliminar todas las tablas.
-- Finalmente, activa de nuevo las restricciones de clave foránea:
SET FOREIGN_KEY_CHECKS = 1;

-- 6. Eliminar la Base de Datos (DROP DATABASE)
DROP DATABASE IF EXISTS Ventas;

