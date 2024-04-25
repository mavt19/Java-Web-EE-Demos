create database dbprueba;
use prueba;


create table cargo
(
idcargo int primary key auto_increment,
nomcargo varchar(50)
);

CREATE TABLE persona (
  codper int(11) NOT NULL primary key auto_increment,
  nomper varchar(50) DEFAULT NULL,
  sueldo double DEFAULT NULL,
  idcargo int,
   FOREIGN KEY (idcargo) REFERENCES cargo (idcargo)
);

select * from cargo;
select * from persona;

select p.codper,p.nomper,p.sueldo,c.nomcargo,c.idcargo from persona p
join cargo c on p.idcargo=c.idcargo;