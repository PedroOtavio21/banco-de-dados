# Aula 18 - Relacionamentos 1:1 e 1:n

### Vamos começar criando um novo banco de dados para essa aula:
```sql
CREATE DATABASE aula_relacionamentos;
```

### Vamos criar primeiramente uma tabela simples de funcionários:
```sql
CREATE TABLE employees (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	phone VARCHAR(20)
);
```

### Agora vamos criar uma tabela de endereços.
Nesse cenário, assumiremos que o sistema comporta **apenas 1 endereço por funcionário** e os endereços **não são reutilizáveis**, ou seja, um endereço cadastrado só pode ser usado para 1 funcionário. Isso configura um relacionamento um-para-um (1:1), que podemos criar da seguinte forma

Obs.: para garantir um relacionamento 1:1 o uso da restrição `UNIQUE` na coluna da chave estrangeira **é essencial**, pois é ela que garantirá que cada funcionário só apareça na tabela **uma única vez**, pois um mesmo ID de funcionário nunca poderá se repetir.

```sql
CREATE TABLE addresses (
	id SERIAL PRIMARY KEY,
	street VARCHAR(100) NOT NULL,
	number VARCHAR(4),
	complement VARCHAR(20),
	city VARCHAR(100) NOT NULL,
	
	employee_id INT UNIQUE,
	FOREIGN KEY (employee_id) REFERENCES employees (id)
);
```

### Agora vamos ver como criar um relacionamento um-para-muitos (1:n).
Nesse cenário, criaremos uma tabelas de departamentos, onde cada funcionário só pode pertencer a um departamento por vez, mas um departamento é composto de vários funcionários. Para criar uma tabela com esse relacionamento utilizaremos uma estrutura muito parecida. Comece criando a tabela de departamentos:

```sql
-- Crie uma tabela de departamentos
CREATE TABLE departments (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);
```

### Agora temos duas opções, pois a chave estrangeira deverá estar na tabela de funcionários.
1. Podemos alterar a tabela de funcionários para acrescentar uma nova coluna:

```sql
-- Primeiro adicionamos a coluna
ALTER TABLE employees ADD COLUMN department_id INT;

-- Depois, adicionamos a constraint configurando uma chave estrangeira
ALTER TABLE employees ADD CONSTRAINT fk_department
	FOREIGN KEY (department_id) REFERENCES departments (id); 
``` 

2. Ou podemos simplesmente excluir a nossa tabela de funcionários e criá-la novamente:

**Atenção**! Muito cuidado ao fazer isso em um banco de dados real, pois isso excluirá todos os dados da tabela já existente. Esse é apenas um exemplo para mostrar como seria a criação de uma nova tabela do zero já com a chave estrangeira, mas nunca deve ser utilizado em uma tabela já existente. Para isso, use o método anterior com o `ALTER TABLE`.

```sql
-- Excluimos a tabela
DROP TABLE employees;

-- E a criamos novamente já definindo a chave estrangeira na criação
CREATE TABLE employees (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	phone VARCHAR(20),
	
	department_id INT NOT NULL,
	FOREIGN KEY (department_id) REFERENCES departments (id)
);
```

### Antes de finalizar a aula, vamos inserir e consultar alguns dados nessas tabelas para ver como elas são usadas na prática.
Comece inserindo dados de funcionários, endereços e departamentos:

```sql
-- Comece pelos departamentos, a tabela mais simples
INSERT INTO departments (name) VALUES ('Imprensa'), ('Investigação'), ('Diplomacia');

-- Confira os IDs de cada um para usarmos na hora de inserir funcionários
SELECT * FROM departments;

-- Insira os funcionários
INSERT INTO employees (name, phone, department_id) 
	VALUES ('Clark Kent', '1111-1111', 1);

INSERT INTO employees (name, phone, department_id)
	VALUES ('Bruce Wayne', '2222-2222', 2);

INSERT INTO employees (name, phone, department_id)
	VALUES ('Diana Prince', '3333-3333', 3);

INSERT INTO employees (name, phone, department_id)
	VALUES ('John Jones', '4444-4444', 2);
	
-- Confira os IDs de cada um
SELECT * FROM employees;

-- A partir disso, insira os endereços
INSERT INTO addresses (street, city, employee_id)
	VALUES ('Rua A', 'Metropolis', 1);

INSERT INTO addresses (street, city, employee_id)
	VALUES ('Rua B', 'Gotham', 2);

INSERT INTO addresses (street, city, employee_id)
	VALUES ('Rua C', 'Themyscira', 3);

-- Repare que agora não é possível inserir mais endereços para esses IDs
INSERT INTO addresses (street, city, employee_id)
	VALUES ('Fazenda Kent', 'Smallville', 1);
```

### Agora vamos começar a explorar um novo comando muito importante do SQL, o `JOIN`.
Ele serve para conseguir obter dados de tabelas **relacionadas** em uma única consulta. Vamos experimentar obter os dados dos funcionários junto com seus respectivos endereços:

```sql
SELECT * FROM employees JOIN addresses ON employees.id = addresses.employee_id;
```

### O mesmo vale para o relacionamento um-para-muitos:
Obs.: repare que o cuidado na consulta com qual é a tabela consultada e qual é a tabela da junção é apenas por uma questão de organização, ambos os resultados são os mesmos, mas organizados de forma diferente.

```sql
-- Podemos obter os funcionários com uma junção com a tabela de depertamentos
SELECT * FROM employees JOIN departments ON employees.department_id = departments.id;

-- Ou podemos obter os departamentos com uma junção com a tabela de funcionários
SELECT * FROM departments JOIN employees ON employees.department_id = departments.id;
```

### Por fim, também podemos customizar nossa consulta ao identificar as tabelas e colunas da seguinte forma:
```sql
SELECT
	employees.id AS ID,
	employees.name AS Funcionário,
	employees.phone AS Telefone,
	departments.name AS Departamento
FROM employees JOIN departments ON employees.department_id = departments.id;
```