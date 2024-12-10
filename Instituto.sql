DROP DATABASE IF EXISTS instituto;
CREATE DATABASE instituto CHARACTER SET utf8mb4;
USE instituto;

CREATE TABLE alumno (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	apellido1 VARCHAR(100) NOT NULL,
	apellido2 VARCHAR(100),
	fecha_nacimiento DATE NOT NULL,
	es_repetidor ENUM('sí', 'no') NOT NULL,
	teléfono CHAR(9)
);
INSERT INTO alumno VALUES(1, 'María', 'Sánchez', 'Pérez', '1990/12/01', 'no', NULL);
INSERT INTO alumno VALUES(2, 'Juan', 'Sáez', 'Vega', '1998/04/02', 'no', 618253876);
INSERT INTO alumno VALUES(3, 'Pepe', 'Ramírez', 'Gea', '1988/01/03', 'no', NULL);
INSERT INTO alumno VALUES(4, 'Lucía', 'Sánchez', 'Ortega', '1993/06/13', 'sí', 678516294);
INSERT INTO alumno VALUES(5, 'Paco', 'Martínez', 'López', '1995/11/24', 'no', 692735409);
INSERT INTO alumno VALUES(6, 'Irene', 'Gutiérrez', 'Sánchez', '1991/03/28', 'sí', NULL);
INSERT INTO alumno VALUES(7, 'Cristina', 'Fernández', 'Ramírez', '1996/09/17', 'no', 628349590);
INSERT INTO alumno VALUES(8, 'Antonio', 'Carretero', 'Ortega', '1994/05/20', 'sí', 612345633);
INSERT INTO alumno VALUES(9, 'Manuel', 'Domínguez', 'Hernández', '1999/07/08', 'no', NULL);
INSERT INTO alumno VALUES(10, 'Daniel', 'Moreno', 'Ruiz', '1998/02/03', 'no', NULL);

-- Consultas
Select*from alumno;

select nombre from alumno;

select apellido1, apellido2, nombre
from alumno;

select lower (concat_ws(" ",nombre, apellido1, apellido2)) as "Nombre minuscula"
from alumno;
-- -----
select upper (concat_ws(nombre, "_", apellido1, " ", apellido2)) as "Nombre mayusculas"
from alumno;
-- -----
SELECT * 
FROM nombre_tabla
ORDER BY columna_orden 
LIMIT 5;
-- ------
SELECT * 
FROM nombre_tabla
ORDER BY columna_orden 
LIMIT 5 OFFSET 5;
-- ------
SELECT * 
FROM nombre_tabla
ORDER BY columna_orden 
LIMIT 5 OFFSET 10;
-- ------
SELECT * 
FROM alumno
WHERE id = 1;

-- -----------
SELECT * 
FROM alumno
WHERE telefono = '692735409';

-- -----------
SELECT * 
FROM alumno
WHERE es_repetidor = 'SI';

-- -------------
SELECT * 
FROM alumno
WHERE es_repetidor = 'NO';

-- -----------
SELECT * 
FROM alumno
WHERE fecha_nacimiento <= '1993-01-01';

-- -----------
SELECT * 
FROM alumno
WHERE fecha_nacimiento >= '1994-01-01';

-- --------------
SELECT * 
FROM alumno
WHERE fecha_nacimiento >= '1994-01-01'
  AND es_repetidor = 'NO';

-- -------------
SELECT * 
FROM alumno
WHERE YEAR(fecha_nacimiento) = 1998;

-- --------
SELECT * 
FROM alumno
WHERE YEAR(fecha_nacimiento) <> 1998;
-- ---------
SELECT * 
FROM alumno
WHERE fecha_nacimiento BETWEEN '1998-01-01' AND '1998-05-31';

-- ---------
SELECT * 
FROM alumno
WHERE fecha_nacimiento NOT BETWEEN '1998-01-01' AND '1998-05-31';
-- ----------
SELECT nombre AS nombre_original,
       REVERSE(nombre) AS nombre_invertido
FROM alumno;
-- -------------------
SELECT nombre AS nombre_original,
       REVERSE(nombre) AS nombre_invertido
FROM alumno;

-- -----------
SELECT CONCAT(nombre, ' ', apellidos) AS nombre_completo,
       REVERSE(CONCAT(nombre, ' ', apellidos)) AS nombre_completo_invertido
FROM alumno;

-- ----------
SELECT UPPER(CONCAT(nombre, ' ', apellidos)) AS nombre_completo_mayuscula,
       LOWER(REVERSE(CONCAT(nombre, ' ', apellidos))) AS nombre_completo_invertido_minuscula
FROM alumno;

-- --------
SELECT CONCAT(nombre, ' ', apellidos) AS nombre_completo,
       CHAR_LENGTH(CONCAT(nombre, ' ', apellidos)) AS numero_caracteres,
       OCTET_LENGTH(CONCAT(nombre, ' ', apellidos)) AS numero_bytes
FROM alumno;

-- -----------
SELECT concat(nombre, ' ', apellidos) AS nombre_completo,
       LOWER(CONCAT(nombre, '.', SUBSTRING_INDEX(apellidos, ' ', 1), '@iescamp.es')) AS correo_electronico
FROM alumno;

-- -----------
SELECT CONCAT(nombre, ' ', apellidos) AS nombre_completo,
       LOWER(CONCAT(nombre, '.', SUBSTRING_INDEX(apellidos, ' ', 1), '@iescamp.es')) AS correo_electronico,
       CONCAT(REVERSE(SUBSTRING_INDEX(apellidos, ' ', -1)), YEAR(fecha_nacimiento)) AS contrasena
FROM alumno;
-- ------------
SELECT fecha_nacimiento AS fecha_completa,
       DAY(fecha_nacimiento) AS dia,
       MONTH(fecha_nacimiento) AS mes,
       YEAR(fecha_nacimiento) AS año
FROM alumno;
-- ------------
SELECT fecha_nacimiento,
       DAYNAME(fecha_nacimiento) AS dia_semana,
       MONTHNAME(fecha_nacimiento) AS nombre_mes
FROM alumno;

-- ----------
SELECT fecha_nacimiento,
       DATE_FORMAT(fecha_nacimiento, '%W') AS dia_semana,
       DATE_FORMAT(fecha_nacimiento, '%M') AS nombre_mes
FROM alumno;
-- --------
SELECT fecha_nacimiento,
	  datediff(now(),fecha_nacimiento)

from alumno;
-- --------
SELECT fecha_nacimiento,
	 truncate((datediff(now(),fecha_nacimiento)/365.25,0)
from alumno;