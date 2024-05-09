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
select * from gama_producto;
select * from producto;

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

select distinct codigo_cliente as Cliente, DATE_FORMAT(fecha_pago, "%Y") as Pago
from pago
group by codigo_cliente, fecha_pago
having date_format(fecha_pago, "%Y") = 2008;

-- Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. 
-- Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos.
-- Sin utilizar ninguna de las funciones anteriores.

select DISTINCT codigo_cliente as Cliente, SUBSTR(YEARWEEK(fecha_pago), 1,4) as Pago
from pago
where SUBSTR(YEARWEEK(fecha_pago), 1,4) = 2008;

-- Devuelve un listado con el código de pedido, código de cliente, 
--fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.


select codigo_pedido as Pedido, codigo_cliente as Cliente, fecha_esperada as Esperada, fecha_entrega as Entrega
from pedido
where fecha_esperada <> fecha_entrega;


-- Devuelve un listado con el código de pedido, código de cliente, 
--fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.
-- Utilizando la función ADDDATE de MySQL.

select codigo_pedido as Pedido, codigo_cliente as Cliente, fecha_esperada as Esperada, fecha_entrega as Entrega
from pedido
where ADDDATE(fecha_entrega, INTERVAL 2 DAY) = fecha_esperada;


-- Devuelve un listado con el código de pedido, código de cliente, 
--fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.
-- Utilizando la función DATEDIFF de MySQL.

select codigo_pedido as Pedido, codigo_cliente as Cliente, fecha_esperada as Esperada, fecha_entrega as Entrega
from pedido
where DATEDIFF(fecha_esperada,fecha_entrega) = 2;

-- Devuelve un listado con el código de pedido, código de cliente, 
--fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.
-- ¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?

select codigo_pedido as Pedido, codigo_cliente as Cliente, fecha_esperada as Esperada, fecha_entrega as Entrega
from pedido
where fecha_esperada - fecha_entrega = 2;

select codigo_pedido as Pedido, codigo_cliente as Cliente, fecha_esperada as Esperada, fecha_entrega as Entrega
from pedido
where fecha_entrega + 2 = fecha_esperada; 

-- Devuelve un listado de todos los pedidos que fueron en 2009.

select codigo_pedido as Pedido, fecha_pedido as Fecha_Pedido
from pedido
where YEAR(fecha_pedido) = 2009;


--Devuelve un listado de todos los pedidos que han sido  en el mes de enero de cualquier año.

select codigo_pedido as Pedido, fecha_pedido as Fecha_Pedido
from pedido
where MONTH(fecha_pedido) = 1;

-- Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

select fecha_pago as Fecha, forma_pago as Pago
from pago
where YEAR(fecha_pago) = 2008 and forma_pago = "PayPal"
ORDER BY fecha_pago desc;

-- Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.

select DISTINCT forma_pago
from pago;


-- Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.

select nombre as Producto, gama as Gama, cantidad_en_stock as Inventario, precio_venta as Precio
from producto
where gama = "Ornamentales" and cantidad_en_stock > 100
order by precio_venta desc;

-- Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.

select nombre_cliente as Cliente, ciudad as Ciudad, codigo_empleado_rep_ventas as Representante
from cliente
where ciudad = "Madrid" and codigo_empleado_rep_ventas BETWEEN 11 and 30;

-- Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.

select c.nombre_cliente as Cliente,  CONCAT(e.nombre,' ', e.apellido1,' ', e.apellido2,' ') as Empleado, e.puesto as Puesto
from cliente as c
inner join empleado as e on c.codigo_empleado_rep_ventas = e.codigo_empleado
where e.puesto = "Representante Ventas";

-- Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.

select c.nombre_cliente as Cliente, CONCAT(e.nombre,' ', e.apellido1,' ', e.apellido2,' ') as Empleado, e.puesto as Puesto, p.forma_pago as Pago
from pago as p
inner join cliente  c on p.codigo_cliente = c.codigo_cliente
inner join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado
where e.puesto = "Representante Ventas";

-- Muestra el nombre de los clientes que  hayan realizado pagos junto con el nombre de sus representantes de ventas.

SELECT FCP.nombre_cliente, CONCAT(E.nombre, ' ', E.apellido1, ' ', IF(E.apellido2 IS NOT NULL, E.apellido2, '')) AS nombre_representante, FCP.forma_pago, E.puesto
    FROM(
        SELECT *
        FROM pago AS P
        NATURAL JOIN cliente AS C
    ) FCP  #FCP = Filtrado de Cliente por Pago
    INNER JOIN empleado AS E ON FCP.codigo_empleado_rep_ventas = E.codigo_empleado
    WHERE E.puesto = "Representante Ventas";


-- Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

SELECT C.nombre_cliente, CONCAT(E.nombre, ' ', E.apellido1, ' ', IF(E.apellido2 IS NOT NULL, E.apellido2, '')) AS nombre_representante, O.ciudad AS ciudad_oficina, P.forma_pago, E.puesto
    FROM pago AS P
    INNER JOIN cliente AS C ON P.codigo_cliente = C.codigo_cliente
    INNER JOIN empleado AS E ON C.codigo_empleado_rep_ventas = E.codigo_empleado
    INNER JOIN oficina AS O ON E.codigo_oficina = O.codigo_oficina
    WHERE E.puesto = "Representante Ventas";