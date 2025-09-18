# 🛍️ Projeto de Banco de Dados – Loja de Roupas  

## 📖 Descrição Geral  
Este projeto foi desenvolvido como parte de um trabalho acadêmico de Banco de Dados. O objetivo foi criar a modelagem e implementação de um **sistema para gerenciar uma loja de roupas**, contemplando produtos, estoque, fornecedores, clientes, vendas, promoções e funcionários.  

O banco de dados foi pensado para **suportar as principais operações da loja**, permitindo organização eficiente de informações, geração de relatórios e apoio à tomada de decisão.  

---

## 🎯 O que foi pedido  
De acordo com os requisitos do projeto, foram desenvolvidos:  

- **Minimundo** com descrição detalhada do domínio de negócio.  
- **Modelagem Entidade-Relacionamento (MER)**.  
- **Modelagem Relacional (MR)**.  
- Documento explicativo com imagens dos diagramas.  
- **Scripts SQL organizados e documentados**, incluindo:  
  - Criação de tabelas e views (**DDL**).  
  - Alterações nas tabelas (**mínimo 10 ALTERs**).  
  - Exclusão de todas as tabelas, views e dependências.  
  - Inserção de dados (**mínimo 20 registros por tabela**).  
  - Atualizações e exclusões de dados (**mínimo 20 DML**).  
  - Relatórios/consultas importantes (**mínimo 20 SELECTs com JOINs e Subselects**).  
  - Criação de views para relatórios (**mínimo 10**).  

---

## 🏬 Minimundo – Loja de Roupas  
A loja de roupas precisa de um sistema que controle:  

- **Produtos** (roupas, acessórios, calçados – com atributos como nome, preço, cor, tamanho e marca).  
- **Categorias** (feminino, masculino, infantil, acessórios, etc.).  
- **Estoque** (quantidade disponível, entrada e saída de produtos).  
- **Clientes** (cadastro com dados pessoais e de contato).  
- **Vendas** (detalhes da transação: data, cliente, produtos comprados, descontos, pagamento e entrega).  
- **Funcionários** (dados pessoais, cargo e contato).  
- **Fornecedores** (nome, endereço, telefone, email).  
- **Promoções** (descontos aplicados em produtos e períodos específicos).  

---

## ⚙️ O que adicionamos além do pedido  
Para tornar a modelagem mais robusta e próxima da realidade, foram feitos aprimoramentos no **MER** e no **MR**:  

1. **Relacionamento Produto – Fornecedor**  
   - Criada a entidade associativa `Fornecedor_Produto` para representar a relação N:N.  

2. **Relacionamento Produto – Promoção**  
   - Criada a entidade associativa `Produto_Promocao` para representar a relação N:N.  

3. **Detalhamento do Estoque**  
   - Definido como relação 1:1 com Produto, garantindo controle individual de cada item.  

4. **Item_Venda**  
   - Criada entidade associativa para detalhar produtos em uma venda, com atributos `quantidade`, `preco_unitario` e `desconto`.  

5. **Cardinalidades Refinadas**  
   - Correções importantes para representar a realidade:  
     - Produto – Fornecedor → N:N  
     - Produto – Promoção → N:N  
     - Produto – Estoque → 1:1  
     - Produto – Categoria → N:1  
     - Cliente – Endereço / Telefone → 1:N  
     - Funcionário – Telefone → 1:N  

---

## 📂 Estrutura dos Scripts  
O repositório contém os seguintes arquivos:  

- `01_MR_LojadeRoupa.mwb` → Modelo Relacional (diagrama lógico do banco).  
- `02_MR_LojadeRoupa.mwb.bak` → Backup do modelo relacional. 
- `03_SQL-DDL-Creat-LojaDeRoupa.sql` → Criação das tabelas e dependências (DDL).
- `04_SQL-DML-Isert-LojaDeRoupa.sql` → Inserção de dados nas tabelas (DML).
- `05_SQL-DDL-Alter Table-LojaDeRoupas.sql` → Alterações de estrutura nas tabelas (DDL – ALTER). 
- `06_SQL-DQL-Select-LojaDeRoupa.sql` → Consultas e relatórios. 
- `07_SQL-DDL-Views-LojaDeRoupa.sql` → Criação das views. 
- `08_SQL-DML-Delete-Update-LojaDeRoupa.sql` → Atualizações e exclusões de registros.
- `09_SQL-DDL-Drop-LojaDeRoupa.sql` → Exclusão de todas as tabelas, views e dependências.

---

## 📊 Conclusão  
O projeto evoluiu de um **modelo básico de cadastro** para uma **modelagem relacional completa e realista**, refletindo com maior precisão os processos de uma loja de roupas. Essa estrutura permite fácil manutenção, consultas robustas e geração de relatórios gerenciais.  

---

## 👥 Autores  
- Abigail Maria Gonçalves Nazário
- Sofia Leitão de Azevedo
- Tamirys Maria da Silva Costa  


