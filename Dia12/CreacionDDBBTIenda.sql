-- #########################
-- ##### Taller Dia 12 #####
-- #########################

-- Creando y usando la base de datos Tienda

create database Tienda;
use Tienda;

-- Creando la tabla producto

create table producto(
	codigo_producto int primary key not null,
    nombre varchar(100) not null,
    precio double not null,
    codigo_fabricante int(10) not null,
    foreign key(codigo_fabricante) references fabricante(codigo_fabricante)
);

-- Creando la tabla fabricante

create table fabricante(
	codigo_fabricante int(10) primary key not null,
    nombre varchar(100) not null
);

insert into fabricante values(1,'Asus');
insert into fabricante values(2,'Lenovo');
insert into fabricante values(3,'Hewlett-Packard');
insert into fabricante values(4,'Samsung');
insert into fabricante values(5,'Seagate');
insert into fabricante values(6,'Crucial');
insert into fabricante values(7,'Gigabyte');
insert into fabricante values(8,'Huawei');
insert into fabricante values(9,'Xiaomi');

insert into producto values(1,'Disco duro SATA3 1TB',86.99,5);
insert into producto values(2,'Memoria RAM DDR4 8GB',120,6);
insert into producto values(3,'Disco SSD 1TB',150.99,4);
insert into producto values(4,'Geforce GTX 1050Ti',185,7);
insert into producto values(5,'Disco duro SATA3 1TB',755,6);
insert into producto values(6,'Disco duro SATA3 1TB',202,1);
insert into producto values(7,'Disco duro SATA3 1TB',245.99,1);
insert into producto values(8,'Disco duro SATA3 1TB',559,2);
insert into producto values(9,'Disco duro SATA3 1TB',444,2);
insert into producto values(10,'Disco duro SATA3 1TB',59.99,3);
insert into producto values(11,'Disco duro SATA3 1TB',180,3);