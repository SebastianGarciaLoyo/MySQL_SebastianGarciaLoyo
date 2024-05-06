-- Creando la base de datos

create database Escuela;

use Escuela;

drop table persona;

-- Insertando las Tablas.

create table persona(
	id_persona int(10) unsigned primary key auto_increment not null,
	nif varchar(9) null,
	nombre varchar(25) not null,
	apellido1 varchar(50) not null,
	apellido2 varchar(50) null,
	ciudad varchar(25) not null,
	direccion varchar(50) not null,
	telefono varchar(9) null,
	fecha_nacimiento date not null,
	sexo enum('H','M') not null,
	tipo enum('...') not null
);

create table asignatura(
	id_asignatura int(10) unsigned primary key auto_increment not null,
	nombre varchar(100) not null,
	creditos float not null,
	tipo enum('...') not null,
	curso tinyint(3) not null,
	cuatrimestre tinyint not null,
	id_profesor int(10) unsigned null,
	id_grado int(10) unsigned not null,
	foreign key(id_profesor) references profesor(id_profesor),
	foreign key(id_grado) references grado(id_grado)
);

create table profesor(
	id_profesor int(10) unsigned primary key auto_increment not null,
	id_departamento int(10) unsigned  not null,
	foreign key(id_departamento) references departamento(id_departamento)
);

create table departamento(
	id_departamento int(10) unsigned primary key auto_increment not null,
	nombre varchar(50) not null
);

create table grado(
	id_grado int(10) unsigned primary key auto_increment not null,
	nombre varchar(100) not null
);

create table alumno_se_matricula_asignatura(
	id_persona int(10) unsigned not null,
	id_asignatura int(10) unsigned not null,
	id_curso_escolar int(10) unsigned not null,
	primary key(id_persona,id_asignatura,id_curso_escolar),
	foreign key(id_persona) references persona(id_persona),
	foreign key(id_asignatura) references asignatura(id_asignatura),
	foreign key(id_curso_escolar) references curso_escolar(id_curso_escolar)
);

create table curso_escolar(
	id_curso_escolar int(10) unsigned primary key auto_increment not null,
	anyo_inicio year(4) not null,
	anyo_fin year(4) not null
);