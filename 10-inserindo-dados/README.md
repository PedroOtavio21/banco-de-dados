# Aula 10 - Inserindo linhas em uma Tabela
1. Para começar, iremos nos conectar ao banco de dados criado no exercício anterior:

```sql
-- No terminal:
psql -d db_burguer_queen
-- ou no próprio psql:
\\c db_burguer_queen
```

2. Agora iremos conhecer o comando que adiciona uma nova linha em uma tabela, o `INSERT`:

```sql
INSERT INTO clientes (name, address, phone, created_at) 
	VALUES ('Isaac', 'Rua A, nº 12', '(11) 99876-5432', '2024-01-31');
```

3. Vamos usar o comando novamente, dessa vez para criar um fornecedor e um novo lanche:

Obs.: repare que as colunas podem ser escritas em qualquer ordem, desde que sejam as mesmas antes e depois do comando `VALUES`.

```sql
-- Insere um novo fornecedor
INSERT INTO suppliers (name, phone, email, notes)
	VALUES ('ACME Inc.', '(11) 1111-1111', 'acme@email.com', 'N/a');

	
-- Insere um novo lanche 
INSERT INTO snacks (name, price, description) 
	VALUES (
    'Hamburguer',
    8,
    'Pão, carne, alface, tomate, molho especial, batata palha'
  );
```

4. Também é possível usar o comando `INSERT` para adicionar várias linhas de uma única vez:

```sql
INSERT INTO stock_ingredients (name, category, quantity)
VALUES
	('Ovos', 'Diversos', 24),
  ('Tomate', 'Frutas', 14),
  ('Queijo', 'Diversos', 40),
  ('Presunto', 'Carnes', 40);
```
