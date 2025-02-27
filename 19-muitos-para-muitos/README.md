# Aula 19 - Relacionamentos n:n
Vamos começar utilizando o mesmo banco de dados da aula anterior.

### Vamos criar as tabelas students e courses para simular um relacionamento muitos-para-muitos:
```sql
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
```

O relacionamento muitos-para-muitos nesse caso acontece quando relacionamos alunos e cursos, pois um aluno pode realizar vários cursos e um curso possui vários alunos. A forma como implementamos um relacionamento muitos-para-muitos na prática é através de uma **tabela intermediária**. Esse tabela intermediária irá conter os **IDs de ambas as tabelas** que estamos juntando, permitindo consultar os dados através dela.

Obs.: uma forma comum de **nomear as tabelas intermediárias** é **juntando os nomes das tabelas** que estão sendo relacionadas, por exemplo, `student_courses`.

### Vamos ver como podemos criar uma tabela intermediária usando o conceito de chave primária composta.
Uma chave primária composta é uma que possui duas colunas que, juntas, tornam um registro único:

```sql
CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students (id),
    FOREIGN KEY (course_id) REFERENCES courses (id)
);
```

### Agora podemos inserir os dados em ambas as tabelas para começar a testar:
```sql
-- Insira dados na tabela de estudantes
INSERT INTO students (name) VALUES ('Peter'), ('Matt'), ('Tony'), ('Reed');

-- Insira dados na tabela de cursos
INSERT INTO courses (name) VALUES ('Fotografia'), ('Direito'), ('Física'), ('Engenharia');
```

### Após verificar os registros nas tabelas students e courses podemos criar os registros na tabela intermediária:
```sql
SELECT * FROM students;
SELECT * FROM courses;

INSERT INTO student_courses (student_id, course_id) VALUES
	(1, 1),
	(1, 3),
	(2, 2),
	(3, 3),
	(3, 4),
	(4, 3),
	(4, 4);

-- Repare que a chave primária composta não permite
-- um mesmo estudante de um mesmo curso na tabela
INSERT INTO student_courses (student_id, course_id) VALUES (1, 3); -- ERRO
```

### Então, podemos usar o SELECT e o JOIN, assim como fizemos no relacionamento um-para-muitos, para visualizar os dados de ambas as tabelas ao mesmo tempo:
```sql
-- Visualize todos os estudantes e os cursos em que estão matriculados
SELECT
		students.id AS ID_Estudante,
    students.name AS Estudante,
    courses.id AS ID_Curso,
    courses.name AS Curso
FROM
    student_courses
JOIN students ON student_courses.student_id = students.id
JOIN courses ON student_courses.course_id = courses.id;
```