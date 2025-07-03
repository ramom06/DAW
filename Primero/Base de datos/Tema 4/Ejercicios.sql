# EJERCICIO 1

-- Creamos la base de datos
CREATE DATABASE IF NOT EXISTS RRHH;
USE RRHH;

-- Creamos la tabla empleado

CREATE TABLE empleado(
	dni					VARCHAR(9)		PRIMARY KEY,
	nombre_emp			VARCHAR(20)		NOT NULL,
	fecha_nac			DATE				NOT NULL,
	salario				NUMERIC(6,2)	NOT NULL,
	departamento_id	VARCHAR(20)		
);

-- Creamos la tabla empleado

CREATE TABLE departamento(
	nom_dep		VARCHAR(20)		PRIMARY KEY,
	num_desp		INT				NOT NULL,
	jefe_id		VARCHAR(9)
);


-- Modificamos las tablas para añadir las claves foráneas

	ALTER TABLE empleado ADD CONSTRAINT FK_EMPLEADO_DEPARTAMENTO FOREIGN KEY (departamento_id) REFERENCES departamento(nom_dep);
	
	ALTER TABLE departamento ADD CONSTRAINT FK_DEPARTAMENTO_EMPLEADO FOREIGN KEY (jefe_id) REFERENCES empleado(dni);

	
-- Creamos un indice para que busquen a los empleados por su nombre

CREATE INDEX IN_EMPLEADO_NOMBRE_EMP ON empleado (nombre_emp);



# Ejercicio 2

-- Creamos la base de datos

CREATE DATABASE IF NOT EXISTS despachos;
USE despachos;

-- Creamos la tabla edificio

CREATE TABLE departamento(
	nombre 				VARCHAR(20)	PRIMARY KEY,
	num_empleados		INT			NOT NULL
);

CREATE TABLE poligonoIND(
	nombre	VARCHAR(20)		PRIMARY KEY,
	ciudad	VARCHAR(10)		NOT NULL
);
 
CREATE TABLE edificio(
	nombre				VARCHAR(20)		PRIMARY KEY,
	num_desp				INT				NOT NULL,
	poligonoInd_id		VARCHAR(20),
	CONSTRAINT FK_EDIFICIO_POLIGONO FOREIGN KEY (poligonoInd_id) REFERENCES poligonoIND(nombre)
);
	
CREATE TABLE distribuido(
	departamento_id	VARCHAR(20),
	edificio_id			VARCHAR(20),
	numDptos				INT				NOT NULL,
	CONSTRAINT PRIMARY KEY(edificio_id, departamento_id),
	CONSTRAINT FK_DISTRIBUIDO_DEPARTAMENTO FOREIGN KEY (departamento_id) REFERENCES departamento(nombre),
	CONSTRAINT FK_DISTRIBUIDO_EDIFICIO FOREIGN KEY (edificio_id) REFERENCES edificio(nombre),
);

CREATE TABLE distribuido(
    departamento_id VARCHAR(20),
    edificio_id VARCHAR(20),
    numDptos INT NOT NULL,
    CONSTRAINT PRIMARY KEY(edificio_id, departamento_id),
    CONSTRAINT FK_DISTRIBUIDO_DEPARTAMENTO FOREIGN KEY (departamento_id) REFERENCES departamento(nombre),
    CONSTRAINT FK_DISTRIBUIDO_EDIFICIO FOREIGN KEY (edificio_id) REFERENCES edificio(nombre)
);



# Ejercicio 3

-- Creamos la base de datos
CREATE DATABASE IF NOT EXISTS geografia;
USE geografia;

-- Creamos las tablas

CREATE TABLE rio(
	nombre				VARCHAR(20)	PRIMARY KEY,
	longitud				INT			NOT NULL,
	caudal				DEC(9,2)		NOT NULL			
);

CREATE TABLE CCAA(
	nombre					VARCHAR(20)		PRIMARY KEY,
	numeroHabitacones		INT				NOT NULL			
);

CREATE TABLE discurre(
	rio_id				VARCHAR(20),
	CCAA_id				VARCHAR(20),
	kilometros			INT				NOT NULL,
	CONSTRAINT PRIMARY KEY(CCAA_id, rio_id),
	CONSTRAINT FK_DISCURRE_RIO FOREIGN KEY (rio_id) REFERENCES rio(nombre),	
	CONSTRAINT FK_DISCURRE_CCAA FOREIGN KEY (CCAA_id) REFERENCES CCAA(nombre)	
);

