drop database if exists TA12_07_organigrama;
create database TA12_07_organigrama;
use TA12_07_organigrama;

create table empleado (
	EmpleID 			int(10),
	EmpleSegSocial 		varchar(50),
    EmpleNombre 		varchar(50),
    EmpleApellido1  	varchar(50),
    EmpleApellido2 		varchar(50),
	EmpleDireccion  	varchar(50),
    EmpleTelefono 		varchar(50),
    primary key (EmpleID)
);
    
create table departamento (
	DepartID				int(10),
    DepartArea				varchar(50),
    DepartUbicacion			varchar(50),
    primary key (DepartID)
);
    
create table contrato (
	ContrID  			int(10),
    ContrInicio			varchar(50),
    ContrFinal			varchar(50),
    ContrCategoria		varchar(50),
    primary key(ContrID)
);

create table nomina (
	NominID				int(10),
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
	foreign key (NominID) references nomina (NominaID)
    on delete cascade on update cascade,
    primary key (ContrID, NominID)
);


