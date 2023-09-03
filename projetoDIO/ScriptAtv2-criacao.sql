#Crie um banco de dados usando SQL e implante-o. Crie as tabelas necessárias, com seus relacionamentos, e guarde os scripts para entrega.

create database talento;

use talento;

create table fornecedores (
idFornecedores int not null auto_increment primary key,
Nome_Fornecedor varchar(45) not null,
CNPJ_Fornecedor varchar(18) not null unique key,
Prod_Fornecido varchar(45) not null,
Valor_Prod_Fornc decimal(9,2) not null
);

create table compras (
idCompras int not null auto_increment primary key,
Fornecedor int not null,
Prod_Comprado varchar(45) not null,
Quant_Compra int not null,
data_Compra date not null default(curdate())
);

alter table compras add foreign key (Fornecedor) references fornecedores(idFornecedores);
alter table compras add foreign key (Prod_Comprado) references fornecedores(Prod_Fornecido);

create table estoque (
idEstoque int not null auto_increment primary key,
Prod_Estoque varchar(45) not null,
Unidade varchar(2) not null,
Quant_Estoque decimal(9,2) not null
);

alter table estoque add foreign key (Prod_Estoque) references compras(Prod_Comprado);

create table contas_mês (
idContas_mês int not null auto_increment primary key,
Conta_Luz decimal(9,2) not null,
Conta_Água decimal(9,2) not null,
Conta_Gás decimal(9,2) not null,
salario_Funcionários decimal(9,2),
compras decimal(9,2)
);

create table funcionarios (
idFuncionarios int not null auto_increment primary key,
nome_Funcionario varchar(45) not null,
CPF_Funcionario varchar(14) not null unique key,
cargo int not null
);

create table cargos (
idCargos int not null primary key auto_increment,
descricao varchar(60) not null,
salario decimal(9,2) not null
);

alter table funcionarios add foreign key (cargo) references cargos(idCargos);

CREATE table Produtos (
idProdutos int not null primary key auto_increment,
Nome_Produto varchar(30) not null,
Valor_Venda decimal(9,2) not null
);

create table pedidos (
idPedidos int not null auto_increment primary key,
comanda  int(4) not null,
prod_Pedido int not null,
valor_Prod_Pedido decimal(9,2) not null,
quant_Pedida int not null,
sub_total decimal(9,2) as(valor_Prod_Pedido * Quant_Pedida)
);

alter table pedidos add foreign key (Prod_Pedido) references Produtos(idProdutos); 

create table pagamentos (
idPagamentos int not null auto_increment primary key,
tipo_Pagamento char not null,
numero_cartao_pag varchar(16),
numero_parcelas_pag int,
data_pag date default(curdate())
);

create table clientes (
idClientes int not null auto_increment primary key,
nome_Cliente varchar(45) not null,
CPF_Cliente varchar(14) not null unique key,
Data_Aniversário date not null
);

create table vendas (
idVendas int not null auto_increment primary key,
pedido int not null,
data_venda date not null default(curdate()),
cliente_id int,
pagamento_id int not null,
valor_Total decimal(9,2)
);

alter table vendas add foreign key (pedido) references pedidos(idPedidos);
alter table vendas add foreign key (cliente_id) references clientes(idClientes);
alter table vendas add foreign key (pagamento_id) references pagamentos(idPagamentos);