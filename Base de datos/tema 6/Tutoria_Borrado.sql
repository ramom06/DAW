#BORRADO

#Borra un fila
DELETE FROM empleados WHERE nomap LIKE 'Marta jurado';

#Tener cuidado con las restricciones de clave foránea
DELETE FROM empleados WHERE nomap LIKE 'Marta jurado';

#Borramos tabla entera
DELETE FROM vendedores;
