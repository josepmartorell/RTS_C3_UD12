show databases;
drop database if exists C3_UD12_14;
create database C3_UD12_14;
use C3_UD12_14;

create table Usuarios (
	id_Usuario int auto_increment,
    contrasena varchar(50),
    nombre varchar(255),
    apellidos varchar(255),
    foto varchar(255),
    email varchar(255),
    direccion varchar(255),
    primary key (id_Usuario),
    unique key (email)
);

create table Telefonos (
	idAuto int auto_increment,
	id_Usuario int,
	numero int,
    primary key (idAuto),
    foreign key (id_Usuario) references Usuarios (id_Usuario)
    on delete cascade on update cascade
);

create table Bloqueados (
	idAuto int auto_increment,
	id_Usuario int,
    id_UsuarioBloqueado int,
    primary key (idAuto),
    foreign key (id_Usuario) references Usuarios (id_Usuario)
    on delete cascade on update cascade,
    foreign key (id_UsuarioBloqueado) references Usuarios (id_Usuario)
    on delete cascade on update cascade
);

create table Contactos (
	idAuto int auto_increment,
	id_Usuario int,
    id_UsuarioContacto int,
    comentario varchar(255),
    primary key (idAuto),
    foreign key (id_Usuario) references Usuarios (id_Usuario)
    on delete cascade on update cascade,
    foreign key (id_UsuarioContacto) references Usuarios (id_Usuario)
    on delete cascade on update cascade
);

create table Grupos (
	idAuto int auto_increment,
	id_Usuario int,
    id_UsuarioContacto int,
    nombre varchar(255),
    primary key (idAuto),
    foreign key (id_Usuario) references Usuarios (id_Usuario)
    on delete cascade on update cascade,
    foreign key (id_UsuarioContacto) references Contactos (idAuto)
    on delete cascade on update cascade
);

create table Comentarios (
	idAuto int auto_increment,
	id_Usuario int,
    texto varchar(255),
    imagen varchar(255),
    primary key (idAuto),
    foreign key (id_Usuario) references Usuarios (id_Usuario)
    on delete cascade on update cascade
);

create table UsuariosAutorizados (
	idAuto int auto_increment,
	id_Usuario int,
    id_UsuarioAutorizado int,
    id_Comentario int,
    primary key (idAuto),
    foreign key (id_Usuario) references Usuarios (id_Usuario)
    on delete cascade on update cascade,
    foreign key (id_UsuarioAutorizado) references Usuarios (id_Usuario)
    on delete cascade on update cascade,
    foreign key (id_Comentario) references Comentarios (idAuto)
    on delete cascade on update cascade
);

insert into Usuarios (contrasena, nombre, apellidos, foto, email, direccion) values
	('alpaca', 'asdf', 'pip pop', 'link imgur', 'asdf@asdfr.asdf', 'C/asdf asdf n4'),
    ('contrsena1', 'nombre1', 'apellidos1', 'link imgur', 'kgj@asdfr.asdf', 'C/asdf gkihf n4'),
    ('contrsena2', 'nombre2', 'apellidos2', 'link imgur', 'ghj90@asdfr.asdf', 'C/dsfhgdfgh n4'),
    ('contrsena3', 'nombre3', 'apellidos3', 'link imgur', 'ncvn@asdfr.asdf', 'C/lhijgn n4'),
    ('contrsena4', 'nombre4', 'apellidos4', 'link imgur', 'nb@asdfr.asdf', 'C/d n4');

insert into Usuarios (contrasena, nombre, apellidos, foto) values
	('pipo', 'nom1', 'apel1', 'imgur1'),
    ('pup', 'pip', 'pap', 'imgur2'),
    ('bn', 'nom2', 'apel2', 'imgur3'),
    ('mime', 'nom3', 'apel3', 'imgur4'),
    ('mimi', 'nom4', 'apel4', 'imgur5');

insert into Telefonos (id_Usuario, numero) values
	(1, '653457878'),
    (1, '612346789'),
    (2, '629476233'),
    (3, '629476233'),
    (3, '634563466'),
    (3, '678978978'),
    (3, '623423456'),
    (3, '623456765'),
    (3, '623342346'),
    (3, '634545856');

insert Bloqueados (id_Usuario, id_UsuarioBloqueado) values
	(1, 2),
    (2, 3),
    (4, 2),
    (4, 5),
    (4, 6),
    (4, 7),
    (4, 8),
    (4, 9),
    (4, 10),
    (5, 6);

insert Contactos (id_Usuario, id_UsuarioContacto, comentario) values
	(1, 3, 'Este es nombre2'),
    (1, 4, 'Este es nombre3'),
    (7, 8, 'Este es pep'),
    (7, 9, 'Este es paco'),
    (7, 10, 'Este es joel'),
    (5, 7, 'Este es josep'),
    (7, 5, 'Este es amigo'),
    (5, 8, 'Este es roger'),
    (5, 9, 'Este es vacino'),
    (5, 10, 'Este es casa');

insert Grupos (id_Usuario, id_UsuarioContacto, nombre) values
	(1, 1, 'GrupoAmigos'),
    (1, 2, 'GrupoAmigos'),
    (7, 1, 'GrupoTrabajo'),
    (7, 2, 'GrupoTrabajo'),
    (7, 3, 'GrupoTrabajo'),
    (7, 4, 'GrupoTrabajo'),
    (5, 1, 'GrupoVecinos'),
    (5, 2, 'GrupoVecinos'),
    (5, 3, 'GrupoVecinos'),
    (5, 4, 'GrupoVecinos');

insert Comentarios (id_Usuario, texto, imagen) values
	(1, 'Mi primer comentario', 'link imgur'),
    (7, 'Hello world!', 'link imgur'),
    (5, 'Hello world!', ''),
    (5, 'Hello world!', 'link imgur'),
    (5, 'Hello world!', 'link imgur'),
    (7, 'Hello world!', ''),
    (7, 'Hello world!', ''),
    (7, 'Hello world!', ''),
    (7, 'Hello world!', ''),
    (7, 'Hello world!', 'link imgur');
    
insert UsuariosAutorizados (id_Usuario, id_UsuarioAutorizado, id_Comentario) values
	(1, 3, 1),
    (1, 4, 1),
    (7, 1, 1),
    (7, 2, 1),
    (7, 3, 2),
    (7, 4, 2),
    (7, 5, 2),
    (7, 6, 3),
    (7, 7, 4),
    (7, 8, 5);
    
select * from Usuarios;