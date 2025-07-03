#ACTUALIZACIONES

#Actualizacion de toda la tabla (5% del salario)
UPDATE empleados SET salario=salario*1.05;

#Incrementa el salario un 10% a los analistas
UPDATE empleados SET salario=salario*1.1
WHERE oficio LIKE 'Analista';

#Actualizamos el salario y la comisión de Francisco Calvo
UPDATE empleados SET salario = 2000, comision = 100
WHERE nomap LIKE 'Francisco Calvo';

#Violación de la restricción de clave foránea
UPDATE empleados
SET dep_no = 50
WHERE nomap LIKE 'PAULA LOPEZ';

#Violación de clave primaria
UPDATE empleados
SET emp_no = 8000
WHERE emp_no = 7698;


