create database systoyanka;
use systoyanka;

create table shopping (
idshopping int primary key auto_increment,
nome varchar(45),
cnpj char(14) unique,
tel char (10)
);


Create table endereco (
idEndereço int primary key auto_increment,
cidade varchar(45),
bairro varchar (45),
cep varchar (9),
 fkshoppingE int,
 constraint foreign key fkshoppingE (fkshoppingE) references Shopping (idshopping) 
);


create table sensor (
idSensor int primary key auto_increment,
andar char(2),
bloco varchar (4),
fkShoppingS int,constraint foreign key fkshoppingS (fkshoppingS) references Shopping (idshopping)
);

create table leitura (
idResposta int auto_increment,
dt_hora DATETIME, 
statusRetorno int,
fkSensor int,constraint foreign key fkSensor (fkSensor) references Sensor (idSensor),
primary key (idResposta, fkSensor)
);

create table usuario (
idUsuario int auto_increment,
login varchar(45),
senha varchar(45),
tipo varchar(45), constraint chkTipo 
check (tipo in ('Admin','user')),
fkShopping int,constraint foreign key fkShopping (fkShopping) references Shopping (idshopping),
primary key (idUsuario, fkShopping)
);

insert into shopping (nome, cnpj, telefone) values
 ('Shopping Praça da moça', '52678945301254', '1185461247'),
 ('Shopping Aricanduva', '24355214544132', '1140674545'),
 ('Shopping JK Iguatemi', '64589092093425', '1140664066');

insert into endereco (cidade, bairro, cep, fkshoppingE) values
 ( 'Diadema', 'Praça Da Moça','09910-720', 1),
('São Paulo', 'aricanduva','03527-900', 2),
('São Paulo', 'Vila Olímpia','04543-011', 3);

insert into sensor (andar, bloco, fkshoppingS) values
(01,'A',1),
(01,'A',2),
(01,'A',3),
(01,'B',1),
(01,'B',2),
(01,'B',3),
(01,'C',1),
(01,'C',2),
(01,'C',3),
(01,'D',1),
(01,'D',2),
(01,'D',3),
(02,'A',1),
(02,'A',2),
(02,'A',3),
(02,'B',1),
(02,'B',2),
(02,'B',3),
(02,'C',1),
(02,'C',2),
(02,'C',3),
(02,'D',1),
(02,'D',2),
(02,'D',3),
(03,'A',1),
(03,'A',2),
(03,'A',3),
(03,'B',1),
(03,'B',2),
(03,'B',3),
(03,'C',1),
(03,'C',2),
(03,'C',3),
(03,'D',1),
(03,'D',2),
(03,'D',3);

insert into leitura (dt_hora, statusRetorno, fksensor) values
('2022-10-23 19:50:00', 1, 1),
('2022-10-22 18:43:00', 1, 2),
('2022-10-20 14:15:00', 0, 3),
('2022-10-05 17:10:00', 1, 4),
('2022-10-30 16:15:00', 1, 5);

insert into usuario values
(1, 'Brandão@sptech', 'sptech', 'Admin', 3),
(2, 'Caramico@sptech', '12345', 'Admin', 1),
(3, 'Victor@sptech', '40674545', 'user', 2);

select * from endereço;

select * from shopping;

select * from sensor;

select * from leitura;

select * from usuario;

select SUM(statusRetorno) 'Soma dos retornos' from leitura;

select * from shopping
	join endereco
		on idShopping = fkShoppingE;
    
select * from shopping
	join sensor 
		on idShopping = fkShoppingS;

select * from sensor 
	join leitura 
		on idSensor = fkSensor;
    
select * from sensor
	join leitura 
		on idSensor = fksensor;
    
select * from shopping
	join endereço 
		on idShopping = fkShoppingE
    join sensor
		on idShopping = fkShoppingS
    join usuario
		on idShopping = fkShopping;
    
    select * from shopping
		join endereço 
			on idShopping = fkShoppingE
		join sensor
			on idShopping = fkShoppingS
		join usuario
			on idShopping = fkShopping
		where cidade like 'D%';
        
drop database systoyanka;
    
    
    
    
