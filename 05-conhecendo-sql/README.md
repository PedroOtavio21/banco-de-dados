# Aula 5 - Conhecendo a linguagem SQL

## O que é SQL?
Foi criada na década de 1970 pela IBM e posteriormente padronizada pela ANSI e ISO

SQL (Structured Query Language) é a linguagem padrão utilizada para gerenciar e manipular bancos de dados relacionais

Serve para criação de tabelas, inserção de linhas, consultas e manipulação de dados, gerenciamento de acesso, etc

Exemplos de comandos SQL:
```sql
-- Nota: Obrigatório utilizar o ";" após cada comando
CREATE TABLE Clients;
SELECT nome, telefone FROM Clientes;
```

## Categorias de comandos da linguagem SQL
DDL (Data Definition Language):
- Comandos para definir a estrutura do banco de dados

- Ex.:
```sql
-- CREATE TABLE; -> Cria uma tabela
-- ALETER TABLE; -> Edita uma tabela
-- DROP TABLE; -> Exclui a tabela
```

DML (Data Manipulation Language):
- Comandos para manipulação de dados

- Ex.:
```sql
-- SELECT
-- INSERT
-- UPDATE
-- DELETE
```

DCL (Data Control Language):
- Comandos para controlar o acesso aos dados

- Ex.:
```sql
-- GRANT -> Concede acesso
-- REVOKE -> Remove o acesso
```

TCL (Transition Control Language):
- Comandos para gerenciar transações

- Ex.:
```sql
-- BEGIN
-- COMMIT
-- ROLLBACK
```