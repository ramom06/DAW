USE empleados;

#Ejercicio 1
-- Límite maximo de crédito de los clientes de cada representante, mostrando el código del representante y el límite máximo de sus clientes
SELECT repclie, MAX(limite_credito) "limite maximo" FROM cliente GROUP BY repclie;

#Ejercicio 2
-- Lista cuantos empleados están asignados a cada oficina, indicando el numero de oficina y el numero de empleados
SELECT IFNULL(oficina,0) 'oficina' , COUNT(numempl) "Numero de empleados" FROM empleado GROUP BY oficina;

#Ejercicio 3
-- Numero de empleados o y el importe total de pedidos para los empleados cuyos pedidos suman más de 30000 euros, ordenando el listado por el importe total
SELECT rep, SUM(importe) FROM pedido  
GROUP BY rep
having SUM(importe) > 30000
ORDER BY 2;

#Ejercicio 4
-- Muestra el numero de oficina y la cuota media de los empleados de dicha oficina
SELECT oficina, AVG(cuota) 'cuota media' FROM empleado 
GROUP BY oficina  
having AVG(cuota) BETWEEN 200000 AND 300000;

#Ejercicio 5
-- Hallar el numero de oficina y la cuota media de los empleados con cargo Representante de dicha oficina, en las que la cuota media de los representantes esté entre 200000 y 300000 euros.
SELECT oficina, AVG(cuota) FROM empleado 
WHERE titulo LIKE 'Representante' 
GROUP BY oficina 
HAVING AVG(cuota) > 200000 AND AVG(cuota) < 300000;

