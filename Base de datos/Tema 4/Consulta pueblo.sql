USE PUEBLOS;

-- Muestra codigo y nombres de los puebls
SELECT CODIGO, NOMBRE FROM PUEBLOS;

-- Muestra codigo, nombre, población total calculada con población de hombre y mujeres
SELECT CODIGO, NOMBRE, POB_TOTAL, POB_HOMBRES+POB_MUJERES FROM pueblos;

-- Muestra codigo, nombre de población y vehículos por persona
SELECT CODIGO, NOMBRE, LINEAS_TEL/POB_TOTAL FROM pueblos;

-- Muestra codigo, nombre de población y vehículos por persona en porcentaje
SELECT CODIGO, NOMBRE, LINEAS_TEL/POB_TOTAL*100 FROM pueblos;

-- Datos del pueblo con codigo 29067
SELECT * FROM PUEBLOS
WHERE CODIGO = 29067;

-- Datos de pueblos con codigo diferente a 29067
SELECT * FROM PUEBLOS
WHERE CODIGO <> 29067;

-- Datos de pueblos con más de 1000 habitantes
SELECT * FROM pueblos
WHERE POB_TOTAL>1000;

-- Datos de pueblos con más de 10000 habitantes
SELECT * FROM pueblos
WHERE POB_TOTAL<10000;

-- Datos de pueblos con más de 1000 habitantes y menos de 10000
SELECT * FROM pueblos
WHERE POB_TOTAL BETWEEN 1000 AND 10000;

-- Muestra codigo, nombre y el porcenaje de coches por persona cuando el porcentaje sea igual o mayor del 10%
SELECT CODIGO, NOMBRE, VEHICULOS/POB_TOTAL*100 FROM pueblos 
WHERE VEHICULOS/POB_TOTAL*100 >=10;

-- Muestra codigo, nombre y el porcenaje de coches por persona cuando el porcentaje sea igual o mayor del 10% y si es málaga
SELECT CODIGO, NOMBRE, VEHICULOS/POB_TOTAL*100 FROM pueblos 
WHERE VEHICULOS/POB_TOTAL*100 >=10 OR CODIGO = 29067;

-- Datos de pueblos con más de 100 habitantes y menos de 1000 o más de 10000
SELECT * FROM pueblos
WHERE POB_TOTAL BETWEEN 100 AND 1000 OR POB_TOTAL>1000;

-- Datos de todos los pueblos con código 29007, 29078 y 29099
SELECT * FROM pueblos
WHERE CODIGO=29007 OR CODIGO=29078 OR CODIGO=29099;

-- Muestra nmbre y numero de vehículos de pueblos de -1000 habs, ordenador en orden descente por numero de vehículo
SELECT nombre, vehiculos FROM pueblos WHERE pob_total < 1000 ORDER BY vehiculos DESC;

-- Igual que la anterior pero se ordena tambien por nombre
SELECT nombre, vehiculos FROM pueblos WHERE pob_total < 1000 ORDER BY vehiculos DESC ORDER BY nombre;

-- Muestra nombre y población que empieza n por Al o por Ben.
SELECT nombre, pob_total FROM pueblos WHERE nombre LIKE "Al%" OR nombre LIKE "Ben%";