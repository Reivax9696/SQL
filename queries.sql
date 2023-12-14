//Tienda

SELECT nombre FROM producto;

SELECT nombre, precio FROM producto;

SHOW COLUMNS FROM producto;

SELECT nombre, precio AS precio_euros, precio * 1.18 AS precio_dolares FROM producto;

SELECT nombre AS nom_de_producto, precio AS euros, precio * 1.18 AS dolars_nord_americans FROM producto;

SELECT UPPER(nombre), precio FROM producto;

SELECT LOWER(nombre), precio FROM producto;

SELECT nombre, CONCAT(UPPER(SUBSTRING(nombre, 1, 1)), LOWER(SUBSTRING(nombre, 2))) AS nombre_mayusculas FROM fabricante;

SELECT nombre, ROUND (precio) AS precio_arrodonir FROM producto;

SELECT nombre, FLOOR (precio) AS precio_no_decimals FROM producto;

SELECT codigo_fabricante FROM producto;

SELECT nombre FROM fabricante ORDER BY nombre;

SELECT nombre FROM fabricante ORDER BY nombre DESC;

SELECT nombre, precio FROM producto ORDER BY nombre, precio DESC;

SELECT * FROM fabricante LIMIT 5;

SELECT * FROM fabricante LIMIT 2 OFFSET 3;

SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;

SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

SELECT nombre, codigo_fabricante FROM producto WHERE codigo_fabricante = 2;

SELECT producto.nombre AS nombre_producto, precio, fabricante.nombre AS nombre_fabricante FROM producto JOIN fabricante;

SELECT producto.nombre AS nombre_producto, precio, fabricante.nombre AS nombre_fabricante FROM producto JOIN fabricante ORDER BY fabricante.nombre;


//Universitat


SELECT apellido1, apellido2, nombre FROM persona ORDER BY apellido1 DESC;

SELECT nombre, apellido1, apellido2 FROM persona WHERE telefono IS NULL;

SELECT nombre, fecha_nacimiento FROM persona WHERE fecha_nacimiento LIKE '1999%';

SELECT nombre FROM persona JOIN profesor WHERE persona.id LIKE profesor.id_profesor && telefono IS NULL && RIGHT(nif, 1) = 'K';

SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre AS nombre_departamento FROM departamento INNER JOIN profesor ON profesor.id_departamento = departamento.id INNER JOIN persona ON profesor.id_profesor = persona.id ORDER BY persona.apellido1, persona.nombre ASC;

SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM asignatura JOIN persona ON persona.id = asignatura.id JOIN curso_escolar ON curso_escolar.id = persona.id WHERE persona.nif = '26902806M';

SELECT departamento.nombre AS nombre_departamento, persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY IFNULL(departamento.nombre, '~'), persona.apellido1, persona.apellido2, persona.nombre;

SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id WHERE profesor.id_departamento IS NULL;

SELECT departamento.nombre AS nombre_departamento FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id WHERE profesor.id_departamento IS NULL;

SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id IS NULL;

SELECT asignatura.nombre AS nom_assignatura FROM asignatura LEFT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor WHERE profesor.id_profesor IS NULL;

SELECT COUNT(*) AS nombre_total_alumnes FROM persona WHERE persona.tipo = 'alumno';

SELECT COUNT(*) AS nascuts_1999 FROM persona WHERE fecha_nacimiento LIKE '1999%';

SELECT departamento.nombre AS nom_departaments, COUNT(profesor.id_profesor) AS numero_profesors FROM departamento JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY departamento.nombre ORDER BY numero_profesors DESC;

SELECT departamento.nombre AS nom_departament, COUNT(profesor.id_profesor) AS nombre_profesors FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY departamento.nombre;

SELECT grado.nombre AS nom_grau, COUNT(asignatura.id) AS nombre_asignatures FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre ORDER BY nombre_asignatures DESC;

SELECT grado.nombre AS nom_grau, COUNT(asignatura.id) AS nombre_asignatures FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre HAVING nombre_asignatures > 40 ORDER BY nombre_asignatures DESC;

SELECT grado.nombre AS nom_grau, asignatura.nombre AS assignatura, SUM(asignatura.creditos) AS suma_credits FROM grado JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre, asignatura.nombre;

SELECT profesor.id_profesor AS id, persona.nombre, persona.apellido1, persona.apellido2, COUNT(asignatura.id) AS nombre_assignatures FROM profesor LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor JOIN persona ON persona.id = profesor.id_profesor GROUP BY profesor.id_profesor, persona.nombre, persona.apellido1, persona.apellido2 ORDER BY nombre_assignatures DESC;

SELECT  *  FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento = ( SELECT MIN(fecha_nacimiento) FROM persona WHERE  tipo = 'alumno' );











