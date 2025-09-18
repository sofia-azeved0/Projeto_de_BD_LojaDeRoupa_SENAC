-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lojaDeRoupa` DEFAULT CHARACTER SET utf8 ;
USE `lojaDeRoupa` ;

-- -----------------------------------------------------
-- Table `mydb`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`Categoria` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(20) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE INDEX `id_categoria_UNIQUE` (`id_categoria` ASC) VISIBLE,
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`Produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(50) NOT NULL,
  `preco` DECIMAL(6,2) NOT NULL,
  `tamanho` VARCHAR(3) NOT NULL,
  `cor` VARCHAR(20) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `fk_produto_cate` INT NOT NULL,
  PRIMARY KEY (`idProduto`),
  UNIQUE INDEX `idProduto_UNIQUE` (`idProduto` ASC) VISIBLE,
  INDEX `id_cat_idx` (`fk_produto_cate` ASC) VISIBLE,
  CONSTRAINT `fk_produto_cate`
    FOREIGN KEY (`fk_produto_cate`)
    REFERENCES `lojaDeRoupa`.`Categoria` (`id_categoria`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Promocao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`Promocao` (
  `idPromocao` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `percentual_desconto` INT NOT NULL,
  `data_inicio` DATE NOT NULL,
  `data_fim` DATE NOT NULL,
  PRIMARY KEY (`idPromocao`),
  UNIQUE INDEX `idPromocao_UNIQUE` (`idPromocao` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `data_cadastro` DATE NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `idCliente_UNIQUE` (`idCliente` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`Funcionario` (
  `cpf` VARCHAR(11) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`Venda` (
  `idVenda` INT NOT NULL AUTO_INCREMENT,
  `fk_venda_cliente` INT NOT NULL,
  `valor_total` DECIMAL(7,2) NOT NULL,
  `fk_venda_funcionario` VARCHAR(11) NULL,
  `forma_pag` VARCHAR(30) NOT NULL,
  `data_venda` DATE NOT NULL,
  `status` ENUM("finalizada", "cancelada", "pendente") NOT NULL DEFAULT "pendente",
  `desconto` INT NULL,
  PRIMARY KEY (`idVenda`),
  CONSTRAINT `fk_venda_cliente`
    FOREIGN KEY (`fk_venda_cliente`)
    REFERENCES `lojaDeRoupa`.`Cliente` (`idCliente`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_venda_funcionario`
    FOREIGN KEY (`fk_venda_funcionario`)
    REFERENCES `lojaDeRoupa`.`Funcionario` (`cpf`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Item_venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`Item_venda` (
  `id_itensV` INT NOT NULL AUTO_INCREMENT,
  `fk_itemV_vendas` INT NOT NULL,
  `fk_itemV_pro` INT NOT NULL,
  `quantidade` INT NOT NULL,
  `preco_unitario` DECIMAL(5,2) NOT NULL,
  `desconto` INT NULL,
  PRIMARY KEY (`id_itensV`),
  UNIQUE INDEX `id_itensV_UNIQUE` (`id_itensV` ASC) VISIBLE,
  CONSTRAINT `fk_itemV_pro`
    FOREIGN KEY (`fk_itemV_pro`)
    REFERENCES `lojaDeRoupa`.`Produto` (`idProduto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_itemV_vendas`
    FOREIGN KEY (`fk_itemV_vendas`)
    REFERENCES `lojaDeRoupa`.`Venda` (`idVenda`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`Estoque` (
  `idEstoque` INT NOT NULL AUTO_INCREMENT,
  `fk_estoque_pro` INT NOT NULL,
  `quantidade` INT NOT NULL,
  `data_entrada` DATE NOT NULL,
  `data_saida` DATE NOT NULL,
  PRIMARY KEY (`idEstoque`),
  UNIQUE INDEX `idEstoque_UNIQUE` (`idEstoque` ASC) VISIBLE,
  UNIQUE INDEX `id_prod_UNIQUE` (`fk_estoque_pro` ASC) VISIBLE,
  CONSTRAINT `fk_estoque_pro`
    FOREIGN KEY (`fk_estoque_pro`)
    REFERENCES `lojaDeRoupa`.`Produto` (`idProduto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Endereco_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`Endereco_cliente` (
  `fk_endereco_cliente` INT NOT NULL,
  `cep` VARCHAR(9) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  PRIMARY KEY (`fk_endereco_cliente`),
  CONSTRAINT `idCli`
    FOREIGN KEY (`fk_endereco_cliente`)
    REFERENCES `lojaDeRoupa`.`Cliente` (`idCliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefone_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`Telefone_cliente` (
  `id_telefone` INT NOT NULL AUTO_INCREMENT,
  `fk_telefone_cliente` INT NOT NULL,
  `numero` CHAR(11) NOT NULL,
  PRIMARY KEY (`id_telefone`),
  CONSTRAINT `fk_telefone_cliente`
    FOREIGN KEY (`fk_telefone_cliente`)
    REFERENCES `lojaDeRoupa`.`Cliente` (`idCliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefone_funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`Telefone_funcionario` (
  `id_telefone` INT NOT NULL AUTO_INCREMENT,
  `fk_telefone_fun` VARCHAR(11) NOT NULL,
  `numero` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`id_telefone`),
  CONSTRAINT `fk_telefone_fun`
    FOREIGN KEY (`fk_telefone_fun`)
    REFERENCES `lojaDeRoupa`.`Funcionario` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`Fornecedor` (
  `idFornecedor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFornecedor`),
  UNIQUE INDEX `idFornecedor_UNIQUE` (`idFornecedor` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Endereco_fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`Endereco_fornecedor` (
  `fk_endereco_for` INT NOT NULL,
  `cep` VARCHAR(9) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  PRIMARY KEY (`fk_endereco_for`),
  UNIQUE INDEX `idCli_UNIQUE` (`fk_endereco_for` ASC) VISIBLE,
  CONSTRAINT `fk_endereco_for`
    FOREIGN KEY (`fk_endereco_for`)
    REFERENCES `lojaDeRoupa`.`Fornecedor` (`idFornecedor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefone_fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`Telefone_fornecedor` (
  `id_telefone` INT NOT NULL AUTO_INCREMENT,
  `fk_telefone_for` INT NOT NULL,
  `numero` CHAR(11) NOT NULL,
  PRIMARY KEY (`id_telefone`),
  CONSTRAINT `fk_telefone_for`
    FOREIGN KEY (`fk_telefone_for`)
    REFERENCES `lojaDeRoupa`.`Fornecedor` (`idFornecedor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fornecedor_Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`Fornecedor_Produto` (
  `fk_fornecedor` INT NOT NULL,
  `fk_produto` INT NOT NULL,
  PRIMARY KEY (`fk_fornecedor`, `fk_produto`),
  INDEX `fk_produto_idx` (`fk_produto` ASC) VISIBLE,
  CONSTRAINT `fk_fornecedor`
    FOREIGN KEY (`fk_fornecedor`)
    REFERENCES `lojaDeRoupa`.`Fornecedor` (`idFornecedor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_produto`
    FOREIGN KEY (`fk_produto`)
    REFERENCES `lojaDeRoupa`.`Produto` (`idProduto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produto_Promocao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`Produto_Promocao` (
  `fk_produto` INT NOT NULL,
  `fk_promocao` INT NOT NULL,
  PRIMARY KEY (`fk_produto`, `fk_promocao`),
  INDEX `fk_promocao_idx` (`fk_promocao` ASC) VISIBLE,
  CONSTRAINT `fk_produto_pp`
    FOREIGN KEY (`fk_produto`)
    REFERENCES `lojaDeRoupa`.`Produto` (`idProduto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_promocao_pp`
    FOREIGN KEY (`fk_promocao`)
    REFERENCES `lojaDeRoupa`.`Promocao` (`idPromocao`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
