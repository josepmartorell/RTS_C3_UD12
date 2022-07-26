drop database if exists `C3_UD12_18`;
create database if not exists `C3_UD12_18`;

use `C3_UD12_18`;

drop table if exists Personas;
drop table if exists Clientes;
drop table if exists Trabajadores;
drop table if exists Inmuebles;
drop table if exists Pisos;
drop table if exists Locales;
drop table if exists Garajes;
drop table if exists Compras;
drop table if exists Alquileres;
drop table if exists Pagos;

create table Personas (
	clavePersonal 	int auto_increment,
    dni           	varchar(9),
    telefono      	varchar(9),
    movil         	varchar(9),
    nombre        	nvarchar(255),
    apellidos     	nvarchar(255),
    
    CONSTRAINT PRIMARY KEY (clavePersonal)
);


create table Clientes (
	clavePersonal 	int,
    
    CONSTRAINT PRIMARY KEY (clavePersonal),
    CONSTRAINT FOREIGN KEY (clavePersonal) REFERENCES Personas(clavePersonal) ON DELETE CASCADE ON UPDATE CASCADE
);


create table Trabajadores (
	clavePersonal 	int,
    
    CONSTRAINT PRIMARY KEY (clavePersonal),
    CONSTRAINT FOREIGN KEY (clavePersonal) REFERENCES Personas(clavePersonal) ON DELETE CASCADE ON UPDATE CASCADE
);


create table Inmuebles (
	codigoInmueble 	int auto_increment,
    metros 			float,
    descripcion 	nvarchar(255),
    direccion 		nvarchar(255),
    
    CONSTRAINT PRIMARY KEY (codigoInmueble)
);


create table Garajes (
	codigoInmueble 	int,
    numGaraje 	   	int,
    planta 			int,
    
	CONSTRAINT PRIMARY KEY (codigoInmueble),
    CONSTRAINT FOREIGN KEY (codigoInmueble) REFERENCES Inmuebles(codigoInmueble) ON DELETE CASCADE ON UPDATE CASCADE
);


create table Pisos (
	codigoInmueble 	int,
    numGaraje 		int,
    codigoPiso 		int,
    
    CONSTRAINT PRIMARY KEY (codigoInmueble),
    CONSTRAINT FOREIGN KEY (codigoInmueble) REFERENCES Inmuebles(codigoInmueble) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY (numGaraje) REFERENCES Inmuebles(codigoInmueble) ON DELETE CASCADE ON UPDATE CASCADE
);


create table Locales (
	codigoInmueble 	int,
    uso  			nvarchar(255),
    servicio 		boolean,
    
    CONSTRAINT PRIMARY KEY (codigoInmueble),
    CONSTRAINT FOREIGN KEY (codigoInmueble) REFERENCES Inmuebles(codigoInmueble) ON DELETE CASCADE ON UPDATE CASCADE
);


create table Compras (
	codigoCompra 	int auto_increment,
    codigoInmueble 	int,
    clavePersonal 	int,
    fecha 			date,
    valor     		float,
    
    CONSTRAINT PRIMARY KEY (codigoCompra),
    CONSTRAINT FOREIGN KEY (codigoInmueble) REFERENCES Inmuebles(codigoInmueble) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY (clavePersonal) REFERENCES Clientes(clavePersonal) ON DELETE CASCADE ON UPDATE CASCADE
);


create table Pagos (
	codigoPago 		int auto_increment,
    fecha 			date,
    valor			float,
    
    CONSTRAINT PRIMARY KEY (codigoPago)
);


create table Alquileres (
	codigoAlquiler 	int auto_increment,
    codigoInmueble 	int,
    clavePersonal 	int,
    codigoPago 		int,
    agente 			nvarchar(255),
    propietario 	nvarchar(255),
    
    CONSTRAINT PRIMARY KEY (codigoAlquiler),
    CONSTRAINT FOREIGN KEY (codigoInmueble) REFERENCES Inmuebles(codigoInmueble) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY (clavePersonal) REFERENCES Clientes(clavePersonal) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY (codigoPago) REFERENCES Pagos(codigoPago) ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO Personas(dni, telefono, movil, nombre, apellidos) VALUES ('111111111', '111111111', '111111111', 'Pepito', 'Hernandez'),
																	 ('222222222', '222222222', '222222222', 'Pepita', 'Gonzalez'),
                                                                     ('333333333', '333333333', '333333333', 'Frederico', 'Cuchillitos'),
                                                                     ('444444444', '444444444', '444444444', 'Aitor', 'Menta');

INSERT INTO Clientes(clavePersonal) VALUES (1), (2);

INSERT INTO Trabajadores(clavePersonal) VALUES (3), (4);

INSERT INTO Inmuebles(metros, descripcion, direccion) VALUES (200.5, 'primer inmueble', 'primera direccion'),
															 (100.5, 'segundo inmueble', 'segunda direccion'),
                                                             (100.0, 'tercer inmueble', 'tercera dirección');

INSERT INTO Garajes(codigoInmueble, numGaraje, planta) VALUES (1, 10, 0);

INSERT INTO Pisos(codigoInmueble, numGaraje, codigoPiso) VALUES (2, 1, 5);

INSERT INTO Locales(codigoInmueble, uso, servicio) VALUES (3, 'Oficinas', true);

INSERT INTO Compras(codigoInmueble, clavePersonal, fecha, valor) VALUES (3, 1, '2022-07-26', 200000.0);

INSERT INTO Pagos(fecha, valor) VALUES ('2022-07-26', 1500.0);

INSERT INTO Alquileres(codigoInmueble, clavePersonal, codigoPago, agente, propietario) VALUES (2, 2, 1, 'Vende Humos', 'Señor Borde');

-- Replace values
REPLACE INTO Personas(clavePersonal, dni, telefono, movil, nombre, apellidos) VALUES (3,'333333333', '333333333', '333333333', 'Frederico', 'Navajas');

-- Double price
UPDATE Compras SET valor=valor*2 WHERE codigoCompra=1;

-- Delete the flat rented
DELETE FROM Inmuebles WHERE codigoInmueble=2;

commit;