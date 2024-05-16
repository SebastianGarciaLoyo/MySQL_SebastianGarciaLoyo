-- ###########################
-- ###### Quiz Sorpresa ######
-- ###########################


-- Usando la base de datos Colegio

use  Colegio;


-- Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados.
-- El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. 
-- El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor.
-- El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.

select p.nombre, p.apellido1, p.apellido2, d.nombre
from profesor as p
left join departamento as d on d.id_departamento  = p.id_profesor
order by d.nombre asc, p.nombre asc, p.apellido1 asc, p.apellido2 asc;


-- Devuelve un listado con los profesores que no están asociados a un departamento.

select p.nombre, p.apellido1, p.apellido2, d.nombre
from profesor as p
left join departamento as d on d.id_departamento  = p.id_profesor
where d.nombre is NULL;

-- Devuelve un listado con los departamentos que no tienen profesores asociados.

select d.nombre, p.nombre, p.apellido1, p.apellido2
from departamento d
left join profesor p on p.id_profesor = d.id_departamento
where p.nombre is null;

-- Devuelve un listado con los profesores que no imparten ninguna asignatura.

select p.nombre, p.apellido1, p.apellido2, a.nombre
from profesor p 
right join asignatura a on a.id_asignatura = p.id_profesor
where p.nombre  is  null;

-- Devuelve un listado con las asignaturas que no tienen un profesor asignado.

select * from asignatura 
where id_profesor is null;

-- Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. 
-- El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.

select 


-- Devuelve el número total de alumnas que hay.

select COUNT(sexo) as total
from alumno
where sexo = "M";

-- Calcula cuántos alumnos nacieron en 1999.

select COUNT(fecha_nacimiento) as nacieron_en_1999
from alumno
where YEAR(fecha_nacimiento) = 1999;


-- Calcula cuántos profesores hay en cada departamento. 
-- El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento.
-- El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.

select d.nombre, COUNT(p.nombre) as Total_Profesores
from departamento d 
right join profesor p on d.id_departamento = p.id_profesor
group by d.nombre
order by d.nombre asc;

-- Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno.
-- Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas.
-- Estos grados también tienen que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.

select g.nombre as Nombre_Grado, a.nombre as Nombre_Asignatura
from grado g 
right join asignatura a on a.id_asignatura  = g.id_grado; 


-- Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno,
-- de los grados que tengan más de 40 asignaturas asociadas.

select g.nombre as Nombre_Grado, COUNT(a.nombre) as Total
from grado g 
right join asignatura a on a.id_asignatura = g.id_grado
group by g.nombre;


-- Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura.
-- El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. 
-- Ordene el resultado de mayor a menor por el número total de crédidos.

select g.nombre as Nombre_Grado, a.nombre as Tipo_De_Asignatura, SUM(a.creditos) as Total
from grado g 
right join asignatura a on a.id_asignatura = g.id_grado
group by g.nombre, a.nombre, a.creditos;


-- Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares.
-- El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.

select 


select * from asignatura;

select * from departamento;

select * from grado;

select * from alumno;

select * from alumno_se_matricula_asignatura;

select * from curso_escolar;

select * from profesor;



