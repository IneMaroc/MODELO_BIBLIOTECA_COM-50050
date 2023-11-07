-----------------
-- DROP DE BASE--
-----------------

DROP DATABASE IF EXISTS ModeloBiblioteca;

-------------------------
-- CREACION DE LA BASE --
-------------------------

CREATE database IF NOT EXISTS ModeloBiblioteca;
USE ModeloBiblioteca;

------------------------
-- CREACION DE TABLAS --
------------------------

-- TABLA AUTOR 

CREATE TABLE IF NOT EXISTS autor (
	id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nombre	VARCHAR (50) NOT NULL,
	apellido VARCHAR (50) NOT NULL,
    nacionalidad	VARCHAR (20),
	sexo VARCHAR (20),
    pseudonimo VARCHAR (50)
);

-- TABLA GENERO 

CREATE TABLE IF NOT EXISTS genero (
	id_genero INT PRIMARY KEY AUTO_INCREMENT,
    nombre_gen VARCHAR (20)
);

-- TABLA IDIOMA 

CREATE TABLE IF NOT EXISTS idioma (
	id_idioma INT PRIMARY KEY AUTO_INCREMENT,
    nombre_idi VARCHAR (20)
);

-- TABLA EDITORIAL 

CREATE TABLE IF NOT EXISTS editorial (
	id_editorial INT PRIMARY KEY AUTO_INCREMENT,
    razon_social VARCHAR (100) NOT NULL,
    cuit CHAR (11) NOT NULL,
    direccion_edi VARCHAR (100),
    telefono_edi INT,
    web_edi VARCHAR (100)
);

-- TABLA LIBRO 

CREATE TABLE IF NOT EXISTS libro (
	id_libro INT PRIMARY KEY AUTO_INCREMENT,
	titulo	VARCHAR (100) NOT NULL,
	cant_paginas INT,
	id_editorial INT NOT NULL,
	fecha_publi DATE,
	isbn CHAR (13) NOT NULL,
	
	
    foreign key (id_editorial) references editorial(id_editorial)
);

-- TABLA EJEMPLAR 

CREATE TABLE IF NOT EXISTS ejemplar (
	id_ejemplar INT PRIMARY KEY AUTO_INCREMENT,
    penalidad	int NOT NULL,
	ubicacion VARCHAR (50) NOT NULL,
    id_libro	INT NOT NULL,
	id_idioma INT NOT NULL,
    
    foreign key (id_libro) references libro(id_libro),
    foreign key (id_idioma) references idioma(id_idioma)
);

-- TABLA EMISORA TARJETA 

CREATE TABLE IF NOT EXISTS emisora_tarjeta (
	id_emisora_tarjeta INT PRIMARY KEY AUTO_INCREMENT,
    razon_social_emi VARCHAR (100) NOT NULL,
    cuit_emi CHAR (11) NOT NULL,
    tel_aut INT NOT NULL
);

-- TABLA BANCO TARJETA 

CREATE TABLE IF NOT EXISTS banco_tarjeta (
	id_banco_tarjeta INT PRIMARY KEY AUTO_INCREMENT,
    razon_social_bco VARCHAR (100) NOT NULL,
    cuit_bco CHAR (11) NOT NULL,
    tel_bco INT NOT NULL
);

-- TABLA TARJETA GARANTIA 

CREATE TABLE IF NOT EXISTS tarj_garantia (
id_tarj_garantia INT PRIMARY KEY AUTO_INCREMENT,
numeracion INT NOT NULL,
vencimiento DATE NOT NULL, 
cod_seg INT NOT NULL, 
titular VARCHAR (30),
id_emisora_tarjeta INT NOT NULL,
id_banco_tarjeta INT NOT NULL,

foreign key (id_emisora_tarjeta) references emisora_tarjeta(id_emisora_tarjeta),
foreign key (id_banco_tarjeta) references banco_tarjeta(id_banco_tarjeta)
);

-- TABLA USUARIO 

