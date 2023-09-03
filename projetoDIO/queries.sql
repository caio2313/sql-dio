use talento;

#relação dos funcionários da empresa

select f.nome_funcionario, c.descricao, c.salario
from funcionarios as f, cargos as c
where f.cargo = c.idCargos;

#relação do estoque
select estoque.prod_Estoque, estoque.Quant_Estoque
from estoque;

#valor total das vendas realizadas em 17/06
select sum(vendas.valor_Total) as vendasTotais
from vendas
where data_venda = '2023-06-17';

#produtos a venda ordenados pelo valor de venda do maior para o menor
select *
from produtos
order by produtos.valor_venda DESC;

#lista funcionarios com salario maior que R$ 2000.00
select f.nome_Funcionario, sum(c.salario) as salario
from funcionarios as f join cargos as c on f.cargo = c.idCargos
group by f.nome_Funcionario
having salario > 2000.00;