CREATE TABLE ciudad(
	nombre					VARCHAR(20)		PRIMARY KEY,
	numeroHabitacones		INT				NOT NULL,
	CCAA_id					VARCHAR(20),
	CONSTRAINT FK_CIUDAD_CCAA FOREIGN KEY (CCAA_id) REFERENCES CCAA(nombre)
	);

CREATE TABLE pasa(
	rio_id			VARCHAR(20),
	ciudad_id		VARCHAR(20),
	CONSTRAINT PRIMARY KEY(ciudad_id, rio_id),
	CONSTRAINT FK_PASA_RIO FOREIGN KEY (rio_id) REFERENCES rio(nombre),
	CONSTRAINT FK_PASA_CIUDAD FOREIGN KEY (ciudad_id) REFERENCES ciudad(nombre)
);

# Ejercicio 4

-- Creamos la base de datos

CREATE OR REPLACE DATABASE autobuses;
USE autobuses;

-- Creamos las tablas

	CREATE TABLE conductor(
	DNI				VARCHAR(20)		PRIMARY KEY,
	nombre			VARCHAR(20)		NOT NULL,
	primerApellido	VARCHAR(20)		NOT NULL,
	antig				INT				NOT NULL
	);
	
	CREATE TABLE autobus(
	linea			VARCHAR(20)		PRIMARY KEY,
	asientos		INT				NOT NULL
	);
	
	CREATE TABLE asignado(
	conductor_id1		VARCHAR(20)	NOT NULL,
	conductor_id2		VARCHAR(20)	NOT NULL,
	dia_id				VARCHAR(20)	NOT NULL,
	autobus_id			VARCHAR(20)	NOT NULL,
	CONSTRAINT PRIMARY KEY(conductor_id1, conductor_id2, dia_id), 
	CONSTRAINT FK_ASIGNADO_CONDUCTOR FOREIGN KEY (conductor_id1) REFERENCES conductor(DNI), 
	CONSTRAINT FK_ASIGNADO_CONDUCTOR2 FOREIGN KEY (conductor_id2) REFERENCES conductor(DNI), 
	CONSTRAINT FK_ASIGNADO_AUTOBUS FOREIGN KEY (autobus_id) REFERENCES autobus(linea)
	);
	
	CREATE TABLE parada(
	direccion					VARCHAR(20)		PRIMARY KEY,
	horaPrimeraLlegada		INT				NOT NULL,
	frecuencia					INT				NOT NULL
	);
	
	CREATE TABLE realiza(
	autobus_id	VARCHAR(20),
	parada_id	VARCHAR(20),
	CONSTRAINT PRIMARY KEY(autobus_id, parada_id),
	CONSTRAINT FK_REALIZA_AUTOBUS FOREIGN KEY (autobus_id) REFERENCES autobus(linea),
	CONSTRAINT FK_REALIZA_PARADA FOREIGN KEY (parada_id) REFERENCES parada(direccion)
	);
	

# Ejercicio 5

-- Creamos la base de datos

CREATE OR REPLACE DATABASE inmuebles;
USE inmuebles;

-- Creamos las tablas

	CREATE TABLE persona(
	DNI				VARCHAR(9)		PRIMARY KEY,
	nombre			VARCHAR(20)		NOT NULL,
	Apellido1		VARCHAR(20)		NOT NULL,
	Apellido2		VARCHAR(20)		NOT NULL
	);
	
	CREATE TABLE vivienda(
	Direccion		VARCHAR(200)	PRIMARY KEY,
	superficie		DEC(5,2)			NOT NULL
	);
	
	CREATE TABLE pertenece(
	propietario		VARCHAR(9),
	Direccion		VARCHAR(200),
	CONSTRAINT PRIMARY KEY(propietario, Direccion),
	CONSTRAINT FK_PERTENECE_PERSONA FOREIGN KEY (propietario) REFERENCES persona(DNI),
	CONSTRAINT FK_PERTENECE_VIVIENDA FOREIGN KEY (Direccion) REFERENCES vivienda(Direccion)
	);
	
	CREATE TABLE poliza(
	numPoliza		INT				PRIMARY KEY,
	propietario		VARCHAR(9)		NOT NULL,
	inmueble			VARCHAR(200)	NOT NULL,
	ctdAsegurada	DEC(11,2)		NOT NULL,
	cuota				DEC(11,2)		NOT NULL,
	tipo				VARCHAR(20)		NOT NULL,
	CONSTRAINT FK_POLIZA_PERSONA FOREIGN KEY (propietario) REFERENCES persona(DNI),
	CONSTRAINT FK_POLIZA_VIVIENDA FOREIGN KEY (inmueble) REFERENCES vivienda(Direccion)
	);
	
-- Creamos el índice para persona
CREATE INDEX IN_PERSONA_NOMBRE ON persona (nombre, Apellido1, Apellido2);

