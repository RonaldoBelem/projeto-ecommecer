# Banco de Dados para E-commerce

Este projeto define a estrutura básica de um banco de dados relacional para um sistema de e-commerce. Ele inclui tabelas para usuários, produtos, pedidos e itens de pedidos, bem como exemplos de consultas para gerenciar e analisar os dados.

## Estrutura do Banco de Dados

### Tabelas:
1. **Users**:
   - Armazena informações dos usuários.
   - Campos: `UserID`, `Name`, `Email`, `PasswordHash`, `CreatedAt`.

2. **Products**:
   - Armazena informações dos produtos disponíveis na loja.
   - Campos: `ProductID`, `Name`, `Description`, `Price`, `Stock`, `CreatedAt`.

3. **Orders**:
   - Registra pedidos feitos pelos usuários.
   - Campos: `OrderID`, `UserID`, `TotalAmount`, `CreatedAt`.

4. **OrderItems**:
   - Registra os itens de cada pedido.
   - Campos: `OrderItemID`, `OrderID`, `ProductID`, `Quantity`, `Price`.

## Como usar

1. **Criar o banco de dados**:
   Execute o script `schema.sql` no seu ambiente SQL para criar o banco de dados e as tabelas.

2. **Inserir dados**:
   Use as consultas fornecidas no arquivo `queries.sql` para popular as tabelas com dados de exemplo.

3. **Executar consultas**:
   Utilize os métodos SQL para realizar operações como:
   - Adicionar usuários.
   - Gerenciar produtos e estoque.
   - Registrar pedidos e calcular vendas.

## Pré-requisitos

- Servidor SQL (MySQL, MariaDB, etc.)
- Ferramenta para execução de consultas SQL (DBeaver, Workbench, etc.)

## Exemplos

- **Buscar produtos disponíveis**:
  ```sql
  SELECT * FROM Products WHERE Stock > 0;
