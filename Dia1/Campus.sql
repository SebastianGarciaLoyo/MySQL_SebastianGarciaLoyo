create database Campus;

use Campus;

drop table if exists camper;

drop table if exists trainer;

drop table if exists Salon_Camper;

drop table if exists Camper_Trainer;

drop table if exists Salon;



select * from camper;

select * from trainer;

select * from asignaturas;

select * from rutas;

select * from salon;

select * from clases;

select * from Camper_Trainer;

select * from Rutas_Asignaturas;

create table camper(
	id_camper int unsigned primary key not null,
	Nombre varchar(100) not null,
	Apellido varchar(100) not null,
	Correo varchar(65) not null,
	Edad int not null,
	Sexo varchar(20) not null
);

create table trainer(
	id_trainer int unsigned primary key not null,
	Nombre varchar(100) not null,
	Apellido varchar(100) not null,
	Correo varchar(65) not null,
	Edad int not null,
	Sexo varchar(20) not null,
	Especialidad varchar(100) not null
);

create table asignaturas(
	id_asig int unsigned primary key not null,
	Nombre varchar(100) not null,
	Tipo_Asig varchar(100) not null
);

create table rutas(
	id_ruta int unsigned primary key not null,
	Nombre varchar(100) not null,
	Tipo_Ruta varchar(50) not null
);

create table salon(
	id_salon int unsigned primary key not null,
	Nombre varchar(100) not null,
	Cantidad_Camper int not null,
	Cantidad_Trainer int not null
);

create table clases(
	id_clases int unsigned primary key not null,
	Nombre varchar(100) not null,
	Tipo_Clases varchar(100) not null
);

create table Camper_Trainer(
	id_camper int unsigned not null,
	id_trainer int unsigned not null,
	foreign key(id_camper) references camper(id_camper),
	foreign key(id_trainer) references trainer(id_trainer)
);

create table Rutas_Asignaturas(
	id_ruta int unsigned not null,
	id_asig int unsigned not null,
	foreign key(id_ruta) references rutas(id_ruta),
	foreign key(id_asig) references asignaturas(id_asig)
);

-- Insertando datos aleatorios en la tabla camper
INSERT INTO camper (id_camper, Nombre, Apellido, Correo, Edad, Sexo) VALUES
(1, 'Juan', 'Perez', 'juanperez@example.com', 25, 'Masculino'),
(2, 'Maria', 'Gonzalez', 'mariagonzalez@example.com', 28, 'Femenino'),
(3, 'Pedro', 'Martinez', 'pedromartinez@example.com', 23, 'Masculino'),
(4, 'Ana', 'Lopez', 'analopez@example.com', 30, 'Femenino'),
(5, 'Carlos', 'Garcia', 'carlosgarcia@example.com', 27, 'Masculino'),
(6, 'Laura', 'Rodriguez', 'laurarodriguez@example.com', 26, 'Femenino'),
(7, 'Diego', 'Hernandez', 'diegohernandez@example.com', 24, 'Masculino'),
(8, 'Sofia', 'Diaz', 'sofiadiaz@example.com', 29, 'Femenino'),
(9, 'Luisa', 'Sanchez', 'luisasanchez@example.com', 31, 'Femenino'),
(10, 'Javier', 'Ramirez', 'javierramirez@example.com', 22, 'Masculino');

-- Insertando datos aleatorios en la tabla trainer
INSERT INTO trainer (id_trainer, Nombre, Apellido, Correo, Edad, Sexo, Especialidad) VALUES
(1, 'Alejandro', 'Lopez', 'alejandrolopez@example.com', 35, 'Masculino', 'Yoga'),
(2, 'Paula', 'Martinez', 'paulamartinez@example.com', 32, 'Femenino', 'Pilates'),
(3, 'Jorge', 'Gonzalez', 'jorgegonzalez@example.com', 38, 'Masculino', 'CrossFit'),
(4, 'Carolina', 'Rodriguez', 'carolinarodriguez@example.com', 34, 'Femenino', 'Spinning'),
(5, 'Daniel', 'Sanchez', 'danielsanchez@example.com', 36, 'Masculino', 'Boxeo'),
(6, 'Valeria', 'Hernandez', 'valeriahernandez@example.com', 33, 'Femenino', 'Zumba'),
(7, 'Miguel', 'Perez', 'miguelperez@example.com', 37, 'Masculino', 'Entrenamiento Funcional'),
(8, 'Natalia', 'Garcia', 'nataliagarcia@example.com', 30, 'Femenino', 'Artes Marciales'),
(9, 'Fernando', 'Diaz', 'fernandodiaz@example.com', 39, 'Masculino', 'Cardio'),
(10, 'Monica', 'Luna', 'monicaluna@example.com', 31, 'Femenino', 'Entrenamiento Personal');

-- Insertando datos aleatorios en la tabla asignaturas
INSERT INTO asignaturas (id_asig, Nombre, Tipo_Asig) VALUES
(1, 'Matemáticas', 'Teórica'),
(2, 'Historia', 'Teórica'),
(3, 'Biología', 'Práctica'),
(4, 'Química', 'Práctica'),
(5, 'Educación Física', 'Práctica'),
(6, 'Inglés', 'Teórica'),
(7, 'Arte', 'Práctica'),
(8, 'Música', 'Práctica'),
(9, 'Física', 'Teórica'),
(10, 'Geografía', 'Teórica');

-- Insertando datos aleatorios en la tabla rutas
INSERT INTO rutas (id_ruta, Nombre, Tipo_Ruta) VALUES
(1, 'Ruta 1', 'Senderismo'),
(2, 'Ruta 2', 'Ciclismo'),
(3, 'Ruta 3', 'Montañismo'),
(4, 'Ruta 4', 'Bicicleta de Montaña'),
(5, 'Ruta 5', 'Running'),
(6, 'Ruta 6', 'Escalada'),
(7, 'Ruta 7', 'Paseo'),
(8, 'Ruta 8', 'Natación'),
(9, 'Ruta 9', 'Kayak'),
(10, 'Ruta 10', 'Esquí');

-- Insertando datos aleatorios en la tabla salon
INSERT INTO salon (id_salon, Nombre, Cantidad_Camper, Cantidad_Trainer) VALUES
(1, 'Salón 1', 20, 2),
(2, 'Salón 2', 15, 3),
(3, 'Salón 3', 25, 2),
(4, 'Salón 4', 18, 4),
(5, 'Salón 5', 22, 3),
(6, 'Salón 6', 17, 2),
(7, 'Salón 7', 19, 3),
(8, 'Salón 8', 23, 4),
(9, 'Salón 9', 16, 2),
(10, 'Salón 10', 21, 3);

-- Insertando datos aleatorios en la tabla clases
INSERT INTO clases (id_clases, Nombre, Tipo_Clases) VALUES
(1, 'Clase 1', 'Yoga'),
(2, 'Clase 2', 'Pilates'),
(3, 'Clase 3', 'CrossFit'),
(4, 'Clase 4', 'Spinning'),
(5, 'Clase 5', 'Boxeo'),
(6, 'Clase 6', 'Zumba'),
(7, 'Clase 7', 'Entrenamiento Funcional'),
(8, 'Clase 8', 'Artes Marciales'),
(9, 'Clase 9', 'Cardio'),
(10, 'Clase 10', 'Entrenamiento Personal');

-- Insertando datos aleatorios en la tabla Camper_Trainer
INSERT INTO Camper_Trainer (id_camper, id_trainer) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Insertando datos aleatorios en la tabla Rutas_Asignaturas
INSERT INTO Rutas_Asignaturas (id_ruta, id_asig) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);