# Ejercicio 6

CREATE OR REPLACE DATABASE telefonica;
USE telefonica;

-- Creamos las tablas

	CREATE TABLE terminal(
	numero			INT				PRIMARY KEY,
	tipo				VARCHAR(20)		NOT NULL,
	nombreAbonado	VARCHAR(20)		NOT NULL
	);
	
	CREATE TABLE llamada(
	emisor_id		INT,
	receptor_id		INT,
	duracion			INT		NOT NULL,
	fecha_comienzo	INT,
	CONSTRAINT PRIMARY KEY(emisor_id, receptor_id, fecha_comienzo),
	CONSTRAINT FK_LLAMADA_TERMINAL1 FOREIGN KEY (emisor_id) REFERENCES terminal(numero),
	CONSTRAINT FK_LLAMADA_TERMINAL2 FOREIGN KEY (receptor_id) REFERENCES terminal(numero)
	);
	
	# Ejercicio 7

CREATE OR REPLACE DATABASE horarios;
USE horarios;

-- Creamos las tablas

	CREATE TABLE profesor(
	profesor_id		VARCHAR(20)		PRIMARY KEY,
	nombre			VARCHAR(20)		NOT NULL,
	departamento	VARCHAR(20)		NOT NULL
	);
	
	CREATE TABLE aula(
	numero				INT	PRIMARY KEY,
	capacidad			INT	NOT NULL,
	NumOrdenadores		INT,
	AltoPizarra			INT,
	AnchoPizarra		INT
	);
	
	CREATE TABLE asignatura(
	asignatura_id		VARCHAR(20)		PRIMARY KEY,
	nombre				VARCHAR(20)		NOT NULL,
	cuatrimestre		INT				NOT NULL,
	aula					INT				NOT NULL,
	profesor				VARCHAR(20)		NOT NULL,
	CONSTRAINT FK_ASIGNATURA_PROFESOR FOREIGN KEY (profesor) REFERENCES profesor(profesor_id),
	CONSTRAINT FK_ASIGNATURA_AULA FOREIGN KEY (aula) REFERENCES aula(numero)
	);
	
-- Creamos el índice para los profesores
CREATE INDEX IN_PROFESOR_PROFESOR_ID_DEPARTAMENTO ON profesor (profesor_id, departamento);
	
	
# Ejercicio 8

CREATE OR REPLACE DATABASE trafico;
USE trafico;

-- Creamos las tablas

	CREATE TABLE propietario(
	DNI						CHAR(9)		PRIMARY KEY,
	nombre					VARCHAR(20)		NOT NULL,
	apellidos				VARCHAR(20)		NOT NULL,
	añosCarnetConducir	INT				NOT NULL
	);
	
	CREATE TABLE vehiculo(
	matricula				CHAR(7)		PRIMARY KEY,
	marca						VARCHAR(20)		NOT NULL,
	propietario_id			VARCHAR(9)		NOT NULL,
	CONSTRAINT FK_VEHICULO_PROPIETARIO FOREIGN KEY (propietario_id) REFERENCES propietario(DNI)
	);

	CREATE TABLE coche(
	matricula	CHAR(7)	PRIMARY KEY,
	numPuertas	INT			NOT NULL,
	CONSTRAINT FK_COCHE_VEHÍCULO FOREIGN KEY (matricula) REFERENCES vehiculo(matricula)
	);
	
	CREATE TABLE moto(
	matricula	CHAR(7)	PRIMARY KEY,
	CONSTRAINT FK_MOTO_VEHÍCULO FOREIGN KEY (matricula) REFERENCES vehiculo(matricula)
	);
	
	CREATE TABLE camion(
	matricula	CHAR(7)	PRIMARY KEY,
	tara			INT			NOT NULL,
	CONSTRAINT FK_CAMION_VEHÍCULO FOREIGN KEY (matricula) REFERENCES vehiculo(matricula)
	);
	
# Ejercicio 9

CREATE OR REPLACE DATABASE editorial;
USE editorial;

