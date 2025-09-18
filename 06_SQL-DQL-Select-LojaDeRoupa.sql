USE lojaderoupa;

-- 1. Mostrar todo conteúdo de toda colona da tabela produto
SELECT p.* 
FROM Produto p
INNER JOIN Categoria c ON p.fk_produto_cate = c.id_categoria;

-- 2. Listar todos os clientes cadastrados em janeiro de 2025.
SELECT c.*
FROM Cliente c
INNER JOIN Endereco_cliente e ON c.idCliente = e.fk_endereco_cliente
WHERE MONTH(c.data_cadastro) = 1 AND YEAR(c.data_cadastro) = 2025;

-- 3. Mostrar os produtos da categoria ‘Camisetas’.
SELECT p.nome, p.preco, p.marca
FROM Produto p
INNER JOIN Categoria c ON p.fk_produto_cate = c.id_categoria
WHERE c.nome = 'Camisetas';

-- 4. Exibir o total de vendas finalizadas.
SELECT COUNT(*) AS total_vendas_finalizadas
FROM Venda v
INNER JOIN Cliente c ON v.fk_venda_cliente = c.idCliente
WHERE v.status = 'finalizada';

-- 5. Exibir o valor total arrecadado em vendas finalizadas.
SELECT SUM(v.valor_total) AS total_arrecadado
FROM Venda v
INNER JOIN Funcionario f ON v.fk_venda_funcionario = f.cpf
WHERE v.status = 'finalizada';

-- 6. Quais clientes realizaram compras acima de R$ 300?
SELECT DISTINCT c.nome, v.valor_total
FROM Venda v
INNER JOIN Cliente c ON v.fk_venda_cliente = c.idCliente
WHERE v.valor_total > 300;

-- 7. Mostrar o funcionário com mais vendas registradas.
SELECT f.nome, COUNT(v.idVenda) AS total_vendas
FROM Venda v
INNER JOIN Funcionario f ON v.fk_venda_funcionario = f.cpf
GROUP BY f.nome
ORDER BY total_vendas DESC
LIMIT 1;

-- 8. Listar os clientes que têm endereço cadastrado.
SELECT c.nome, e.rua, e.numero
FROM Cliente c
INNER JOIN Endereco_cliente e ON c.idCliente = e.fk_endereco_cliente;

-- 9. Listar fornecedores com telefone cadastrado.
SELECT f.nome, t.numero
FROM Fornecedor f
INNER JOIN Telefone_fornecedor t ON f.idFornecedor = t.fk_telefone_for;

-- 10. Mostrar produtos fornecidos pelo ‘Fornecedor 1’.
SELECT p.nome, p.marca
FROM Produto p
INNER JOIN Fornecedor_Produto fp ON p.idProduto = fp.fk_produto
INNER JOIN Fornecedor f ON f.idFornecedor = fp.fk_fornecedor
WHERE f.nome = 'Fornecedor 1';

-- 11. Total de produtos por categoria.
SELECT c.nome AS categoria, COUNT(p.idProduto) AS total_produtos
FROM Categoria c
INNER JOIN Produto p ON c.id_categoria = p.fk_produto_cate
GROUP BY c.nome;

-- 12. Produtos mais caros que R$ 300.
SELECT p.nome, p.preco, p.marca
FROM Produto p
INNER JOIN Categoria c ON p.fk_produto_cate = c.id_categoria
WHERE p.preco > 300;

-- 13. Clientes que fizeram mais de 3 compras.
SELECT c.nome, COUNT(v.idVenda) AS total_compras
FROM Venda v
INNER JOIN Cliente c ON v.fk_venda_cliente = c.idCliente
GROUP BY c.nome
HAVING COUNT(v.idVenda) > 3;

-- 14. Mostrar as promoções de outubro.
SELECT p.nome, p.percentual_desconto
FROM Promocao p
INNER JOIN Produto pr ON pr.fk_promocao = p.idPromocao
WHERE MONTH(p.data_inicio) = 10;

-- 15. Quais clientes compraram com PIX?
SELECT DISTINCT c.nome
FROM Venda v
INNER JOIN Cliente c ON v.fk_venda_cliente = c.idCliente
WHERE v.forma_pag = 'pix';

-- 16. Listar funcionários e seus cargos.
SELECT f.nome, f.cargo
FROM Funcionario f
INNER JOIN Venda v ON v.fk_venda_funcionario = f.cpf;

-- 17. Mostrar o valor médio das vendas.
SELECT AVG(v.valor_total) AS media_vendas
FROM Venda v
INNER JOIN Cliente c ON v.fk_venda_cliente = c.idCliente;

-- 18. Exibir todos os clientes que compraram com desconto maior que 10.
SELECT DISTINCT c.nome, v.desconto
FROM Venda v
INNER JOIN Cliente c ON v.fk_venda_cliente = c.idCliente
WHERE v.desconto > 10;

-- 19. Top 5 produtos mais vendidos.
SELECT p.nome, SUM(iv.quantidade) AS total_vendido
FROM Item_venda iv
INNER JOIN Produto p ON iv.fk_itemV_pro = p.idProduto
GROUP BY p.nome
ORDER BY total_vendido DESC
LIMIT 5;

-- 20. Mostrar o faturamento total de cada mês em 2025.
SELECT MONTH(v.data_venda) AS mes, SUM(v.valor_total) AS faturamento
FROM Venda v
INNER JOIN Cliente c ON v.fk_venda_cliente = c.idCliente
WHERE YEAR(v.data_venda) = 2025 AND v.status = 'finalizada'
GROUP BY MONTH(v.data_venda)
ORDER BY mes;


