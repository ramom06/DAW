#Ejercicio 1

CREATE OR REPLACE DATABASE farmacias;
USE farmacias;

-- Creamos las tablas

	CREATE TABLE persona(
	DNI			CHAR(9)	PRIMARY KEY,
	fechaTitulo	DATE	NOT NULL
	);
	
	CREATE TABLE empleado(
	DNI		CHAR(9)	PRIMARY KEY,
	Salario	DEC(6,2)		NOT NULL,
	CONSTRAINT FK_EMPLEADO_PERSONA FOREIGN KEY (DNI) REFERENCES persona(DNI)
	);
	
	CREATE TABLE farmaceutico(
	DNI			CHAR(9)	PRIMARY KEY,
	fechaTitulo	DATE		NOT NULL,
	CONSTRAINT FK_FARMACEUTICO_PERSONA FOREIGN KEY (DNI) REFERENCES persona(DNI)
	);
	
	CREATE TABLE ciudad(
	nombre				VARCHAR(50)		PRIMARY KEY,
	farmaceitico_id	VARCHAR(200)	NOT NULL,
	CONSTRAINT FK_CIUDAD_FARMACEUTICO FOREIGN KEY (farmaceitico_id) REFERENCES farmaceutico(DNI)
	);
	
	CREATE TABLE farmacia(
	numero		CHAR(10)			PRIMARY KEY,
	nombre		VARCHAR(50)		NOT NULL,
	direccion	VARCHAR(100)	UNIQUE,
	ciudad		VARCHAR(50)		NOT NULL,
	CONSTRAINT FK_FARMACIA_CIUDAD FOREIGN KEY (ciudad) REFERENCES ciudad(nombre)
	);
	
	CREATE TABLE trabajaen(
	farmacia_id		CHAR(10),
	persona_id		CHAR(9),
	CONSTRAINT PRIMARY KEY(farmacia_id,persona_id),
	CONSTRAINT FK_TRABAJAEN_FARMACIA FOREIGN KEY (farmacia_id) REFERENCES farmacia(numero),
	CONSTRAINT FK_TRABAJAEN_PERSONA FOREIGN KEY (persona_id) REFERENCES persona(DNI)
	);
	
	
	CREATE TABLE laboratorio(
	cod				CHAR(20)		PRIMARY KEY,
	nombre			VARCHAR(50)	UNIQUE
	);
	
	CREATE TABLE medicamento(
	cod				CHAR(20)			PRIMARY KEY,
	nombre			VARCHAR(100)	NOT NULL,
	precio			DEC(6,2)			NOT NULL,
	contenido		VARCHAR(50)		NOT NULL,
	laboratorio_id	CHAR(20)			NOT NULL,
	CONSTRAINT FK_MEDICAMENTO_LABORATORIO FOREIGN KEY (laboratorio_id) REFERENCES laboratorio(cod)
	);
	
	CREATE TABLE stock(
	farmacia_id		CHAR(10),
	medicamento_id	CHAR(20),
	tipoPresentacion	VARCHAR(50),
	CONSTRAINT PRIMARY KEY(farmacia_id,medicamento_id,tipoPresentacion),
	CONSTRAINT FK_STOCK_FARMACIA FOREIGN KEY (farmacia_id) REFERENCES farmacia(numero),
	CONSTRAINT FK_STOCK_MEDICAMENTO FOREIGN KEY (medicamento_id) REFERENCES medicamento(cod)
	);
	
	CREATE TABLE principioActivo(
	cod				CHAR(20)			PRIMARY KEY,
	descripcion		VARCHAR(200)	NOT NULL
	);
	
	CREATE TABLE contiene(
	medicamento_id	CHAR(20),
	principio_id	CHAR(20),
	CONSTRAINT PRIMARY KEY(principio_id,medicamento_id),
	CONSTRAINT FK_CONTIENE_PRINCIPIOACTIVO FOREIGN KEY (principio_id) REFERENCES principioActivo(cod),
	CONSTRAINT FK_CONTIENE_MEDICAMENTO FOREIGN KEY (medicamento_id) REFERENCES medicamento(cod)
	);
	
	CREATE TABLE accionTerapeutica(
	accion			CHAR(20)			PRIMARY KEY,
	descripcion		VARCHAR(200)	NOT NULL
	);
	
	CREATE TABLE sirvePara(
	medicamento_id	CHAR(20),
	accion_id		CHAR(20),
	CONSTRAINT PRIMARY KEY(medicamento_id,accion_id),
	CONSTRAINT FK_CONTIENE_ACCIONTERAPEUTICA FOREIGN KEY (accion_id) REFERENCES accionTerapeutica(accion),
	CONSTRAINT FK_SIVEPARA_MEDICAMENTO FOREIGN KEY (medicamento_id) REFERENCES medicamento(cod)
	);
	
