# Aula 11 - Consultando linhas em uma Tabela
1. Para começar, iremos nos conectar ao banco de dados criado no exercício anterior:

```sql
-- No terminal:
psql -d db_burguer_queen
-- ou no próprio psql:
\\c db_burguer_queen
```

2. O comando que usamos para ler os dados salvos em uma tabela é o `SELECT`. A forma mais simples de usar o SELECT é a seguinte:

```sql
SELECT * FROM clients;
```

3. Também é possível especificar quais campos queremos obter da tabela:

```sql
SELECT id, name, phone, email FROM suppliers;
```

4. Ou então modificar o formato dos resultados, como o nome das colunas:

```sql
SELECT
	id AS Código,
	name AS Lanche,
	description AS Descrição,
	price AS Preço
FROM snacks;
```

5. Outro comando importante do SQL e que é usado juntamente com o `SELECT` é o `WHERE`, que permite filtrarmos os resultados de acordo com uma condição:

```sql
-- Obtém os ingredientes com quantidade menor que 20
SELECT * FROM stock_ingredients WHERE quantity < 20;

-- Obtém os ingredientes da categoria Diversos
SELECT * FROM stock_ingredients WHERE category = 'Diversos';
```

6. Por fim, também podemos usar o `WHERE` em conjunto com vários operadores para tornar os filtros mais elaborados:

```sql
-- Operador E (AND)
SELECT * FROM stock_ingredients WHERE category = 'Diversos' AND quantity < 25;

-- Operador OU (OR)
SELECT * FROM stock_ingredients WHERE category = 'Diversos' OR quantity < 25;

-- Operador IN para obter uma coluna pertencente a um conjunto
SELECT * FROM stock_ingredients WHERE category IN ('Carnes', 'Frutas');
```