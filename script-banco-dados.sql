create database SA;
use SA;

create table Empresa(
CNPJ bigint(11) not null,
Nome varchar(45) not null,
RazaoSocial varchar(45) not null,
Coworkings varchar(45) not null,
primary key (CNPJ));

create table telefoneEmpresa(
CNPJ bigint(11) not null,
idTelefone int not null auto_increment,
Telefone bigint(13) not null,
primary key (idTelefone),
foreign key (CNPJ) references Empresa(CNPJ));


create table EnderecoEmpresa(
CNPJ bigint(11) not null,
CEP int not null,
Pais varchar(45) not null,
Estado varchar(45) not null,
Cidade varchar(45) not null,
Bairro varchar(45) not null,
Complemento varchar(45) not null,
primary key (CEP),
foreign key (CNPJ) references Empresa(CNPJ));

create table EmailEmpresa(
CNPJ bigint(11) not null,
idEmail int not null auto_increment,
Email varchar(45) not null,
primary key (idEmail),
foreign key (CNPJ) references Empresa(CNPJ));

create table Usuario(
Login varchar(45) not null,
CPF bigint(11) not null,
primary key (Login));

create table TelefoneUsuario(
Login varchar(45) not null,
idTelefone int not null auto_increment,
Telefone bigint(13) not null,
primary key (idTelefone),
foreign key (Login) references Usuario(Login));

create table EnderecoUsuario(
CEP int not null,
Logradouro varchar(45) not null,
Complemento varchar(45) not null,
Bairro varchar(45) not null,
Cidade varchar(45) not null,
Estado varchar(45) not null,
primary key (CEP),
Login varchar(45) not null,
Foreign key(Login) references Usuario(Login));

create table EmailUsuario(
Login varchar(45) not null,
idEmail int not null auto_increment,
Email varchar(45) not null,
primary key (idEmail),
foreign key (Login) references Usuario(Login));

create table Produto(
Codigo bigint(20) not null,
Nome varchar(45) not null,
Descricao varchar(45) not null,
Marca varchar(45) not null,
Preco varchar(45) not null,
Quantidade bigint(20) not null,
primary key (Codigo));

create table TipoProduto(
Codigo bigint(20) not null,
idTipo int not null auto_increment,
Tipo varchar(45) not null,
primary key (idTipo),
foreign key (Codigo) references Produto(Codigo));

create table NotaFiscal(
Codigo bigint(20) not null,
QuantidadeProduto bigint(20) not null,
Valor decimal(10,2) not null,
DataCompra datetime not null,
NomeEmpresa varchar(45) not null,
NomeProduto varchar(45) not null,
idProduto int not null auto_increment,
primary key (idProduto),
foreign key (Codigo) references Produto(Codigo));

create table Departamento(
Codigo bigint(20) not null,
Nome varchar(45) not null,
QuantidadeFuncionarios bigint(20) not null,
Localização varchar(45) not null,
primary key (Codigo));

create table Funcionario(
CodigoRegistro bigint(20) not null,
PrimeiroNome varchar(45) not null,
Sobrenome varchar(45) not null,
CPF bigint(11) not null,
TipoFuncionario varchar(45) not null,
primary key (CodigoRegistro));

create table EmailFuncionario(
CodigoRegistro bigint(20) not null,
idEmail int not null auto_increment,
Email varchar(45),
primary key (idEmail),
foreign key (CodigoRegistro) references Funcionario(CodigoRegistro));

create table TelefoneFuncionario(
CodigoRegistro bigint(20) not null,
idTelefone int not null auto_increment,
Telefone bigint(13) not null,
primary key (idTelefone),
foreign key (CodigoRegistro) references Funcionario(CodigoRegistro));

create table EnderecoFuncionario(
CEP int not null,
Logradouro varchar(45) not null,
Complemento varchar(45) not null,
Bairro varchar(45) not null,
Cidade varchar(45) not null,
Estado varchar(45) not null,
primary key (CEP),
CodigoRegistro bigint(20) not null,
Foreign key(CodigoRegistro) references Funcionario(CodigoRegistro));

