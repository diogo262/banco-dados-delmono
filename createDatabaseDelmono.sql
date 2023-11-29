create database db_delmono;

use db_delmono;

create table tbl_mesa (
	idMesa int auto_increment primary key,
    numAssentos varchar(2) not null,
    localizaMesa varchar(2) not null,
    disponibilidadeMesa varchar(15) not null
);

create table tbl_cardapio (
	idCardapio int auto_increment primary key,
    pratoCardapio varchar(20) not null,
    descricaoPrato varchar(45) not null,
    ingredientesPrato varchar(45) not null,
    precoPrato decimal(8, 2) not null
);

create table tbl_funcionario(
	idFuncionario int auto_increment primary key,
    nomeFunc varchar(35) not null,
    contratoFunc varchar (25) not null,
    idCardapio int not null,
    foreign key(idCardapio) references tbl_cardapio(idCardapio)
);

create table tbl_atende(
	idMesa int not null,
    idFuncionario int not null,
    primary key(idMesa, idFuncionario),
	foreign key(idMesa) references tbl_mesa(idMesa),
    foreign key(idFuncionario) references tbl_funcionario(idFuncionario)
);

 create table tbl_cliente(
	idCliente int auto_increment primary key,
    cpfCliente varchar(14) not null,
    nomeCliente varchar(35) not null,
    idCardapio int not null,
    foreign key(idCardapio) references tbl_cardapio(idCardapio)
 );
 
 create table tbl_telefonecli(
	idCliente int not null,
    numTelefone varchar(14) not null,
	primary key(numTelefone, idCliente),
    foreign key(idCliente) references tbl_cliente(idCliente)
 );
 
  create table tbl_reserva(
	idReserva int auto_increment primary key,
    idMesa int not null,
    foreign key(idMesa) references tbl_mesa(idMesa),
    idCliente int not null,
    foreign key(idCliente) references tbl_cliente(idCliente)
  );