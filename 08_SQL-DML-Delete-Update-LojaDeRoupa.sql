use lojaderoupa;

-- 1. Atualizar o preço de "Camiseta Preta Slim"
UPDATE Produto
SET preco = 65.90
WHERE idProduto = 2;

-- 2. Alterar a cor da "Calça Jeans Azul"
UPDATE Produto
SET cor = 'Azul Marinho'
WHERE idProduto = 3;

-- 3. Atualizar o tamanho da "Vestido Longo Vermelho"
UPDATE Produto
SET tamanho = 'GG'
WHERE idProduto = 6;

-- 4. Alterar a marca da "Sandália Salto Alto"
UPDATE Produto
SET marca = 'Schutz Premium'
WHERE idProduto = 10;

-- 5. Atualizar o nome de um produto
UPDATE Produto
SET nome = 'Blusa Social Off White'
WHERE idProduto = 14;

-- 6. Alterar o percentual de desconto da promoção "Semana do Jeans"
UPDATE Promocao
SET percentual_desconto = 20
WHERE idPromocao = 2;

-- 7. Atualizar a data_fim de "Promoção Inverno"
UPDATE Promocao
SET data_fim = '2025-07-15'
WHERE idPromocao = 1;

-- 8. Alterar o status de uma venda pendente para finalizada
UPDATE Venda
SET status = 'finalizada'
WHERE idVenda = 3;

-- 9. Atualizar o desconto de uma venda
UPDATE Venda
SET desconto = 20
WHERE idVenda = 4;

-- 10. Atualizar valor_total de uma venda manualmente
UPDATE Venda
SET valor_total = 180.00
WHERE idVenda = 8;

-- 11. Atualizar quantidade de item de venda
UPDATE Item_venda
SET quantidade = 5
WHERE fk_itemV_vendas = 1 AND fk_itemV_pro = 1;

-- 12. Alterar preco_unitario de item de venda
UPDATE Item_venda
SET preco_unitario = 80.00
WHERE id_itensV = 4;

-- 13. Atualizar descrição de categoria
UPDATE Categoria
SET descricao = 'Camisetas básicas, estampadas e pólos'
WHERE id_categoria = 1;

-- 14. Atualizar nome de categoria
UPDATE Categoria
SET nome = 'Moda Praia & Resort'
WHERE id_categoria = 14;

-- 15. Atualizar tamanho de produto “Mochila Escolar Preta”
UPDATE Produto
SET tamanho = 'GG'
WHERE idProduto = 20;

-- 16. Alterar categoria de produto – mover “Óculos de Sol Redondo”
UPDATE Produto
SET fk_produto_cate = 5
WHERE idProduto = 21;

-- 17. Alterar cor de produto “Casaco Puffer Preto”
UPDATE Produto
SET cor = 'Cinza Escuro'
WHERE idProduto = 40;

-- 18. Atualizar número de endereço do cliente 5
UPDATE Endereco_cliente
SET numero = 1001
WHERE fk_endereco_cliente = 5;

-- 19. Alterar rua de fornecedor 4
UPDATE Endereco_fornecedor
SET rua = 'Rua Delta'
WHERE fk_endereco_for = 4;

-- 20. Atualizar telefone de funcionário
UPDATE Telefone_funcionario
SET numero = '81991230000'
WHERE id_telefone = 7;

-- 1. Deletar produto “Tênis Casual Preto”
DELETE FROM Produto
WHERE idProduto = 35;

-- 2. Deletar produto “Carteira Slim Marrom”
DELETE FROM Produto
WHERE idProduto = 39;

-- 3. Deletar cliente “Fábio Freitas”
DELETE FROM Cliente
WHERE idCliente = 40;

-- 4. Deletar cliente “Letícia Correia”
DELETE FROM Cliente
WHERE idCliente = 35;

-- 5. Deletar venda que foi cancelada (idVenda = 5)
DELETE FROM Venda
WHERE idVenda = 5;

-- 6. Deletar venda pendente
DELETE FROM Venda
WHERE idVenda = 7;

-- 7. Deletar todos os itens da venda 1
DELETE FROM Item_venda
WHERE fk_itemV_vendas = 1;

-- 8. Deletar todos os itens da venda 20
DELETE FROM Item_venda
WHERE fk_itemV_vendas = 20;

-- 9. Deletar promoção “Liquidação Camisetas”
DELETE FROM Promocao
WHERE idPromocao = 13;

-- 10. Deletar promoção “Queima Sandálias”
DELETE FROM Promocao
WHERE idPromocao = 12;

-- 11. Deletar categoria “Bonés” (10) – cuidado com restrições FK
DELETE FROM Categoria
WHERE id_categoria = 10;

-- 12. Deletar categoria “Sandálias” (11)
DELETE FROM Categoria
WHERE id_categoria = 11;

-- 13. Deletar fornecedor 10
DELETE FROM Fornecedor
WHERE idFornecedor = 10;

-- 14. Deletar endereço do fornecedor 10
DELETE FROM Endereco_fornecedor
WHERE fk_endereco_for = 10;

-- 15. Deletar telefone do cliente 9
DELETE FROM Telefone_cliente
WHERE fk_telefone_cliente = 9;

-- 16. Deletar todos os fornecedores associados ao produto 1
DELETE FROM Fornecedor_Produto
WHERE fk_produto = 1;

-- 17. Deletar estoque do produto 12
DELETE FROM Estoque
WHERE fk_estoque_pro = 12;

-- 18. Deletar todos os endereços de clientes com idCliente >= 8
DELETE FROM Endereco_cliente
WHERE fk_endereco_cliente >= 8;

-- 19. Deletar a promoção que o idPromocao seja igual a 15'
DELETE FROM Promocao
WHERE idPromocao = 15;

-- 20. Deletar todos os produtos da categoria “Roupas de Inverno” (categoria 20)
DELETE FROM Produto
WHERE fk_produto_cate = 20;


