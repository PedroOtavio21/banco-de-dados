# Aula 20 - Integridade Referencial
Nesta aula, vamos aprender sobre a integridade referencial no PostgreSQL, que é um **conjunto de regras** que asseguram que os relacionamentos entre tabelas no banco de dados **permanecem consistentes**.

1. Vamos seguir usando o mesmo banco de dados das aulas anteriores, o aula_relacionamentos.

2. Dessa vez iremos criar as tabelas **customers e orders** (clientes e pedidos). Nelas iremos especificar que clientes têm um relacionamento 1:n com pedidos:

```sql
-- Crie a tabela de clientes
CREATE TABLE customers (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	phone VARCHAR(100) UNIQUE NOT NULL
);

-- Crie a tabela de pedidos
CREATE TABLE orders (
	id SERIAL PRIMARY KEY,
	total DECIMAL(10, 2),
	customer_id INT,
	FOREIGN KEY (customer_id) REFERENCES customers (id)
);
```

3. Podemos inserir alguns dados nessas tabelas:

```sql
-- Insira dados na tabela de clientes
INSERT INTO customers (name, phone) VALUES
	('Clark Kent', 'clark@email.com'),
	('Bruce Wayne', 'bruce@email.com'),
	('Diana Prince', 'diana@email.com');

-- Insira dados na tabela de pedidos
INSERT INTO orders (total, customer_id) VALUES
	(100.00, 1),
	(240.00, 2),
	(200.00, 1),
	(420.00, 3),
	(700.00, 2);
```

4. Utilizando o comportamento padrão do SQL, por termos uma tabela (customers) contendo dados que são referenciados por outra tabela, **não podemos excluir esses dados**. Nesse caso, como o cliente 1 possui um pedido vinculado a ele, não podemos excluir esse cliente:

```sql
DELETE FROM customers WHERE id = 1; -- Lançará um erro de violação de constraint
```

5. Para alterar as configurações de integridade usamos o `ON DELETE` e o `ON UPDATE`. Essas configurações especificam **qual comportamento deverá ser executado** em caso de *exclusão* ou *atualização* do registro referenciado na chave estrangeira. Ambos aceitam as seguintes opções:

- `ON DELETE CASCADE`: **remove ou atualiza automaticamente** as linhas da tabela contendo a referência quando a linha correspondente **é removida ou atualizada** na tabela original.

- `ON DELETE RESTRICT`: **impede a remoção ou atualização** de uma linha na tabela original se existem linhas correspondentes na tabela que a referencia (**comportamento padrão**).

- `ON DELETE SET NULL`: define a coluna de chave estrangeira como **NULL** quando a linha correspondente na tabela original **é removida ou atualizada** (a coluna deve ser capaz de aceitar valores nulos para essa opção ser usada).

- `ON DELETE SET DEFAULT`: define a coluna de chave estrangeira com o **seu valor padrão** quando a linha correspondente na tabela original **é removida ou atualizada** (a coluna deve ter um valor padrão configurado para essa opção ser usada).

- `ON DELETE NO ACTION`: **similar ao RESTRICT**, essa opção fará com que não seja possível **remover ou atualizar um registro** na tabela original, porém seu comportamento dentro de uma transação é diferente (falaremos sobre transações em aulas futuras), a verificação de integridade apenas ocorrerá no final da transação e não imediatamente.

6. Considerando tudo isso, as opções `CASCADE` e `RESTRICT` são as mais utilizadas. Já vimos a segunda em ação, então vamos recriar a tabela “orders” para visualizar na prática o comportamento do `CASCADE`:

```sql
-- Primeiramente, exclua a tabela para recriá-la com a nova constraint
DROP TABLE orders; 

CREATE TABLE orders (
	id SERIAL PRIMARY KEY,
	total DECIMAL(10, 2),
	customer_id INT,
	FOREIGN KEY (customer_id) REFERENCES customers (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

-- Reinserir dados na tabela de pedidos
INSERT INTO orders (total, customer_id) VALUES
	(100.00, 1),
	(240.00, 2),
	(200.00, 1),
	(420.00, 3),
	(700.00, 2);
```

7. Agora podemos experimentar excluir e atualizar o ID de alguns registros para ver o resultado:

```sql
-- Exclua um cliente e observe o efeito nos pedidos
DELETE FROM customers WHERE id = 1;

-- Verifique os pedidos restantes
SELECT * FROM orders JOIN customers ON customers.id = orders.customer_id;

-- Atualize um cliente e observe o efeito nos pedidos
UPDATE customers SET id = 40 WHERE id = 2;

-- Verifique os pedidos atualizados
SELECT * FROM orders JOIN customers ON customers.id = orders.customer_id;
```