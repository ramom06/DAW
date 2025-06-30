#TRANSACCIONES

#Hacer una copia temporal de empleados
CREATE or replace TABLE empleados_TEMP SELECT * FROM empleados;

#Ejemplo de rollback
BEGIN;
DELETE FROM empleados_temp WHERE oficio LIKE 'vendedor';

ROLLBACK;

#Ejemplo de commit
BEGIN;
DELETE FROM empleados_temp WHERE oficio LIKE 'vendedor';
COMMIT;