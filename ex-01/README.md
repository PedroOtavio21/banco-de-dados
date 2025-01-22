# Exercício 1 - Criação de tabelas
Crie um arquivo SQL (no formato do PostgreSQL) com os comandos para criar um banco de dados para uma lanchonete armazenar as informações do seu sistema. Esse arquivo deve então criar, caso não existam, as seguintes tabelas e colunas:

Clientes
- id
- nome
- telefone
- endereço
- data de cadastro

Fornecedores
- id
- nome
- telefone
- email
- data de contratação
- observações

Lanches
- id
- nome
- descrição
- preço

Pedidos
- id
- mesa
- data e hora do pedido
- situação

Ingredientes em estoque
- id
- nome
- categoria
- quantidade

## Notas
Na resolução do exercício, alguns tipos podem ser abritários, dependendo de como a equipe ou o desenvolvedor pode definir como serão os tipos de colunas da tabela

Ex.:
```sql
CREATE TABLE IF NOT EXISTS alimentos(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    -- A descrição poderia ser um texto pequeno ou grande, dependendo de como o desenvolvedor achar melhor
    -- Ou seja, poderia ser de tipo VARCHAR(255) ou TEXT
    descricao TEXT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);
```