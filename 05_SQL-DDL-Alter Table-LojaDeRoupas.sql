-- Adicionar coluna endereco em Cliente
ALTER TABLE Cliente ADD COLUMN endereco VARCHAR(200) NULL;

-- Renomear a coluna 'descricao' de Produto para 'detalhes' 
ALTER TABLE Produto CHANGE descricao detalhes VARCHAR(100);

-- Alterar o tamanho do campo 'nome' em Fornecedor
ALTER TABLE Fornecedor MODIFY nome VARCHAR(100);

-- Adicionar coluna data_nascimento em Funcionario
ALTER TABLE Funcionario ADD COLUMN data_nascimento DATE;

-- Remover a coluna 'descricao' da tabela Promocao
ALTER TABLE Promocao DROP COLUMN descricao;

-- Alterar o tipo de dado da coluna 'preco_unitario' em Item_venda
ALTER TABLE Item_venda MODIFY preco_unitario DECIMAL(8,2);

-- Adicionar coluna 'sexo' em Cliente
ALTER TABLE Cliente ADD COLUMN sexo ENUM('M','F','Outro');

-- Criar índice em Produto (campo nome)
ALTER TABLE Produto ADD INDEX idx_nome (nome);

-- Tornar o campo 'email' de Funcionario único (já é, mas exemplo)
ALTER TABLE Funcionario ADD UNIQUE INDEX idx_email (email);

-- Adicionar coluna 'ativo' em Fornecedor
ALTER TABLE Fornecedor ADD COLUMN ativo BOOLEAN DEFAULT TRUE;