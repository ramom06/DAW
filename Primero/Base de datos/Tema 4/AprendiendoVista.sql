-- Aprendiendo vistas

CREATE VIEW calle_clientes
	AS SELECT nombre, direccion
		FROM cliente;

ALTER VIEW calle_clientes AS
	SELECT nombre, apellidos, direccion
	FROM cliente;

DROP VIEW calle_clientes;

SELECT * FROM calle_clientes;

CREATE VIEW  num_clientes_calle AS
	SELECT direccion, COUNT(*)
	FROM cliente
	GROUP BY direccion


