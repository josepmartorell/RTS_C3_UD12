drop database if exists `C3_UD12_18`;
create database if not exists `C3_UD12_18`;

use `C3_UD12_18`;



create table Personas (
	clavePersonal 	int,
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
	codigoInmueble 	int,
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


create table Compras(
	codigoCompra 	int,
    codigoInmueble 	int,
    clavePersonal 	int,
    fecha 			date,
    valor     		float,
    
    CONSTRAINT PRIMARY KEY (codigoCompra),
    CONSTRAINT FOREIGN KEY (codigoInmueble) REFERENCES Inmuebles(codigoInmueble) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY (clavePersonal) REFERENCES Clientes(clavePersonal) ON DELETE CASCADE ON UPDATE CASCADE
);


create table Pagos (
	codigoPago 		int,
    fecha 			date,
    valor			float,
    
    CONSTRAINT PRIMARY KEY (codigoPago)
);


create table Alquileres (
	codigoAlquiler 	int,
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


show tables;

commit;