create table cadastro(
NumeroRegistro bigint(20) not null,
Pedidos varchar(45) not null,
Orcamentos varchar(45) not null,
Locacao varchar(45) not null,
PrimeiroNome varchar(45) not null,
Sobrenome varchar(45) not null,
primary key (NumeroRegistro));

create table Cliente(
CPF bigint(11) not null,
RG varchar(45) not null,
PrimeiroNome varchar(45) not null,
Sobrenome varchar(45) not null,
primary key (CPF));

create table telefoneCliente(
CPF bigint(11) not null,
idTelefone int not null auto_increment,
Telefone bigint(13) not null,
primary key (idTelefone),
foreign key (CPF) references Cliente(CPF));

create table emailCliente(
CPF bigint(11) not null,
idEmail int not null auto_increment,
Email varchar(45),
primary key (idEmail),
foreign key (CPF) references cliente(CPF));

create table enderecoCliente(
CPF bigint(11) not null,
CEP int not null,
Logradouro varchar(45) not null,
Complemento varchar(45) not null,
Bairro varchar(45) not null,
Cidade varchar(45) not null,
Estado varchar(45) not null,
primary key (CEP),
Foreign key(CPF) references cliente(CPF));


/*Inserindo dados*/
/*Tabela Empresa*/
insert into Empresa(CNPJ,Nome,RazaoSocial,Coworkings) values (05421972073,'Petrobrás','Petróleo Brasileiro S.A','Departamento de vendas');
insert into Empresa(CNPJ,Nome,RazaoSocial,Coworkings) values (60043001001,'Globo','Globo Comunicação e Participações S.A','Departamento de comunicação');
insert into Empresa(CNPJ,Nome,RazaoSocial,Coworkings) values (13593426001,'Contabilizei','Contabilizei Contabilidade LTDA','Departamento de Contabilidade');

select * from Empresa;

/*Tabela telefoneEmpresa*/
insert into telefoneEmpresa(CNPJ,Telefone) values (05421972073,3111221122);
insert into telefoneEmpresa(CNPJ,Telefone) values (60043001001,3111223344);
insert into telefoneEmpresa(CNPJ,Telefone) values (13593426001,3111225566);

select * from telefoneEmpresa;

/*Tabela enderecoEmpresa*/
insert into enderecoEmpresa(CNPJ,CEP,Pais,Estado,Cidade,Bairro,Complemento) values (05421972073,30130030,'Brasil','Minas Gerais','Belo Horizonte','Centro',2);
insert into enderecoEmpresa(CNPJ,CEP,Pais,Estado,Cidade,Bairro,Complemento) values (60043001001,31330608,'Brasil','Minas Gerais','Betim','Centro',3);
insert into enderecoEmpresa(CNPJ,CEP,Pais,Estado,Cidade,Bairro,Complemento) values (13593426001,30520023,'Brasil','Minas Gerais','Contagem','São Caetano',5);

select * from enderecoEmpresa;

/*Tabela enderecoEmpresa*/
insert into EmailEmpresa(CNPJ,Email) values (05421972073, 'PetrobrásSA@gmail.com.br');
insert into EmailEmpresa(CNPJ,Email) values (60043001001, 'GloboComunicação@gmail.com');
insert into EmailEmpresa(CNPJ,Email) values (13593426001, 'ContabilizeiLTDA@gmail.com');

select * from EmailEmpresa;

/*Tabela Usuario*/
insert into Usuario(Login,CPF) values ('123petro-',52314471610);
insert into Usuario(Login,CPF) values ('321GB.',31238731600);
insert into Usuario(Login,CPF) values ('132LTDA',36995294602);

select * from Usuario;

/*Tabela TelefoneUsuario*/
insert into TelefoneUsuario(Login,Telefone) values ('123petro-',31912345678);
insert into TelefoneUsuario(Login,Telefone) values ('321GB.',31998765432);
insert into TelefoneUsuario(Login,Telefone) values ('132LTDA',31900001111);

select * from TelefoneUsuario;

