USE lojaDeRoupa;

-- Tabelas de relação
DROP TABLE IF EXISTS Produto_Promocao;
DROP TABLE IF EXISTS Fornecedor_Produto;

-- Tabelas com FK dependentes
DROP TABLE IF EXISTS Telefone_fornecedor;
DROP TABLE IF EXISTS Endereco_fornecedor;
DROP TABLE IF EXISTS Fornecedor;

DROP TABLE IF EXISTS Telefone_funcionario;
DROP TABLE IF EXISTS Item_venda;
DROP TABLE IF EXISTS Venda;
DROP TABLE IF EXISTS Funcionario;

DROP TABLE IF EXISTS Telefone_cliente;
DROP TABLE IF EXISTS Endereco_cliente;
DROP TABLE IF EXISTS Cliente;

DROP TABLE IF EXISTS Estoque;
DROP TABLE IF EXISTS Produto;
DROP TABLE IF EXISTS Categoria;
DROP TABLE IF EXISTS Promocao;

-- Schema
DROP SCHEMA IF EXISTS lojaDeRoupa;