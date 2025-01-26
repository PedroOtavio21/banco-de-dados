# Aula 16 - Trabalhando com Backup e Restauração
1. Backup e restauração são processos cruciais para garantir a **segurança e integridade dos dados**. No PostgreSQL, esses processos podem ser realizados usando os utilitários de linha de comando `pg_dump` e `pg_restore`.

2. Para criar um backup usando o pg_dump, um comando do terminal que deve seguir o seguinte formato:

```
pg_dump -U _nome_usuario -F c -b -v -f /caminho/do/arquivo.backup nome_do_banco
```

Explicação dos Parâmetros:

- -`U username`: Especifica o usuário do PostgreSQL para realizar a conexão.

- -`F c`: Define o formato do arquivo de backup. As opção são “p” (padrão, texto simples), “t” (tar), “d” (directory) e “c” (custom)

- -`b`: Inclui os grandes objetos (blobs).

- -`v`: Modo verboso, para detalhes do processo.

- -`f /path/to/backup/file.backup`: Caminho e nome do arquivo de backup.

- - `database_name`: Nome do banco de dados a ser copiado.

- - Para outros parâmetros, consulte `pg_dump --help`

3. Vamos experimentar fazer o backup da nossa base de filmes e séries de tv:

```
pg_dump -v -F c -f ~/pg_backups/exercicio2_sql.backup exercicio2_sql
```

4. Agora podemos excluir nossa base de dados:

```sql
-- fora do psql, usando o próprio utilitário do postgres
dropdb exercicio2_sql

-- dentro do psql, usando SQL
DROP DATABASE exercicio2_sql;
```

5. Agora que excluímos o banco, podemos restaurá-lo com o comando `pg_restore`, que funciona no seguinte formato:

```
pg_restore -U nome_usuario -d nome_banco --create -v ~/caminho/do/arquivo.backup
```

Explicação dos Parâmetros:

- -U nome_usuario: Especifica o usuário do PostgreSQL. para realizar a conexão

- -d nome_banco: Especifica o nome do banco para realizar a conexão (não necessariamente o banco a ser restaurado).

- --create: Diz que o banco de dados deve ser criado (do contrário ele tentará realizar o backup no banco de dados usado na conexão).

- -v: Modo verboso, para detalhes do processo.

- ~/caminho/do/arquivo.backup: Caminho e nome do arquivo de backup.

- Para outros parâmetros, consulte pg_restore --help

6. Vamos restaurar nossa base de dados com o comando a seguir:

Obs.: repare que usamos o banco principal “postgres” para realizar a conexão, mas graças ao parâmetro `--create` o nosso banco “exercicio2_sql” será criado e então o backup será restaurado nele.

```
pg_restore --create -d postgres -v ~/pg_backups/exercicio2_sql.backup
```

7. Vamos testar o outro formato. Acesse o psql e exclua apenas as tabelas do banco usando `DROP TABLE movies;` e `DROP TABLE tvseries;`, e então utilize o comando:

```
pg_restore -d exercicio2_sql -v ~/pg_backups/exercicio2_sql.backup
```

8. Uma última coisa interessante que podemos fazer com esses utilitários é o backup e restauração de tabelas específicas em um banco de dados utilizando o parâmetro -t. Com o nosso banco restaurado, vamos realizar o backup da tabela “movies”:

```
pg_dump -v -F c -f ~/pg_backups/tabela_filmes.psql -t movies exercicio2_sql
```

9. Agora vamos apagar todos os dados da tabela “movies”:

```sql
DELETE FROM movies;
```

10. Por fim, usamos o utilitário pg_restore com o parâmetro -t:

```
pg_restore -t movies --data-only ~/pg_backups/tabela_filmes.psql
```