/*Tabela EnderocoUsuario*/
insert into EnderecoUsuario(CEP,Logradouro,Complemento,Bairro,Cidade,Estado,Login) values (69309593,'Travessa das Orquídeas',54,'Pricumã','Boa Vista','RR','123petro-');
insert into EnderecoUsuario(CEP,Logradouro,Complemento,Bairro,Cidade,Estado,Login) values (64006070,'Praça Cristina Leite','777 201B','Aeroporto','Teresina','PI','321GB.');
insert into EnderecoUsuario(CEP,Logradouro,Complemento,Bairro,Cidade,Estado,Login) values (77440400,'Rua Santa Genoveva',100,'Parque Residencial São José','Gurupi','TO','132LTDA');

select * from EnderecoUsuario;

/*Tabela EmailUsuario*/
insert into EmailUsuario(Login,Email) values ('123petro-','petro321@gmail.com');
insert into EmailUsuario(Login,Email) values ('321GB.','GBzin123@gmail.com');
insert into EmailUsuario(Login,Email) values ('132LTDA','LTDAEmpresaContil@gmail.com');

select * from EmailUsuario;

/*Tabela Produto*/
insert into Produto (Codigo,Nome,Descricao,Marca,Preco,Quantidade) values (87657533,'Notebook','Notebook Gamer Acer, Intel Core i5 11400H, 8GB, 512GB SSD','Nvidia',4.870,1);
insert into Produto (Codigo,Nome,Descricao,Marca,Preco,Quantidade) values (34756646,'Carregador Notebook','Fonte Carregador para Notebook Samsung NP270E4E NP275E4E 19V 3.16A','Samsung',67,2);
insert into Produto (Codigo,Nome,Descricao,Marca,Preco,Quantidade) values (32765475,'Mouse','Mouse Sem Fio Óptico 3200dpi Usb Wireless 2.4ghz Recarregável Pc Notebook Computador Tv Smart','BWX',38,3);

select * from Produto;

/*Tabela Tipo Produto*/
insert into TipoProduto (Codigo,idTipo,Tipo) values (87657533,876,'Notebook');
insert into TipoProduto (Codigo,idTipo,Tipo) values (34756646,347,'Carregador Notebok');
insert into TipoProduto (Codigo,idTipo,Tipo) values (32765475,327,'Mouse');

select * from TipoProduto;

/*Tabela NotaFiscal Produto*/
insert into NotaFiscal (Codigo,QuantidadeProduto,Valor,DataCompra,NomeEmpresa,NomeProduto) values (87657533,1,4.870,'2022-04-12 10:20:15','Magazine','Notebook');
insert into NotaFiscal (Codigo,QuantidadeProduto,Valor,DataCompra,NomeEmpresa,NomeProduto) values (34756646,2,134,'2022-04-12 10:20:15','Samsung','Carregador Notebook');
insert into NotaFiscal (Codigo,QuantidadeProduto,Valor,DataCompra,NomeEmpresa,NomeProduto) values (32765475,3,114,'2022-04-12 10:20:15','Amazon','Mouse');

select * from NotaFiscal;

/*Tabela Departamento*/
insert into Departamento(Codigo,Nome,QuantidadeFuncionarios,Localização) values (00012345,'SENAI',10000,'14º Andar');
insert into Departamento(Codigo,Nome,QuantidadeFuncionarios,Localização) values (00054321,'Totvs',352,'25º Andar');
insert into Departamento(Codigo,Nome,QuantidadeFuncionarios,Localização) values (00045000,'SIGGA TI',120,'47º Andar');

select * from Departamento;

/*Tabela Funcionario*/
insert into Funcionario (CodigoRegistro,PrimeiroNome,Sobrenome,CPF,TipoFuncionario) values (0001,'Pedro','Fernandes',12345678910,'Gestor');
insert into Funcionario (CodigoRegistro,PrimeiroNome,Sobrenome,CPF,TipoFuncionario) values (0002,'Rafael','Santos',09876543210,'Funcionário');
insert into Funcionario (CodigoRegistro,PrimeiroNome,Sobrenome,CPF,TipoFuncionario) values (0003,'Lucas','Ferreira',56789043210,'Funcionário');

select * from Funcionario;

