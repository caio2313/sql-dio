#Crie script de povoamento de banco de dados, incluindo dados em todas as tabelas criadas. Guarde os scripts para entrega.

use talento;

insert into fornecedores (Nome_Fornecedor, CNPJ_Fornecedor, Prod_Fornecido, Valor_Prod_Fornc) values 
('Zé atacadista','33928854000191', 'fardo de açúcar', 60.00),
('Zé atacadista', '33928854000191', 'fardo de farinha de trigo', 70.00),
('Zé atacadista', '33928854000191', 'Leite em pó integral 25kg', 980.00),
('Zé atacadista', '33928854000191', 'Caixa c/ 6 cx leite int', 55.00),
('Zé atacadista', '33928854000191', 'Fermento biológico 500g', 18.00),
('Zé atacadista', '33928854000191', 'Fermento quimico 2kg', '50.00'),
('Zé atacadista', '33928854000191', 'Açúcar confeiteiro 1kg', 15.00),
('Zé atacadista', '33928854000191', 'Extrato baunilha 300ml', 65.00),
('Zé atacadista', '33928854000191', 'Ovos grandes 5 dúzias', 40.00),
('Zé atacadista', '33928854000191', 'Ovos grandes 30uni', 28.00),
('Zé atacadista', '33928854000191', 'Fubá mimoso 4kg', 21.50),
('Zé atacadista', '33928854000191', 'Leite cond 27 uni', 230.00),
('Zé atacadista', '33928854000191', 'Creme de leite 27uni', 188.00),
('Zé atacadista', '33928854000191', 'Chantilly 10kg', 450.00),
('Zé atacadista', '33928854000191', 'Farco de sal', 39.00),
('Zé atacadista', '33928854000191', 'Barra chocolate 1kg', 40.00),
('Zé atacadista', '33928854000191', 'Chocolate em pó 1kg', 40.00),
('Zé atacadista', '33928854000191', 'Gotas de chocolate', 30.00),
('Lalalaticinios', '34924358000122', 'Queijo mussarela 4kg', 300.00),
('Lalalaticinios', '34924358000122', 'Queijo prato 2kg', 120.00),
('Lalalaticinios', '34924358000122', 'Presunto 3kg', 100.00),
('Lalalaticinios', '34924358000122', 'Mortadela 5kg', 130.00),
('Lalalaticinios', '34924358000122', 'Salame italiano 1kg', 125.00),
('Lalalaticinios', '34924358000122', 'Catupiry 2kg', 90.00),
('Lalalaticinios', '34924358000122', 'Manteiga 3kg', 50.00),
('Supersalgado', '42203504000159', 'salgados assados', 2.50),
('Supersalgado', '42203504000159', 'salgados fritos', 2.50);

insert into compras (Fornecedor, Prod_Comprado, Quant_Compra) values
('26', 'fardo de açúcar', '2' ),
('50', 'Manteiga 3kg', '1'),
('41', 'Barra chocolate', '4');

insert into estoque (Prod_Estoque, Unidade, Quant_Estoque) values
('fardo de açúcar', 'kg', 25),
('Manteiga 3kg', 'kg', 4);

insert into contas_mês (Conta_Luz, Conta_Água, Conta_Gás) values
(320.00, 240.00, 400.00);

insert into cargos(descricao, salario) values
('padeiro', 2300.00),
('confeiteira', 2600.00),
('atendente', 1300.00),
('atendente', 1300.00),
('caixa', 1900.00);

insert into funcionarios (nome_Funcionario, CPF_Funcionario, cargo) values
('Alberto Silveira', '841.701.940-55', 1),
('Mariana Albuquerque', '695.222.340-10', 2),
('Joaquim de Almeida', '203.882.630-75', 3),
('Helena Gomes', '349.670.760-76', 3),
('Ana Luiza', '238.879.210-03', 4);

insert into clientes (nome_Cliente, CPF_Cliente, Data_Aniversário) values
('José Bezerra', '394.887.990-72', '1969-07-15'),
('Debora Mendonça', '914.238.740-05', '1980-08-09');

insert into produtos (Nome_Produto, Valor_Venda) values
('Pão francês', 0.15),
('Pão de leite', 0.20),
('Pão de frios', 0.25),
('Broa de milho', 0.75),
('Bolo de milho', 10.00),
('Bolo de chocolate', 12.00),
('Bolo de leite em pó', 15.00),
('Bolo Aniversário', 55.00),
('Lanche de metro', 30.00),
('Panetone', 25.00),
('salgados fritos', 4.00),
('salgados assados', 5.00);

insert into pedidos (comanda, Prod_Pedido, Valor_Prod_Pedido, Quant_Pedida) values
('0001', 1, 0.15, 7),
('0002', 11, 4.00, 3),
('0003', 1, 0.15, 2),
('0004', 1, 0.15, 8),
('0004', 3, 0.25, 12),
('0005', 6, 12.00, 1),
('0006', 9, 30.00, 2);

insert into pagamentos (tipo_pagamento, numero_cartao_pag) values
('M', ''),
('M', ''),
('M', ''),
('M', ''),
('M', ''),
('M', ''),
('C', '5181202797697655');

INSERT INTO VENDAS (pedido, pagamento_id, valor_Total) values
(1, 8, 1.05),
(2, 9, 12.00),
(3, 10, 0.30),
(4, 11, 1.20),
(5, 12, 3.00),
(6, 13, 12.00),
(7, 14, 60.00);


