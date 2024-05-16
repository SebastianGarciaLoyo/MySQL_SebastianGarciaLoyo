-- ##########################
-- ##### Ejercicio Dia6 #####
-- ##########################

-- TITULO: NORMALIZACION DE BASE DE DATOS
-- ¿Que es Normalizar?: Reducir las posibles redundancias de datos y
-- con ello mejorar la integridad de los datos.

-- Pasos principales para la normalizacion
-- Primera Forma Normal (1NF) "Reducir"
-- Segunda Froma Normal (2NF) "Redundancia"
-- Tercera Forma Normal (3NF) "Independencia"

-- ########## Primera Forma Normal (1NF) ##########
-- En la 1NF se busca eliminar las repeticiones de datos y asegurar con ellos que cada columna
-- contenga un solo valor atòmico(Dato que no se puede dividir, sea por conveniencia o por especificacion
-- del lenguaje)

-- Ej: nombrecompleto = PEDRO FELIPE GOMEZ BONILLA --> ¿Es atòmico?
-- RTA: No, por que se puede dividir en nombres o apellidos

-- Ej2: nombre=Pedro Felipe, apellido=Gomez Bonilla --> ¿Es atòmico?
-- RTA: Depende del diseñador de base de datos, pues es un criterio muy subjetivo

-- EX1: ¿El siguiente query esta normalizado de acuerdo al 1NF?

create database dia6;
use dia6;

create table Estudiante(
	ID int,
	Nombre varchar(100),
	Telefono varchar(15)
);

-- RTA: No, por que el usuario esta ingresando el nombre completo. Àun asi, si el diseñador lo
-- ve pertinente por los requisitos empresariales, la puede dejar asi.

-- ¿Como podemos normalizarla, ya habiendo creado la tabla anteriormente?
alter table Estudiante
	add Apellido varchar(100);
	
-- Manera #2 de mostrar informacion de la tabla
describe Estudiante;
insert into Estudiante(ID,nombre,Apellido,Telefono) values

-- Alterar la tabla existente
alter table Estudiante add Edad varchar(2) not null;
drop table Estudiante;

-- Creacion de la tabla de estudiante

create table curso(
	ID_curso int primary key,
	Nombre_curso varchar(50),
	Estudiantes_Inscritos varchar(50)
);

insert into curso values
	(101,'Matematicas','Ana','Juan','Maria')
	(102,'Historia','Pedro','Luis','Ana','Carmen')
	(103,'Fisica','Juan','Carmen','Beatriz')

select * from curso;

TRUNCATE curso;


alter table curso
change column Estudiantes_Inscritos Estudiante varchar(100)

insert into curso values
	(101,'Matematicas','Ana')
	(101,'Matematicas','Juan')
	(101,'Matematicas','Maria')
	(102,'Historia','Pedro')
	(102,'Historia','Luis')
	(102,'Historia','Carmen')
	(103,'Fisica','Juan')
	(103,'Fisica','Carmen')
	(103,'Fisica','Beatriz')

	
-- ########## Segunda Forma Normal (2FN) ###########
-- Es cuando una tabla està en la forma 1NF, donde cada atributo que no forma parte de la
-- clave primaria es COMPLETAMENTE DEPENDIENTE de la clave primaria.

-- Dicha 2NF se aplica a las tablas que tienen claves primarias compuestas de dos o mas atributos
-- si una tabla esta en 1FN y su clave primaria es simple (Tiene un solo atributo), entonces
-- su 2NF.
	
-- Lo que busca hacer la 2NF es que cada atributo no clave en una tabla deba depender completamente
-- de la clave primaria de esa tabla, mas no ser una parte de ella.
	
	
-- Requisito: Estar en la 1NF donde todos los atributos no claves deban depender totalmente de la clave primaria
-- En otras palabras, el nombre del curso es dependiente del id de este mismo, pero estan juntan. Dicho esto, debe
-- buscar una manera de INDEPENDIZAR dichos datos.
		
	
