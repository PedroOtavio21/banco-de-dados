# Aula 15 - Atualização e Exclusão de linhas
1. O comando que atualiza os dados de uma linha em uma tabela no SQL é o `UPDATE`. Sua sintaxe é a seguinte:

```sql
-- UPDATE nome_da_tabela 
-- SET campo1 = valor1, campo2 = valor2 
-- WHERE condicao;

UPDATE tvseries SET status = 'Airing' WHERE status = 'Ongoing';
```

2. Também podemos atualizar múltiplos campos de uma única vez:

Obs.: aqui usamos o comando update de uma forma que é muito comum, **especificando pelo “id”** qual é a linha exata que queremos atualizar.

```sql
UPDATE movies SET title='Star Wars: A New Hope', genre='Sci-Fi/Fantasy' WHERE id=2;
```

3. É muito importante que tomemos cuidado ao executar o comando `UPDATE`, pois uma condição escrita incorretamente **pode causar atualizações incorretas**, comprometendo toda a tabela:

```sql
-- O comando abaixo fará com oque TODAS AS LINHAS tenham sua avaliação alterada!
UPDATE movies SET rating=8;
```

4. O comando de exclusão `DELETE` funciona de forma semelhante ao `SELECT`:

```sql
-- DELETE FROM nome_da_tabela 
-- WHERE condicao;

DELETE FROM tvseries WHERE title='The Office';
```

5. Também podemos excluir registros usando mais de uma condição:

```sql
DELETE FROM tvseries WHERE release_year < 2000 AND seasons > 5;
```

6. E assim como no uso do `UPDATE`, devemos ser muito cuidadosos com o `DELETE` ou podemos **causar consequências irreversíveis** na nossa base de dados:

```sql
-- TODA A BASE DE DADOS será excluida do bando :(
DELETE FROM tvseries;
```