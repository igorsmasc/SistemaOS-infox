-- comentários
-- a linha abaixo cria um bd
create database dbinfox;
-- a linha abaixo escolhe o bd a ser utilizado
use dbinfox;
-- o bloco de instruções abaixo cria uma tabela
create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);
-- o comando abaixo descreve a tabela
describe tbusuarios;
-- a linha abaixo insere dados na tabela (CRUD)
-- Create -> Insert
insert into tbusuarios(iduser, usuario, fone, login, senha)
values(1,'José de Assis','9876-5412','joseassis','12345');
insert into tbusuarios(iduser, usuario, fone, login, senha)
values(2,'Igor Mascarenhas','9978-1484','igormasc','12345');
insert into tbusuarios(iduser, usuario, fone, login, senha)
values(3,'Maria Liana','3265-6584','liana924','12345');
-- a linha abaixo exibe os dados da tabela(CRUD)
-- Read -> Select
select * from tbusuarios;

-- a linha abaixo modifica dados da tabela (CRUD)
-- Update
update tbusuarios set fone ='987451234' where iduser='2';

-- a linha abaixo apaga um usuario da tabela
-- Delete

delete from tbusuarios where iduser=3;

create table tbclientes(
idcli int primary key auto_increment,
nomecli varchar(50) not null,
endcli varchar(100),
fonecli varchar(50) not null,
emailcli varchar(50)
);

describe tbclientes;

insert into tbclientes(nomecli, endcli,fonecli,emailcli)
values('Oliver Queen','Rua 85, 2019', '87451254', 'oliverquenn77@gmail.com');

select * from tbclientes;

create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp,
equipamento varchar(150) not null,
defeito varchar(150) not null,
servico varchar(150),
tecnico varchar(50),
valor decimal(10,2),
idcli int not null,
foreign key(idcli) references tbclientes(idcli) 
);

describe tbos;

insert into tbos(equipamento, defeito, servico, tecnico, valor, idcli)
values('Notebook', 'Não liga', 'Troca da fonte', 'Igor M','87.50', 1);

select * from tbos;

-- o cod abaixo trás informações de 2 tabelas
select
O.os,equipamento,defeito,servico,valor,
C.nomecli,fonecli
from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli);