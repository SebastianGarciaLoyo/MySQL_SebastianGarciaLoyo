-- #################
-- ##### dia 11 #####
-- #################

show databases;
use mysql;
show tables;
select * from user;

-- Revisar los usuarios creados
select user, host from mysql.user;
create database EjemploClase;
use EjemploClase;

-- Crear un usuario
create user 'pedro'@'localhost' identified by 'pedro123';

-- Revisar los permisos que el usuario tiene
show GRANTS for 'pedro'@'localhost';
create user 'pedro'@'172.16.101.132' identified by 'pedro123';
show GRANTS for 'pedro'@'172.16.101.132';

-- doy permisos
grant select , insert , update, delete on *.* to 'pedro'@'172.16.101.132';
flush privileges;