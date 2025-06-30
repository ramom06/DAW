USE contactos;

#Ejercicio 1
SELECT nivelacademico, COUNT(desempleado) numero_desempleados
FROM contactos
GROUP BY nivelacademico;

#Ejercicio 2
SELECT apellidos, nombre, TIMESTAMPDIFF(YEAR,fechaNacimiento, CURRENT_DATE()) edad
FROM contactos
WHERE sexo = 'Mujer' AND  edad > 25
ORDER BY apellidos, nombre;

#Ejercicio 3
SELECT apellidos, nombre 
FROM contactos
WHERE desempleado = 1 AND aficion1 = 'tv' OR aficion2 = 'tv'
ORDER BY nombre;

#Ejercicio 4
SELECT poblacion, COUNT(poblacion) personas_por_poblacion FROM contactos
GROUP BY poblacion
HAVING COUNT(poblacion) >= 20
ORDER BY personas_por_poblacion DESC, poblacion;


#Ejercicio 5
SELECT poblacion, COUNT(desempleado) AS desempleados
FROM contactos
WHERE desempleado = 1 AND TIMESTAMPDIFF(YEAR,fechaNacimiento, CURRENT_DATE()) < 25
GROUP BY poblacion
Having desempleados >= 2 ;


#Ejercicio 6
SELECT apellidos, nombre
FROM contactos
WHERE sexo LIje 'Mujer' 
	AND sexualidad LIKE 'heterosexualidad' 
	AND (aficion1 LIKE 'cine' OR 'música') OR (aficion2 LIKE 'cine' OR 'música') 
	AND TIMESTAMPDIFFAVG(TIMESTAMPDIFF (YEAR,fechaNacimiento, current_date()) > 28;

#Ejercicio 7
SELECT AVG(TIMESTAMPDIFF(YEAR,fechaNacimiento, current_date()) AS edad
FROM contactos
WHERE cabello LIKE 'Calvo' AND sexo LIKE 'Hombre';

#Ejercicio 8
SELECT poblacion, COUNT(*) num_personas
FROM contactos
WHERE email LIKE '%terra.es'
GROUP BY poblacion;

#Ejercicio 9
SELECT nombre, AVG(ingresosMensuales) media_ingresos
FROM contactos
WHERE ahorros > 15000 AND ahoros < 25000;

#Ejercicio 10
SELECT apellido, nombre
FROM contactos 
WHERE telefono IS NULL AND movil IS NOT NULL;

#Ejercicio 11
SELECT COUNT(*) madrileños_solteros
FROM contactos
WHERE poblacion LIKE 'madrid'
	AND estadoCivil LIKE 'Soltero/a' 
	AND (ingresosMensuales*12) >= 20000 
	AND hijos > 0;
	
#Ejercicio 12
SELECT TIMESTAMPDIFF(YEAR,fechaNacimiento, current_date()) edad, AVG(ingresosMensuales) ingresos_mensuales
FROM contactos
GROUP BY edad
HAVING ingresos_mensuales > 1000;