-- Creamos los índices
CREATE INDEX IN_FARMACIA_NOMBRE ON farmacia (nombre);
CREATE INDEX IN_MEDICAMENTO_NOMBRE ON medicamento (nombre);
CREATE INDEX IN_LABORATIRIO_NOMBRE ON laboratorio (nombre);
	
	
#Ejercicio 2

CREATE OR REPLACE DATABASE facturacion;
USE facturacion;

-- Creamos las tablas

	CREATE TABLE cliente(
	CIF			CHAR(9)			PRIMARY KEY,
	nombre		VARCHAR(100)	NOT NULL,
	localidad	VARCHAR(50)		NOT NULL,
	numCalle		VARCHAR(200)	NOT NULL,
	telefono		CHAR(9)			NOT null
	);
	
	CREATE TABLE producto(
	referencia	CHAR(20)			PRIMARY KEY,
	nombre		VARCHAR(100)	NOT NULL,
	precio		DEC(5,2)			NOT NULL
	);
	
	CREATE TABLE factura(
	numero		CHAR(20)		PRIMARY KEY,
	fecha			DATE			NOT NULL,
	cliente_id	CHAR(9)		NOT NULL,
	CONSTRAINT FK_FACTURA_CLIENTE FOREIGN KEY (cliente_id) REFERENCES cliente(CIF)
	);
	
	CREATE TABLE lineaFactura(
	factura_id		CHAR(20),
	lineaFactura	DEC(5,2),
	producto_id		CHAR(20)		NOT NULL,
	cantidad			INT			NOT NULL,
	CONSTRAINT FK_LINEAFACTURA_FACTURA FOREIGN KEY (factura_id) REFERENCES factura(numero),
	CONSTRAINT FK_LINEAFACTURA_PRODUCTO FOREIGN KEY (producto_id) REFERENCES producto(referencia)
	);
	
-- Cremos los índices
CREATE INDEX IN_CLIENTE_NOMBRE_TELEFONO ON cliente(nombre,telefono);
CREATE INDEX IN_PRODUCTO_NOMBRE ON cliente(nombre);
	
	
#Ejercicio 3
CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

	CREATE TABLE usuario(
	DNI			CHAR(9)			PRIMARY KEY,
	nombre		VARCHAR(50)		NOT NULL,
	direccion	VARCHAR(100)	NOT NULL,
	localidad	VARCHAR(50)		NOT NULL,
	CP				INT				NOT NULL
	);
	
	CREATE TABLE libro(
	ISBN			CHAR(13)			PRIMARY KEY,
	titulo		VARCHAR(100)	NOT NULL,
	autor			VARCHAR(50)		NOT NULL,
	editorial	VARCHAR(50)		NOT NULL
	);
	
	CREATE TABLE ejemplar(
	libro_id		CHAR(15)		PRIMARY KEY,
	ISBN			CHAR(13)		NOT NULL,
	CONSTRAINT FK_EJEMPLAR_LIBRO FOREIGN KEY (ISBN) REFERENCES libro(ISBN)	
	);
	
	CREATE TABLE prestamo(
	libro_id				CHAR(15),
	usuario_id			CHAR(9),
	fecha_prestamo		DATE,
	fecha_devolución	DATE,
	CONSTRAINT PRIMARY KEY (libro_id,usuario_id,fecha_prestamo),
	CONSTRAINT FK_PRESTAMO_LIBRO FOREIGN KEY (libro_id) REFERENCES ejemplar(libro_id),
	CONSTRAINT FK_PRESTAMO_USUARIO FOREIGN KEY (usuario_id) REFERENCES usuario(DNI)
	);
	
