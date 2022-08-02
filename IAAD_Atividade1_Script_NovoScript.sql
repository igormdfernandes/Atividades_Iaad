#Atividade IAAD Questão 1
begin;
drop schema if exists empresa_igor_mendes;
create schema empresa_igor_mendes;
use empresa_igor_mendes;

create table startup (
id_startup int auto_increment,
nome_startup varchar(20) not null,
cidade_sede varchar(20) not null,
primary key (id_startup))
auto_increment = 10001;

create table programador (
id_programador int auto_increment,
id_startup int not null,
nome_programador varchar(30) not null,
genero char(1) not null,
data_nascimento date not null,
email varchar(40) not null unique,
primary key (id_programador),
FOREIGN KEY (id_startup) references startup(id_startup) on update cascade)
auto_increment = 30001;

create table linguagem_programacao (
id_linguagem int auto_increment,
nome_linguagem varchar(15) not null,
ano_lancamento year not null,
primary key (id_linguagem))
auto_increment = 20001;

create table programador_linguagem(
id_programador int,
id_linguagem int, 
primary key (id_programador, id_linguagem),
FOREIGN KEY(id_linguagem) references linguagem_programacao(id_linguagem) on delete restrict,
FOREIGN KEY(id_programador) references programador(id_programador) on delete cascade);

create table projeto(
id_programador int not null, 
id_projeto int, 
nome_projeto char(25),
primary key (id_projeto),
FOREIGN KEY(id_programador) references programador(id_programador) on delete restrict);


INSERT INTO startup (nome_startup, cidade_sede) values('Tech4Toy', 'Porto Alegre'), 
('Smart123', 'Belo Horizonte'), ('knowledgeUp', 'Rio de Janeiro'), 
('BSI Next Level', 'Recife'), ('QualiHealth', 'São Paulo'), 
('ProEdu', 'Florianópolis');

INSERT INTO programador (id_startup, nome_programador, genero, data_nascimento, email) values ('10001', 'João Pedro', 'M', '1993-06-23', 'joaop@mail.com'), 
('10002', 'Paula Silva', 'F', '1986-01-10', 'paulas@mail.com'), 
('10003', 'Renata Vieira', 'F', '1991-07-05', 'renatav@mail.com'), 
('10004', 'Felipe Santos', 'M', '1976-11-25', 'felipes@mail.com'), 
('10001', 'Ana Cristina', 'F', '1968-02-19', 'anac@mail.com'), 
('10004', 'Alexandre Alves', 'M', '1988-07-07', 'alexandrea@mail.com'), 
('10002', 'Laura Marques', 'F', '1987-10-04', 'lauram@mail.com');

INSERT INTO linguagem_programacao (nome_linguagem, ano_lancamento) values ('Python', '1991'), ('PHP', '1995'), 
('Java', '1995'), ('C', '1972'), ('JavaScript', '1995'), ('Dart', '2011');

INSERT INTO programador_linguagem values ('30001', '20001'), ('30001', '20002'), ('30002', '20003'), 
('30003', '20004'), ('30003', '20005'), ('30004', '20005'), ('30007', '20001'), ('30007', '20002');

INSERT INTO projeto values ('30001', '40001', 'aplicativo academia'), ('30003', '40002', 'serviços da saúde'), 
('30004', '40003', 'testes'), ('30007', '40004', 'ciência');

#realizando restrição de integridade referencial
#DELETE FROM programador where id_programador = '30001';

#Mensagem de erro: Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails 
#(`ativ_sql`.`programador_linguagem`, CONSTRAINT `programador_linguagem_ibfk_1` FOREIGN KEY (`id_programador`) 
#REFERENCES `programador` (`id_programador`))


commit;