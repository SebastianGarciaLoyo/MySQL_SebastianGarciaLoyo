-- #################
-- ##### Dia 8 #####
-- #################

create database dia8;

use dia8;

create table productos(
	id int auto_increment primary key,
    nombre varchar(100),
    precio decimal(10,2)
);

insert into productos values
    (1,"Pepito",23.2),
    (2,"MousePad",100000.21),
    (3,"Espionap",2500.25),
    (4,"BOB-ESPONJA",1500.25),
    (5,"Cary",23540000.23),
    (6,"OvulAPP",198700.23),
    (7,"PapayAPP",2000.00),
    (8,"Menosprecio",3800.00),
    (9,"CariciasOlfer",2300.00),
    (10,"Perfume La Cumbre", 35000.25),
    (11,"Nevera M800",3000.12),
    (12,"Crema Suave", 2845.00),
    (13,"juego de mesa La Cabellera",9800.00);

select * from productos;

delimiter //
create function TotalConIVA(precio decimal(10,2))
returns decimal (10,2)
deterministic
begin
	if precio <1000 then
		return concat("Tu precio con mas descuento es:", precio+((precio*iva-2)/100));
	else
		return precio+((precio*iva)/100);
    end if;
end//
delimiter ;
drop function TotalConIVA;

select TotalConIVA(25000.300);

select nombre, TotalConIva(precio) as PrecioconIVA from productos where nombre = 'Cary';

delimiter //
create function buscarProducto(producto varchar(50))
returns varchar(255)
deterministic
begin
	select * from productos where nombre = producto;
end //

