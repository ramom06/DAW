CREATE DATABASE IF NOT EXISTS examenRamon CHARACTER SET UTF8MB4 COLLATE UTF8MB4_SPANISH_CI;
USE examenRamon;

# EJERCICIO 1
CREATE TABLE clientes(
	id_cliente	CHAR(10)		PRIMARY KEY,
	nom_cli		VARCHAR(30)	NOT NULL,
	direccion	VARCHAR(30),
	localidad	VARCHAR(30),
	telefono		INT(9),
	CONSTRAINT UQ_CLIENTES_TELEFONO UNIQUE(telefono)
);

# EJERCICIO 2
CREATE TABLE pedidos(
	id_pedidos	CHAR(10),
	id_cliente	CHAR(10) 	NOT NULL,
	fecha			DATE			NOT NULL,
	importe		DEC(12,2)	NOT NULL,
	CONSTRAINT PRIMARY KEY (id_pedidos),
	CONSTRAINT FK_PEDIDOS_CLIENTES FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

# EJERCICIO 3
CREATE TABLE platos(
	id_platos		CHAR(10) 		PRIMARY KEY,
	desc_plato		VARCHAR(100)	NOT NULL,
	ingredientes	VARCHAR(100)	NOT NULL,
	precio			DEC(12,2)	NOT NULL
);

# EJERCICIO 4
CREATE TABLE detalle_pedidos(
	id_pedidos	CHAR(10),
	id_platos	CHAR(10),
	num_platos	INT(2),
	CONSTRAINT PRIMARY KEY (id_pedidos,id_platos),
	CONSTRAINT FK_DETALLE_PEDIDOS_PLATOS FOREIGN KEY (id_platos) REFERENCES platos(id_platos),
	CONSTRAINT FK_DETALLE_PEDIDOS_PEDIDOS FOREIGN KEY (id_pedidos) REFERENCES pedidos(id_pedidos)
);

# EJERCICIO 5
ALTER TABLE clientes ADD COLUMN c_postal INT(5)	NOT NULL;

# EJERCICIO 6
ALTER TABLE pedidos DROP FOREIGN KEY FK_PEDIDOS_CLIENTES;

# EJERCICIO 7 
ALTER TABLE pedidos ADD CONSTRAINT FK_PEDIDOS_ID_CLIENTES FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente);

# EJERCICIO 8
ALTER TABLE clientes CHANGE COLUMN c_postal codigo_postal INT NOT NULL;

# EJERCICIO 9
ALTER TABLE platos MODIFY COLUMN precio INT CHECK(precio > 1 && precio < 1000);

# EJERCICIO 10
CREATE USER ramon@localhost;
ALTER USER ramon@localhost IDENTIFIED BY 'contra';

-- Creo el rol
CREATE ROLE creacionRol;
GRANT CREATE ON *.* TO creacionRol;
GRANT creacionRol TO ramon@localhost;
SHOW GRANTS FOR ramon@localhost;

-- Creo que el rol se debe activar cuando lo añadas al usuario
SET ROLE creacionRol;







