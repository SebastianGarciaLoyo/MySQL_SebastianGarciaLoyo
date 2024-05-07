-- ###########################
-- ##### EJERCICIO DIA 4 #####
-- ###########################



-- Creando y usando la base de datos Paises

create database Paises;

use Paises;



-- Creando la tabla pais

create table pais(
	id_pais int unsigned primary key auto_increment not null,
	nombre varchar(20) null,
	continente varchar(50) null,
	poblacion int null
);


-- Creando la tabla ciudad

create table ciudad(
	id_ciudad int unsigned primary key auto_increment not null,
	nombre varchar(20) null,
	id_pais int unsigned null,
	foreign key(id_pais) references pais(id_pais)
);


-- Creando la tabla idioma

create table idioma(
	id_idioma int unsigned primary key auto_increment not null,
	idioma varchar(50) null
);


-- Creando la tabla idioma_pais

create table idioma_pais(
	id_idioma int unsigned not null,
	id_pais int unsigned not null,
	es_oficial tinyint(1) null,
	foreign key(id_idioma) references idioma(id_idioma),
	foreign key(id_pais) references pais(id_pais)
);

-- Insertando datos en la tabla pais

INSERT INTO pais (nombre, continente, poblacion) VALUES
('Argentina', 'América del Sur', 46383191),
('Brasil', 'América del Sur', 212559409),
('Colombia', 'América del Sur', 51342000),
('Chile', 'América del Sur', 19116200),
('Ecuador', 'América del Sur', 17608330),
('Perú', 'América del Sur', 33139900),
('Venezuela', 'América del Sur', 28435900),
('España', 'Europa', 46755775),
('Francia', 'Europa', 65270000),
('Alemania', 'Europa', 83783757);

-- Insertando datos en la ciudad

INSERT INTO ciudad(nombre,id_pais) VALUES
('Bueno Aires', 1),
('Sao Paulo', 2),
('Piedecuesta',3),
('Concepcion', 4),
('Esmeralda', 5),
('Cusco', 6),
('Barinas',7),
('Barcelona',8),
('Paris',9),
('Berlin',10);

-- Insertando datos en la tabla idiomas

INSERT INTO idioma(idioma,id_idioma) VALUES
('Español',1),
('Portuges',2),
('Español',3),
('Español',4),
('Español',5),
('Español',6),
('Español',7),
('Español_España',8),
('Frances',9),
('Aleman',10);

-- Insertando datos en la tabla idoma_pais

INSERT INTO idioma_pais (id_idioma, id_pais, es_oficial) VALUES
(1, 1, 1), 
(2, 2, 1), 
(3, 3, 1), 
(4, 4, 1), 
(5, 5, 1), 
(6, 6, 1), 
(7, 7, 1), 
(8, 8, 1), 
(9, 9, 1), 
(10, 10, 1);


-- DESARROLLADO POR SEBASTIAN GARCIA LOYO C.C 1.116.780.130