-- Creamos las tablas

	CREATE TABLE periodista(
	DNI						VARCHAR(9)		PRIMARY KEY,
	nombre					VARCHAR(20)		NOT NULL,
	telefono					INT				NOT NULL,
	especialidad			VARCHAR(20)		NOT NULL
	);
	
	CREATE TABLE colabora(
	revista_id				INT,
	periodista_id			VARCHAR(9),
	CONSTRAINT FK_COLABORA_PERIODISTA FOREIGN KEY (periodista_id) REFERENCES periodista(DNI)
	);
	
	CREATE TABLE sucursal(
	cod						INT				PRIMARY KEY,
	direccion				VARCHAR(20)		NOT NULL,
	telefono					INT				NOT NULL
	);
	
	CREATE TABLE empleado(
	DNI						VARCHAR(9)		PRIMARY KEY,
	nombre					VARCHAR(20)		NOT NULL,
	telefono					INT				NOT NULL,
	sucursal_id				INT				NOT NULL,
	CONSTRAINT FK_EMPLEADO_SUCURSAL FOREIGN KEY (sucursal_id) REFERENCES sucursal(cod)
	);
	
	CREATE TABLE revista(
	numRegistro				INT				PRIMARY KEY,
	titulo					VARCHAR(20)		NOT NULL,
	periodicidad			VARCHAR(20)		NOT NULL,
	tipo						VARCHAR(20)		NOT NULL,
	sucursal_id				INT				NOT NULL,
	CONSTRAINT FK_REVISTA_SUCURSAL FOREIGN KEY (sucursal_id) REFERENCES sucursal(cod)
	);
	
	CREATE TABLE seccion(
	revista_id				INT			NOT NULL,
	titulo					VARCHAR(20)	NOT NULL,
	extension				INT			NOT NULL,
	CONSTRAINT PRIMARY KEY(revista_id, titulo),
	CONSTRAINT FK_SECCION_REVISTA FOREIGN KEY (revista_id) REFERENCES revista(numRegistro)
	);
	
	CREATE TABLE numero(
	revista_id				INT		NOT NULL,
	fecha						INT		NOT NULL,
	paginas					INT		NOT NULL,
	ejemplaresVendidos	INT		NOT NULL,
	CONSTRAINT PRIMARY KEY(revista_id, fecha),
	CONSTRAINT FK_NUMERO_REVISTA FOREIGN KEY (revista_id) REFERENCES revista(numRegistro)
	);
	
-- Creamos el índice para los profesores
CREATE INDEX IN_PERIODISTA_NOMBRE_APELLIDOS ON periodista (nombre);
CREATE INDEX IN_EMPLEADO_NOMBRE_APELLIDOS ON empleado (nombre);
CREATE INDEX IN_REVISTA_TIPO ON revista (tipo);

	
# EJERCICIO 10

CREATE OR REPLACE DATABASE hosteleria;
USE hosteleria;

-- Creamos las tablas

	CREATE TABLE empleado(
	DNI				CHAR(9)		PRIMARY KEY,
	nombre			VARCHAR(20)	NOT NULL,
	direccion		VARCHAR(20)	NOT NULL
	);
	
	CREATE TABLE trabaja(
	DNI				CHAR(9)		PRIMARY KEY,
	CIF				CHAR(10)		NOT NULL,
	funcion			VARCHAR(20)	NOT NULL,
	CONSTRAINT FK_TRABAJA_EMPLEADO FOREIGN KEY (DNI) REFERENCES empleado(DNI)
	);
	
	CREATE TABLE pub(
	nombre			VARCHAR(20)		NOT NULL,
	CIF				CHAR(9)			PRIMARY KEY,
	direccion		VARCHAR(20)		NOT NULL,
	fechaApertura	DATE				NOT NULL,
	horario			TIME				NOT NULL,
	diasApertura	CHAR(7)			NOT NULL
	);
	
	CREATE TABLE recaudacion(
	pub_id		CHAR(9)	PRIMARY KEY,
	fecha			INT		NOT NULL,
	cantidad		INT		NOT NULL,
	CONSTRAINT FK_RECAUDACION_PUB FOREIGN KEY (pub_id) REFERENCES pub(CIF)
	);
	
	CREATE TABLE propietario(
	DNI				CHAR(9)			PRIMARY KEY,
	nombre			VARCHAR(20)		NOT NULL,
	direccion		VARCHAR(20)		NOT NULL
	);
	
	CREATE TABLE espropietario(
	pub_id				CHAR(9),
	propietario_id		CHAR(9),
	CONSTRAINT FK_ESPROPIETARIO_PUB FOREIGN KEY (pub_id) REFERENCES pub(CIF),
	CONSTRAINT FK_ESPROPIETARIO_PROPIETARIO FOREIGN KEY (propietario_id) REFERENCES propietario(DNI)
	);
	
	CREATE TABLE pedido(
	numero		INT				PRIMARY KEY,
	fecha			INT				NOT NULL,
	proveedor	VARCHAR(20)		NOT NULL,
	precioTotal	DOUBLE			NOT NULL,
	pub_id		CHAR(9)			NOT NULL,
	CONSTRAINT FK_PEDIDO_PUB FOREIGN KEY (pub_id) REFERENCES pub(CIF)
	);
	
	CREATE TABLE articulos(
	cod		INT				PRIMARY KEY,
	nombre	VARCHAR(20)		NOT NULL,
	precio	DOUBLE			NOT NULL
	);
	
	CREATE TABLE detalle_pedido(
	pedido_id		INT		NOT NULL,
	articulo_id		INT		NOT NULL,
	cantidad			INT		NOT NULL,
	CONSTRAINT PRIMARY KEY(pedido_id, articulo_id),
	CONSTRAINT FK_DETALLE_PEDIDO_ARTICULO FOREIGN KEY (articulo_id) REFERENCES articulos(cod)
	);
	
	CREATE TABLE existencias(
	pub_id			CHAR(9)		NOT NULL,
	articulo_id		INT	NOT NULL,
	cantidad			INT		NOT NULL,
	CONSTRAINT PRIMARY KEY(pub_id, articulo_id),
	CONSTRAINT FK_EXISTENCIAS_ARTICULO FOREIGN KEY (articulo_id) REFERENCES articulos(cod),
	CONSTRAINT FK_EXISTENCIAS_PUB FOREIGN KEY (pub_id) REFERENCES pub(CIF)
	);
	
