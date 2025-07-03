#Ejercicio 1
INSERT INTO pueblos VALUES('29078', 'Pazalla ', '23.65', 2675+3541, 2675, 3541, 35,165);

#Ejercicio 2
CREATE TABLE poblaciones SELECT codigo, nombre, extension, pob_hombres, pob_mujeres, vehiculos, lineas_tel
								FROM pueblos;
	
#Ejercicio 3
UPDATE poblaciones SET lineas_tel = lineas_tel*1.1;

#Ejercicio 4
UPDATE poblaciones SET vehiculos = vehiculos*1.01
WHERE pob_hombres + pob_mujeres > 15000;

#Ejercicio 5
DELETE from poblaciones WHERE pob_hombres + pob_mujeres < 5000;

