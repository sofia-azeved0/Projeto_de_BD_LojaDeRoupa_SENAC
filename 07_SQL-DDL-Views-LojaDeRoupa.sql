use lojaderoupa;

-- 1.View com todas as vendas finalizadas
CREATE VIEW View_VFinalizadas AS SELECT * FROM Venda WHERE status = 'finalizada';

SELECT * FROM View_VFinalizadas;

-- 2.View de faturamento mensal
CREATE VIEW View_FaturMensal AS SELECT MONTH(data_venda) AS mes, SUM(valor_total) AS faturamento
FROM Venda WHERE status = 'finalizada' GROUP BY MONTH(data_venda);

SELECT * FROM View_FaturMensal;

-- 3.View de clientes que compraram mais de 3 vezes
CREATE VIEW View_CliFieis AS SELECT c.idCliente, c.nome, COUNT(v.idVenda) AS total_compras
FROM Cliente c JOIN Venda v ON c.idCliente = v.fk_venda_cliente
GROUP BY c.idCliente, c.nome HAVING COUNT(v.idVenda) > 3;

SELECT * FROM View_CliFieis;

-- 4.View de produtos em promoção
CREATE VIEW View_ProdutosEmPromocao AS SELECT p.nome, p.preco, pr.percentual_desconto
FROM Produto p JOIN Produto_Promocao pp ON p.idProduto = pp.fk_produto JOIN Promocao pr ON pp.fk_promocao = pr.idPromocao;

SELECT * FROM View_ProdutosEmPromocao;

-- 5. View de clientes com compras acima de R$ 300
CREATE VIEW View_CliAcima300 AS SELECT DISTINCT c.nome, v.valor_total
FROM Venda v JOIN Cliente c ON v.fk_venda_cliente = c.idCliente
WHERE v.valor_total > 300;

SELECT * FROM View_CliAcima300;

-- 6. View dos produtos mais vendidos (Top 5)
CREATE VIEW View_Top5ProdutosMaisVendidos AS SELECT p.nome, SUM(iv.quantidade) AS total_vendido
FROM Item_venda iv JOIN Produto p ON iv.fk_itemV_pro = p.idProduto
GROUP BY p.nome ORDER BY total_vendido DESC LIMIT 5;

SELECT * FROM View_Top5ProdutosMaisVendidos;

-- 7. View do valor médio das vendas
CREATE VIEW View_ValorMedioVendas AS SELECT AVG(valor_total) AS media_vendas FROM Venda;

SELECT * FROM View_ValorMedioVendas;

-- 8. View de vendas pendentes
CREATE VIEW View_VendasPendentes AS SELECT idVenda, valor_total, data_venda
FROM Venda WHERE status = 'pendente';

SELECT * FROM View_VendasPendentes;

-- 9. View de fornecedores com telefone cadastrado
CREATE VIEW View_FornecedoresComTelefone AS SELECT f.nome, t.numero
FROM Fornecedor f JOIN Telefone_fornecedor t ON f.idFornecedor = t.fk_telefone_for;

SELECT * FROM View_FornecedoresComTelefone;

-- 10. View de produtos por categoria
CREATE VIEW View_ProdutosPorCategoria AS SELECT c.nome AS categoria, COUNT(p.idProduto) AS total_produtos
FROM Categoria c LEFT JOIN Produto p ON c.id_categoria = p.fk_produto_cate GROUP BY c.nome;

SELECT * FROM View_ProdutosPorCategoria;