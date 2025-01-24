# Aula 7 - Criando Banco de Dados e Tabelas (DDL)

1. Para criar bancos de dados utilizamos o comando `CREATE DATABASE`:

```sql
CREATE DATABASE meu_primeiro_database;
```

2. Para alterar um banco de dados utilizamos o comando `ALTER DATABASE`:

```sql
ALTER DATABASE meu_primeiro_database RENAME TO teste_database;
```

3. Para excluir um banco de dados utilizamos o comando `DROP DATABASE`:

```sql
DROP DATABASE teste_database;
```

4. Agora vamos criar um banco de dados e criar nele algumas tabelas usando como modelo o cenário de uma concessionária de automóveis:

```sql
CREATE DATABASE db_concessionaria;
```

5. O PostgreSQL possui comandos próprios (não são comandos SQL, são específicos da CLI do PostgreSQL) para várias tarefas comuns, como se conectar a um banco de dados, listar todos o bancos, listar tabelas, colunas, etc.

6. Para trabalhar em um banco de dados primeiro precisamos nos conectar a ele, é possível fazer isso de diferentes formas:

    1. No terminal, use o argumento `-d` dessa forma: `psql -d db_concessionaria`

    2. Dentro do psql utilize o comando `\c db_concessionaria`

    3. Via interface gráfica, especifique os dados preenchendo os campos disponibilizados na tela.

7. Uma vez conectado ao banco de dados, podemos trabalhar diretamente nele. Os comandos `CREATE`, `ALTER` e `DROP` também funcionam para tabelas:

```sql
-- O tipo de dado "SERIAL" funciona basicamente como uma incrementação automática. Ou seja, sempre que um novo cliente for implementado (nova linha), ele terá um novo id adicionado automáticamente
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(100)
)
```

8. Podemos alterar uma tabela adicionando, modificando ou excluindo suas colunas e constraints:

```sql
-- Cria uma nova coluna data de nascimento à tabela 'clientes'
ALTER TABLE clientes ADD COLUMN birthday DATE;

-- Modifica o tipo de dado da coluna 'email' para torná-la obrigatória
ALTER TABLE clientes ALTER COLUMN email SET NOT NULL;

-- Modifica o tipo de dado da coluna 'phone' para torná-la não obrigatória
ALTER TABLE clientes ALTER COLUMN phone DROP NOT NULL;

-- Renomeia a coluna 'name' para 'full_name'
ALTER TABLE clientes RENAME COLUMN name TO full_name;

-- Exclui a coluna 'birthday'
ALTER TABLE clientes DROP COLUMN birthday;
```

9. Podemos excluir a tabela Clientes com o comando DROP TABLE:

```sql
DROP TABLE clientes;
```

10. Um detalhe interessante na criação de tabelas é que podemos especificar através dos comandos `IF NOT EXISTS` para que a criação seja feita apenas se já não existir uma tabela com aquele nome:

Obs.: repare que, se você excluiu a tabela com o comando anterior, ele irá executar a criação da primeira vez, mas ao tentar novamente ele irá ignorar o comando e não lançará nenhum erro.

```sql
CREATE TABLE IF NOT EXISTS Clientes (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	phone VARCHAR(20) NOT NULL,
	email VARCHAR(100)
);
```