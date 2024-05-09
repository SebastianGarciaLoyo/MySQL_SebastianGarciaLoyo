-- ##########################
-- ##### Ejercicio Dia4 #####
-- ##########################

use Jardineria;

-- Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

select * from oficina;
select * from empleado;
select * from cliente;
select * from pedido;
select * from detalle_pedido;
select * from pago;

select codigo_oficina as Codigo, ciudad as Ciudad
from oficina;


-- Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

select pais as Pais ,ciudad as Ciudad, telefeno as Telefono
from oficina
where pais = "España";


-- Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.

select nombre as Nombre, apellido1 as Apellido_1, apellido2 as Apellido_2, email as Email, codigo_jefe as Jefe
from empleado
where codigo_jefe = 7;


-- Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

select nombre as Nombre, apellido1 as Apellido_1, apellido2 as Apellido_2, email as Email, codigo_jefe as Boss, puesto as Puesto
from empleado
where codigo_jefe is NULL;


-- Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.

select nombre as Nombre, apellido1 as Apellido_1, apellido2 as Apellido_2, puesto as Puesto
from empleado
where puesto <> "Representante Ventas";


-- Devuelve un listado con el nombre de los todos los clientes españoles.

select nombre_cliente as Nombre, ciudad as Ciudad, region as Region, pais as Pais
from cliente
where pais = "Spain";


-- Devuelve un listado con los distintos estados por los que puede pasar un pedido.

select codigo_pedido as Pedido, estado as Estado
from pedido;


-- Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. 
-- Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos.  
-- (Utilizando la función YEAR de MySQL.)

select distinct codigo_cliente as Cliente, year(fecha_pago) as Pago
from pago
group by codigo_cliente, fecha_pago 
having year(fecha_pago) = 2008;

-- Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. 
-- Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos.
-- Utilizando la función DATE_FORMAT de MySQL. 

select codigo_cliente as Cliente, DATE_FORMAT(fecha_pago,"%Y") as Pago
from pago;

