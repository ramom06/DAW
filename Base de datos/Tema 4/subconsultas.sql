#Subconsultas

-- Devuelve las 2 primeras tuplas, va después del order by
LIMIT 2;


-- Las subconsultas pueden ir en select, from pero también más habitualmente en el where y en el having
-- Entre parentesis, no se ordenan, se pueden poner subconsultas en subconsultas
-- Tipos

#Devuelven 1 fila y 1 columna, 1 fila y muchas columna, muchas fila y 1 columna, muchas fila y muchas columna

-- Subconsultas devuelven 1 fila y 1 columna
#Usamos operadores relacionales (<, >, <=, >=, !=, =)

#Ejemplo 1: obten el nombre y oficio de los empleados que empezaron a trabajar el mismo dia que Marta Garrido
SELECT nomap, oficio
FROM empleados
WHERE fecha_alta = (SELECT fecha_alta
							FROM empleados
							WHERE nomap = "Marta Garrido");
							
							
							
#Ejemplo 2: Obten nombre, oficio y salario de los empleados que ganen más dinero que marta garrido
SELECT nomap, oficio, salario
FROM empleados
WHERE salario+IFNULL(comision,0) > (SELECT salario+IFNULL(comision,0)
												FROM empleados
												WHERE nomap = "Marta Garrido");
												
												
#Ejemplo 3 : Referencias externas. Consulta correlacionada.
#Repite la consulta 1 sin mostrar a Marta Garrido
SELECT nomap, oficio
FROM empleados E
WHERE fecha_alta = (SELECT fecha_alta
							FROM empleados
							WHERE nomap = "Marta Garrido"
							AND E.nomap != "Marta Garrido");

#Ejemplo 4: Obten nombre, departamento, salario y oficio de los empleados que ganan más que Garrido pero tienen distinto oficio
SELECT nomap,dep_no, oficio, salario
FROM empleados E
WHERE salario+IFNULL(comision,0) > (SELECT salario+IFNULL(comision,0)
												FROM empleados EM
												WHERE nomap = "Marta Garrido"
												AND E.oficio != EM.oficio);
												

-- Subconsulta que devuelven muchas filas y 1 columna			
# Usa los operadores IN, NOT IN, ALL, ANY, EXISTS, NOT EXISTS

#Ejemplo 1: Obten salario de los vendedores cuyo departamento esta en Madrid o Barcelona
SELECT salario
FROM empleados
WHERE dep_no IN (SELECT dep_no
						FROM departamentos
						WHERE localidad LIKE 'Madrid'
							OR localidad LIKE 'Barcelona');
							
#Ejemplo 2: Obtén salario de los empleados que su departamento no esta ni en madrid ni en barcelona. Muestra nombre, num dep y salario
SELECT nomap, dep_no, salario
FROM empleados
WHERE dep_no not IN (SELECT dep_no
						FROM departamentos
						WHERE localidad LIKE 'Madrid'
							OR localidad LIKE 'Barcelona');
							
							
#Ejemplo 3: Obtén nombre, departamento y salario de los empleados con mayor salario que alguno de los del departamento 20
SELECT nomap, dep_no, salario
FROM empleados
WHERE salario > ANY (SELECT salario
							FROM empleados
							WHERE dep_no = 20);
							
#Ejemplo 4: Obtén nombre, departamento y salario de los empleados con mayor salario que todos de los del departamento 20
SELECT nomap, dep_no, salario
FROM empleados
WHERE salario > ALL (SELECT salario
							FROM empleados
							WHERE dep_no = 20);
							
#Ejemplo 5: Obten nombre y numero de departamento donde hay más de 2 trabajadores
SELECT dnombre, dep_no
FROM departamentos D
WHERE EXISTS (SELECT *
					FROM empleados E
					WHERE E.dep_no = D.DEP_NO
					GROUP BY dep_no
					HAVING COUNT(*)>2);
											

-- Subconsulta que devuelven 1 filas y muchas columna		
# No operadores relacionales solo = o IN (= solo para 1 fila)

#Ejemplo 1: Obtén los empleados que pertenecen al misma departamento y entraron en la empresa el mismo dia que Marta Garrido
SELECT nomap
FROM empleados
WHERE (dep_no, fecha_alta) = (SELECT dep_no, fecha_alta
										FROM empleados
										WHERE nomap LIKE 'MARTA GARRIDO');

#Ejemplo 2: Lista empleado con mayor salario con mayor salario
SELECT dep_no, nomap
FROM empleados
WHERE (salario, dep_no) IN (SELECT MAX(salario), dep_no
										FROM empleados
										GROUP BY dep_no);
									

-- Subconsultas en el FROM

#Ejemplo 3: Muestra el departamento y la suma de los sueldos de sus empleados donde la suma de los sueldos sea mayor
SELECT dep_no, MAX(sm)
FROM (SELECT dep_no, SUM(salario) sm
		FROM empleados
		GROUP BY dep_no) AS suma_sueldo;












	