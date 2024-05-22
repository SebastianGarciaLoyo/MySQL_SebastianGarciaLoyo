-- ##################
-- ##### Dia 12 #####
-- ##################

-- Consulta y usar BBDD

use world;
show tables;

select * from city;
select * from city where CountryCode = 'GBR';
select count(*) from city where CountryCode = 'GBR';
select * from country;


-- Creemos un query complejo

select * from city where Name='peking';
select * from city where CountryCode= 'CHN';
select * from city where CountryCode= 'CHN' and Population > 2243000;

-- Creacion de index

create index idx_cityName on city(Name);
create index idx_cityCountry on city(CountryCode);

-- Revisar indexaciones creadas

show keys from city; -- Forma 1
show index from city; -- Forma 2

-- Hacer estudio de rendimiento de un index
explain analyze select * from city where Name = 'Bogota';

SELECT database_name, table_name, index_name,
ROUND(stat_value * @@innodb_page_size / 1024 / 1024, 2) size_in_mb
FROM mysql.innodb_index_stats
WHERE stat_name = 'size' AND index_name != 'PRIMARY'
ORDER BY size_in_mb DESC;