/*Tabela Endereco Funcionario*/
insert into  EnderecoFuncionario (CEP,Complemento,Logradouro,Bairro,Cidade,Estado,CodigoRegistro) values (38703782,'Casa','Rua.Jandaí','Jardim','Ouro Preto','Minas Gerais',0001);
insert into  EnderecoFuncionario (CEP,Complemento,Logradouro,Bairro,Cidade,Estado,CodigoRegistro) values (36200608,'Casa','Rua.Santos','Lago Azul','Ibirité','Minas Gerais',0002);
insert into  EnderecoFuncionario (CEP,Complemento,Logradouro,Bairro,Cidade,Estado,CodigoRegistro) values (23943500,'Apto','Rua.Rio Grande','Canoas','Santiago','Rio De Janeiro',0003);

select * from EnderecoFuncionario;

/*Tabela Email Funcionario*/
insert into EmailFuncionario (CodigoRegistro,Email) values (0001,'pedrof1234@gmail.com');
insert into EmailFuncionario (CodigoRegistro,Email) values (0002,'rafaels5678@gmail.com');
insert into EmailFuncionario (CodigoRegistro,Email) values (0003,'lucasf9104@gmail.com');

select * from EmailFuncionario;

/*Tabela Telefone Funcionario*/
insert into TelefoneFuncionario (CodigoRegistro,Telefone) values (0001,31991523630);
insert into TelefoneFuncionario (CodigoRegistro,Telefone) values (0002,31912345678);
insert into TelefoneFuncionario (CodigoRegistro,Telefone) values (0003,31987654321);

select * from TelefoneFuncionario;

/*Tabela Cadastro*/
insert into Cadastro (NumeroRegistro,Pedidos,Orcamentos,Locacao,PrimeiroNome,Sobrenome) values (0001,5,500.00,'Empresa','Pedro','Henrique');
insert into Cadastro (NumeroRegistro,Pedidos,Orcamentos,Locacao,PrimeiroNome,Sobrenome) values (0002,8,800.00,'Empresa','Lucas','Rogério');
insert into Cadastro (NumeroRegistro,Pedidos,Orcamentos,Locacao,PrimeiroNome,Sobrenome) values (0003,6,600.00,'Empresa','Rafael','Santos');

select * from Cadastro;


/*Tabela Cliente*/
insert into Cliente(CPF,RG,PrimeiroNome,Sobrenome) values (66426793000,436032089,'Pedro','Henrique');
insert into Cliente(CPF,RG,PrimeiroNome,Sobrenome) values (12026792000,366022029,'Rafael','Moreira');
insert into Cliente(CPF,RG,PrimeiroNome,Sobrenome) values (52024191000,816012049,'Lucas','Marinho');

select * from Cliente;

/*Tabela telefoneCliente*/
insert into telefoneCliente(CPF,Telefone) values (66426793000,31991523630);
insert into telefoneCliente(CPF,Telefone) values (12026792000,31991926515);
insert into telefoneCliente(CPF,Telefone) values (52024191000,31933986356);

select * from telefoneCliente;

/*Tabela Email Cliente*/
insert into emailCliente(CPF,Email) values (66426793000,'Pedrohenrique@gmail.com');
insert into emailCliente(CPF,Email) values (12026792000,'Rafaelmoreira@gmail.com');
insert into emailCliente(CPF,Email) values (52024191000,'Lucasmarinho@gmail.com');

select * from emailCliente;

/*Tabela enderecoCiente*/
insert into enderecoCliente(CPF,CEP,Logradouro,Complemento,Bairro,Cidade,Estado) values ('66426793000',76963846,'Av Porto velho','Casa 8','Centro','Cacoal','RO');
insert into enderecoCliente(CPF,CEP,Logradouro,Complemento,Bairro,Cidade,Estado) values ('12026792000',76801344,'Panair','Rua do BH','Centro','Porto Velho','RO');
insert into enderecoCliente(CPF,CEP,Logradouro,Complemento,Bairro,Cidade,Estado) values ('52024191000',69314388,'Joaquim Honorato','Padaria da Esquina','Nova Canaã','Boa Vista','RR');

select * from enderecoCliente;