CREATE TABLE IF NOT EXISTS usuario (
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
	nombre	VARCHAR (50) NOT NULL,
	apellido VARCHAR (50) NOT NULL,
	documento VARCHAR(12) NOT NULL,
	direccion VARCHAR (100),
	telefono INT,
	mail VARCHAR (100),
	id_tarj_garantia INT NOT NULL,
	faltas INT,
    
	foreign key (id_tarj_garantia) references tarj_garantia(id_tarj_garantia)
);


-- TABLA ESTADO ALQUILER 

CREATE TABLE IF NOT EXISTS estado_alq (
	id_estado_alq INT PRIMARY KEY AUTO_INCREMENT,
    nom_estado VARCHAR (20)
);

-- TABLA ALQUILER 

CREATE TABLE IF NOT EXISTS alquiler (
	id_alquiler INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_ejemplar INT NOT NULL,
    id_estado_alq INT NOT NULL,
    fecha_init DATE NOT NULL, 
    fecha_fin DATE NOT NULL,
    
    foreign key (id_usuario) references usuario(id_usuario),
    foreign key (id_ejemplar) references ejemplar(id_ejemplar),
    foreign key (id_estado_alq) references estado_alq(id_estado_alq) 
);


------------------------------------
-- CREACION DE TABLAS INTERMEDIAS --
------------------------------------

-- TABLA LIBRO_AUTOR

CREATE TABLE IF NOT EXISTS libro_autor (

	id_libro INT NOT NULL,
	id_autor INT NOT NULL,

	foreign key (id_libro) references libro(id_libro),
	foreign key (id_autor) references autor(id_autor),
    primary key (id_libro, id_autor )
    
    );
    
  -- TABLA LIBRO_GENERO 

CREATE TABLE IF NOT EXISTS libro_genero (

	id_libro INT NOT NULL,
	id_genero INT NOT NULL,

	foreign key (id_libro) references libro(id_libro),
	foreign key (id_genero) references genero(id_genero),
    primary key (id_libro, id_genero)
    
    );



SHOW TABLES;

---------------------------
-- DESCRIPCION DE TABLAS --
---------------------------

DESCRIBE autor;
DESCRIBE genero;
DESCRIBE idioma;
DESCRIBE editorial;
DESCRIBE libro;
DESCRIBE ejemplar;
DESCRIBE emisora_tarjeta;
DESCRIBE banco_tarjeta;
DESCRIBE tarj_garantia;
DESCRIBE usuario;
DESCRIBE estado_alq;
DESCRIBE alquiler;
DESCRIBE libro_autor;
DESCRIBE libro_genero;

---------------------------
-- SELECT DE TABLAS --
---------------------------

SELECT * FROM autor;
SELECT * FROM genero;
SELECT * FROM idioma;
SELECT * FROM editorial;
SELECT * FROM libro;
SELECT * FROM ejemplar;
SELECT * FROM emisora_tarjeta;
SELECT * FROM banco_tarjeta;
SELECT * FROM tarj_garantia;
SELECT * FROM usuario;
SELECT * FROM estado_alq;
SELECT * FROM alquiler;
SELECT * FROM libro_autor;
SELECT * FROM libro_genero;


-------------------
-- DROP DE TABLAS--
-------------------

DROP TABLE IF EXISTS libro_genero;
DROP TABLE IF EXISTS libro_autor;
DROP TABLE IF EXISTS alquiler;
DROP TABLE IF EXISTS estado_alq;
DROP TABLE IF EXISTS usuario;
DROP TABLE IF EXISTS tarj_garantia;
DROP TABLE IF EXISTS banco_tarjeta;
DROP TABLE IF EXISTS emisora_tarjeta;
DROP TABLE IF EXISTS ejemplar;
DROP TABLE IF EXISTS libro;
DROP TABLE IF EXISTS editorial;
DROP TABLE IF EXISTS idioma;
DROP TABLE IF EXISTS genero;
DROP TABLE IF EXISTS autor;


