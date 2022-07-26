-- SET sql_safe_updates=0;

drop database if exists TA12_07_organigrama;
create database TA12_07_organigrama;
use TA12_07_organigrama;

drop table if exists empleado;
drop table if exists departamento;
drop table if exists contrato;
drop table if exists nomina;
drop table if exists firma;
drop table if exists pertenece;
drop table if exists genera;


create table empleado (
	EmpleID 			int auto_increment,
	EmpleSegSocial 		varchar(50),
    EmpleNombre 		varchar(50),
    EmpleApellido1  	varchar(50),
    EmpleApellido2 		varchar(50),
	EmpleDireccion  	varchar(50),
    EmpleTelefono 		varchar(50),
    primary key (EmpleID)
);
    
create table departamento (
	DepartID				int auto_increment,
    DepartArea				varchar(50),
    DepartUbicacion			varchar(50),
    primary key (DepartID)
);
    
create table contrato (
	ContrID  			int auto_increment,
    ContrInicio			datetime,
    ContrFinal			datetime,
    ContrCategoria		varchar(50),
    primary key(ContrID)
);

create table nomina (
	NominID				int auto_increment,
    NominFecha			datetime,
    NominSalario		float,
	primary key (NominID)
);

create table firma (
	id				int auto_increment,
	EmpleID 		int(10),
    ContrID			int(10),
	primary key (id),
    foreign key (EmpleID) references empleado (EmpleID)
    on delete cascade on update cascade,
	foreign key (ContrID) references contrato (ContrID)
    on delete cascade on update cascade
);

create table pertenece (
	EmpleID 			int(10),
    DepartID			int(10),
    foreign key (EmpleID) references empleado (EmpleID)
    on delete cascade on update cascade,
	foreign key (DepartID) references departamento (DepartID)
    on delete cascade on update cascade,
    primary key (EmpleID, DepartID)
);

create table genera (
	ContrID 			int(10),
    NominID				int(10),
    foreign key (ContrID) references contrato (ContrID)
    on delete cascade on update cascade,
    primary key (ContrID, NominID)
);

alter table genera
add foreign key (NominID) references nomina (NominID)
on delete cascade on update cascade; 

insert into empleado (EmpleSegSocial, 
					  EmpleNombre, 
                      EmpleApellido1, 
					  EmpleApellido2, 
                      EmpleDireccion, 
                      EmpleTelefono) values ( '000000000000', 'Jose', 'Manchego', 'Audaz', 'C/ Pez 1' ,'666000000' ),
										    ( '111111111111', 'Juan', 'Sastre', 'Bonilla', 'Avd/ De los árboles 56' ,'666111111' ),
										    ( '222222222222', 'Esther', 'Maroto', 'Cabestro', 'C/ Roquetas 12' ,'666222222' ),
										    ( '333333333333', 'Ana', 'Sobrio', 'Bodegero', 'C/ Punxadas 2' ,'666333333' ),
										    ( '444444444444', 'Felipe', 'Gorrero', 'Pijuán', 'Avd/ Rocaplana 123' ,'666444444' ),
										    ( '555555555555', 'Roman', 'Binualles', 'Cortés', 'C/ Cabestrany 41' ,'666555555' ),                                            										    
                                            ( '777777777777', 'Pepe', 'Rueda', 'Pinchada', 'Avd/ del Desastre 13' ,'666666666' ),
										    ( '666666666666', 'Braulio', 'Montecada', 'Postillo', 'C/ Pollinos 3' ,'666777777' ),
										    ( '888888888888', 'Ronaldo', 'Moreno', 'Cortado', 'Avd/ de los Amantes 23' ,'666888888' ),
                                            ( '888888888888', 'Elena', 'Merino', 'Guzmán', 'C/ Peladilla 2' ,'666999999' ),
										    ( '999999999999', 'Perico', 'Delgado', 'Montero', 'C/ Viñualles 1' ,'777000000' );
										 
										 
                                      
insert into departamento (DepartArea, 
                          DepartUbicacion) values ('Marketing', 'Ala este'),
												  ('Facturacion', 'Ala este'),
                                                  ('Incidencias', 'Ala este'),
                                                  ('I+D', 'Ala este'),
                                                  ('Ciberseguridad', 'Ala oeste'),
                                                  ('Diseño', 'Ala oeste'),
                                                  ('Atención al cliente', 'Ala sur'),
                                                  ('Aprovisionamiento', 'Ala norte'),
                                                  ('Desarrollo de Software', 'Ala norte'),
                                                  ('Administración', 'Ala norte');

insert into contrato (ContrInicio, 
					  ContrFinal,
                      ContrCategoria) values ('2021-04-22', '2021-09-22', 'Técnico auxiliar'),
											 ('2021-08-12', '2021-12-12', 'Técnico auxiliar'),
											 ('2021-02-26', '2021-07-26', 'Técnico auxiliar'),
											 ('2019-02-03', '2021-08-03', 'Técnico auxiliar'),
											 ('2019-02-17', '2021-06-17', 'Jefe Administración'),
											 ('2019-02-04', '2021-07-04', 'Ingeniero Informático'),
											 ('2017-03-29', '2021-08-29', 'Desarrollador Java'),
											 ('2017-04-30', '2021-09-30', 'Desarrollador Java'),
											 ('2016-05-02', '2021-11-02', 'Desarrollador Java'),
											 ('2015-06-09', '2021-09-09', 'Desarrollador Java');
                                              
insert into nomina (NominFecha, 
					NominSalario) values ('2021-05-22', 1605.50),
										 ('2021-06-22', 1600.00),
										 ('2021-07-22', 1610.00),
										 ('2021-08-22', 1699.00),
										 ('2019-03-04', 3100.00),
										 ('2019-04-04', 3100.00),
										 ('2017-04-29', 2508.00),
										 ('2017-05-29', 2559.00),
										 ('2017-06-29', 2600.50),
										 ('2017-07-29', 2700.00);
                                         
 insert into firma (id, 
				    EmpleID, 
					ContrID) values ( 1, 1, 1),
									( 2, 2, 2),
									( 3, 3, 3),
									( 4, 4, 4),
								    ( 5, 5, 5),
									( 6, 6, 6),
									( 7, 7, 7),
									( 8, 8, 8),
									( 9, 9, 9),
									( 10, 10, 10);

-- test de integridad referencial

DELETE FROM empleado WHERE EmpleID=1;

DELETE FROM firma WHERE EmpleID=2;

select * from empleado;