-- Creamos los índiceS para los profesores
CREATE INDEX IN_EMPLEADO_NOMBRE ON empleado (nombre);	
CREATE INDEX IN_PUB_NOMBRE ON pub (nombre);
CREATE INDEX IN_ARTICULOS_NOMBRE ON articulos (nombre);

	
# EJERCICIO 11

CREATE OR REPLACE DATABASE ETT;
USE ETT;

-- Creamos las tablas

	CREATE TABLE empresa (
	CIF			CHAR(9)		PRIMARY KEY,
	nombre		VARCHAR(20)		NOT NULL,
	sector		VARCHAR(20)		NOT NULL
	);	
	
	CREATE TABLE multinacional (
	empresa_id			CHAR(9)		PRIMARY KEY,
	numPaises			INT			NOT NULL,
	CONSTRAINT FK_MULTINACIONAL_EMPRESA FOREIGN KEY (empresa_id) REFERENCES empresa(CIF)
	);	
	
	CREATE TABLE pyme (
	empresa_id		CHAR(9)			PRIMARY KEY,
	ciudad			VARCHAR(20)		NOT NULL,
	CONSTRAINT FK_PYME_EMPRESA FOREIGN KEY (empresa_id) REFERENCES empresa(CIF)
	);	
	
	CREATE TABLE oferta (
	cod			INT				PRIMARY KEY,
	profesion	VARCHAR(20)		NOT NULL,
	lugar			VARCHAR(20)		NOT NULL,
	condiciones VARCHAR(20)		NOT NULL,
	empresa_id	CHAR(9)			NOT NULL,
	CONSTRAINT FK_OFERTA_EMPRESA FOREIGN KEY (empresa_id) REFERENCES empresa(CIF)
	);	
	
	CREATE TABLE persona (
	DNI				CHAR(9)		PRIMARY KEY,
	nombre			VARCHAR(20)		NOT NULL,
	estudios			VARCHAR(20)		NOT NULL,
	profesion		VARCHAR(20)		NOT NULL
	);	
	
	CREATE TABLE contrato (
	oferta_id			INT				PRIMARY KEY,
	persona_id			CHAR(9)			NOT NULL,
	fecha_contrato		DATE				NOT NULL,
	duracion				INT				NOT NULL,
	sueldo				INT				NOT NULL,
	CONSTRAINT FK_CONTRATO_PERSONA FOREIGN KEY (persona_id) REFERENCES persona(DNI),
	CONSTRAINT FK_CONTRATO_OFERTA FOREIGN KEY (oferta_id) REFERENCES oferta(cod)
	);	
	
	CREATE TABLE interesa (
	persona_id		CHAR(9),
	empleo_id		INT,
	CONSTRAINT PRIMARY KEY(persona_id, empleo_id),
	CONSTRAINT FK_INTERESA_PERSONA FOREIGN KEY (persona_id) REFERENCES persona(DNI),
	CONSTRAINT FK_INTERESA_OFERTA FOREIGN KEY (empleo_id) REFERENCES oferta(cod)
	);	
	
-- Creamos los índiceS para los profesores
CREATE INDEX IN_PERSONA_NOMBRE_PROFESION ON persona (nombre, profesion);
CREATE INDEX IN_EMPRESA_NOMBRE_SECTOR ON empresa (nombre, sector);
CREATE INDEX IN_PRFESION_OFERTA ON oferta (profesion);	
	

	
	