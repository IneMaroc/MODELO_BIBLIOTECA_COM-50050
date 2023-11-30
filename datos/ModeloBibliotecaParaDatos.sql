-------------------------
-- CREACION DE LA BASE --
-------------------------

CREATE database IF NOT EXISTS ModeloBiblioteca;
USE ModeloBiblioteca;

------------------------
-- CREACION DE TABLAS --
------------------------

-- TABLA AUTOR --

CREATE TABLE IF NOT EXISTS autor (
	id_autor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre_autor	VARCHAR (200) NOT NULL
);

-- TABLA IDIOMA -- 

CREATE TABLE IF NOT EXISTS idioma (
	id_idioma VARCHAR(10) NOT NULL PRIMARY KEY,
    nombre_idi VARCHAR (30)
);

-- TABLA EDITORIAL --

CREATE TABLE IF NOT EXISTS editorial (
	id_editorial INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    razon_social_edi VARCHAR (100) NOT NULL
);

-- TABLA LIBRO --

CREATE TABLE IF NOT EXISTS libro (
	id_libro INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	titulo	VARCHAR (200) NOT NULL,
	cant_paginas INT,
	id_editorial INT,
	fecha_publi VARCHAR (10),
	isbn VARCHAR (13) NOT NULL,
	
	
    foreign key (id_editorial) references editorial(id_editorial)
    
);


-- TABLA EJEMPLAR -- 

CREATE TABLE IF NOT EXISTS ejemplar (
	id_ejemplar INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    penalidad	int NOT NULL,
	ubicacion VARCHAR (20) NOT NULL,
    id_libro	INT NOT NULL,
	id_idioma VARCHAR(10),
    
    foreign key (id_libro) references libro(id_libro),
    foreign key (id_idioma) references idioma(id_idioma)
);

-- TABLA EMISORA TARJETA --

CREATE TABLE IF NOT EXISTS emisora_tarjeta (
	id_emisora_tarjeta INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    razon_social_emi VARCHAR (50) NOT NULL,
    cuit_emi CHAR(11) NOT NULL,
    tel_aut INT NOT NULL
);

-- TABLA BANCO TARJETA --

CREATE TABLE IF NOT EXISTS banco_tarjeta (
	id_banco_tarjeta INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    razon_social_bco VARCHAR (50) NOT NULL,
    cuit_bco CHAR(11) NOT NULL,
    tel_bco INT NOT NULL
);

-- TABLA TARJETA GARANTIA --

CREATE TABLE IF NOT EXISTS tarj_garantia (
id_tarj_garantia INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
numeracion INT NOT NULL,
vencimiento DATE NOT NULL, 
cod_seg INT NOT NULL, 
titular VARCHAR (30) NOT NULL,
id_emisora_tarjeta INT NOT NULL,
id_banco_tarjeta INT NOT NULL,

foreign key (id_emisora_tarjeta) references emisora_tarjeta(id_emisora_tarjeta),
foreign key (id_banco_tarjeta) references banco_tarjeta(id_banco_tarjeta)
);

-- TABLA USUARIO --

CREATE TABLE IF NOT EXISTS usuario (
	id_usuario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nombre	VARCHAR (20) NOT NULL,
	apellido VARCHAR (20) NOT NULL,
	documento INT NOT NULL,
	direccion VARCHAR (50),
	telefono INT,
	mail VARCHAR (50),
	id_tarj_garantia INT NOT NULL,
	faltas INT,
    
	foreign key (id_tarj_garantia) references tarj_garantia(id_tarj_garantia)
);


-- TABLA ESTADO ALQUILER --

CREATE TABLE IF NOT EXISTS estado_alq (
	id_estado_alq INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom_estado VARCHAR (20)
);

-- TABLA ALQUILER --

CREATE TABLE IF NOT EXISTS alquiler (
	id_alquiler INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
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


SHOW TABLES;

---------------------------
-- DESCRIPCION DE TABLAS --
---------------------------

DESCRIBE autor;
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
DROP TABLE IF EXISTS autor;

-----------------
-- DROP DE BASE--
-----------------

DROP DATABASE IF EXISTS ModeloBiblioteca;

--------------------
-- INSERTAR DATOS --
--------------------

INSERT INTO idioma (id_idioma, nombre_idi) VALUES 
('eng', 'ingles'),
('en-US', 'Ingles EE UU'),
('fre', 'Frances')
;


SELECT * from modelobiblioteca.idioma;
SELECT * from modelobiblioteca.autor;
SELECT * from modelobiblioteca.editorial;
SELECT * from modelobiblioteca.libro;












