create database ecommerce;
use ecommerce;

create table clients(
idClient int auto_increment primary key,
fName varchar(14),
Minit char(3),
lastName varchar(14),
CPF char(13) not null,
Address varchar (60),
constraint unq_cpf_client unique (CPF)
);

create table product(
idProduct int auto_increment primary key,
pName varchar(14) not null,
classification_kids bool default false,
category enum('Eletronico', 'Vestimenta', 'Brinquedo', 'Alimento', 'Moveis') not null,
avaliacao float default 0,
size varchar(10)
);

create table payment(
idPayment int not null auto_increment,
idClientPay int not null,
typePayment enum('Boleto', 'Cartão', 'Dois cartões'),
limitAvailable float,
primary key(idPayment, idClientPay),
constraint fk_payment_clients foreign key (idClientPay) references clients(idClient)
);

create table orders(
idOrder int auto_increment not null primary key,
idOrderClient int,
orderStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
orderDescription varchar(255),
sendValue float default 10,
idOrderPay int,
paymentBoleto bool default false,
constraint fk_orders_clients foreign key (idOrderClient) references clients(idClient),
constraint fk_orders_payment foreign key (idOrderPay) references payment(idPayment)
);

create table productStorage(
iproductStorage int auto_increment not null primary key,
idOrderClient int,
storageLocation varchar(255),
quantity int default 0
);

create table supplier (
idSupplier int auto_increment primary key,
socialName varchar(255) not null,
CNPJ varchar(15) not null,
contact char(11) default 0,
constraint unq_supplier unique (CNPJ) 
);

create table seller (
idSeller int auto_increment primary key,
socialName varchar(255) not null,
abstName varchar(255),
CNPJ char(15),
CPF char(9),
location varchar(255),
contact char(11) default 0,
constraint unq_cnpj_supplier unique (CNPJ),
constraint unq_cpf_supplier unique (CPF)
);

create table productSeller(
idPseller int,
idProduct int,
prodQuantity int default 1,
primary key(idPseller, idProduct),
constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
constraint fk_product_product foreign key (idProduct) references product(idProduct)
);

create table productOrder(
idPOrderprod int,
idpoProduct int,
prodQuantity int default 1,
poStatus enum('Disponivel', 'Sem estoque') default 'Disponivel',
primary key(idPOrderprod, idpoProduct),
constraint fk_productorder_seller foreign key (idPOrderprod) references orders(idOrder),
constraint fk_productorder_product foreign key (idpoProduct) references product(idProduct)
);

create table storageLocation(
idLProduct int,
idLStorage int,
location varchar(255) not null,
primary key(idLStorage, idLProduct),
constraint fk_storage_location_product foreign key (idLStorage) references productStorage(iproductStorage),
constraint fk_storage_location_storage foreign key (idLProduct) references product(idProduct)
);

select orders.idOrder, orders.idOrderClient, orders.orderStatus, clients.fName, clients.lastName
from orders, clients
order by clients.idClient;

select seller.socialName, supplier.socialName
from seller, supplier
where seller.socialName = supplier.socialName;

select p.pName, s.socialName, t.location
from product as p, supplier as s, storagelocation as t;

select supplier.socialName, product.pName
from supplier, product;