-- Creamos los índices 
CREATE INDEX IN_USUARIO_NOMBRE ON usuario(nombre);
CREATE INDEX IN_LIBRO_TITULO_AUTOR ON libro(titulo,autor);


#Ejercicio 4
CREATE DATABASE IF NOT EXISTS liga;
USE liga;

-- Creamos las tablas
	
	CREATE TABLE entrenador(
	licencia		INT(8)			PRIMARY KEY,
	nombre		VARCHAR(100)	NOT NULL
	);
	
	CREATE TABLE equipo(
	nombre			VARCHAR(50)	PRIMARY KEY,
	entrenador_id 	INT			NOT NULL,
	num_capitan		INT			NOT NULL
	);
	
	CREATE TABLE jugador(
	equipo	VARCHAR(50),
	numero	INT,
	nombre	VARCHAR(100)	NOT NULL,
	posicion	VARCHAR(20)		NOT NULL,
	CONSTRAINT PRIMARY KEY(equipo,numero),
	CONSTRAINT FK_JUGADOR_EQUIPO FOREIGN KEY (equipo) REFERENCES equipo(nombre)
	);
	
	CREATE TABLE colores(
	equipo_id	VARCHAR(50),
	color			VARCHAR(20),
	CONSTRAINT PRIMARY KEY(equipo_id,color),
	CONSTRAINT FK_COLORES_EQUIPO FOREIGN KEY (equipo_id) REFERENCES equipo(nombre)
	);
	
-- Hago la clave foránea que no pude hacer antes
ALTER TABLE equipo ADD CONSTRAINT FK_EQUIPO_JUGADOR FOREIGN KEY (num_capitan) REFERENCES jugador(numero);
	
-- Hago los índices
CREATE INDEX IN_JUGADOR_NOMBRE ON jugador(nombre);
CREATE INDEX IN_ENTRENADOR_NOMBRE ON entrenador(nombre);


#Ejercicio 5
CREATE DATABASE IF NOT EXISTS intercambio;
USE intercambio;

-- Creamos las tablas
	
	CREATE TABLE alumno(
	nombre		VARCHAR(100)		PRIMARY KEY,
	telefono		INT(9)
	);
	
	CREATE TABLE departamento(
	codigo		CHAR(3)			PRIMARY KEY,
	nombre		VARCHAR(100)	NOT NULL
	);

	CREATE TABLE parner(
	nombre		VARCHAR(100)	PRIMARY KEY,
	telefono		INT(9),
	dpto_id		CHAR(3)			NOT NULL,
	CONSTRAINT FK_PARNEY_DEPARTAMENTO FOREIGN KEY (dpto_id) REFERENCES departamento(codigo)
	);
	
	CREATE TABLE asignacion(
	alumno_id	VARCHAR(100),
	trimestre	VARCHAR(25),
	dpto_id		CHAR(3)			NOT NULL,
	parner_id	VARCHAR(100)	NOT NULL,
	CONSTRAINT PRIMARY KEY(alumno_id,trimestre),
	CONSTRAINT FK_ASIGNACION_ALUMNO FOREIGN KEY (alumno_id) REFERENCES alumno(nombre),
	CONSTRAINT FK_ASIGNACION_DEPARTAMENTO FOREIGN KEY (dpto_id) REFERENCES departamento(codigo),
	CONSTRAINT FK_ASIGNACION_PARNER FOREIGN KEY (parner_id) REFERENCES parner(nombre)
	);
	
-- Creamos el índice
CREATE INDEX IN_DEPARTAMENTO_NOMBRE	ON departamento(nombre);

	
	
	
	
	
	