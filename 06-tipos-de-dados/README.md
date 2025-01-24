# Aula 6 - Tipos de dados
Tipos de dados definem a natureza dos valores que podem ser armazenados em uma coluna de uma tabela

Escolher o tipo de dados adequado é crucial para a **eficiência**, **integridade** e **otimização** do banco de dados

**Obs.:** existe muita discussão em relação a quais tipos de dados são melhores ou piores em cada caso, então, como iniciante, procure ir pelo **caminho mais simples** e entenda os principais

Dados numéricos:
- `SMALLINT`: Inteiro de 2 bytes
- `INT` / `INTEGER`: Inteiro de 4 bytes
- `BIGINT`: Inteiro de 8 bytes
- `FLOAT`: Número com ponto flutuante e precisão simples
- `DOUBLE`: Número com ponto flutuante e precisão dupla
- `DECIMAL` / `NUMERIC`: Número de precisão fixa, útil para valores monetários

Dados de texto:
- `CHAR(n)`: Cadeia de caracteres de comprimento fixo
- `VARCHAR(n)`: Cadeia de caracteres de comprimento variavel
- `TEXT`: Cadeia de caracteres de comprimento muito grande

Dados de data e hora:
- `DATE`: Data (ano, mês, dia)
- `TIME`: Hora (hora, minuto, segundo)
- `DATETIME`: Combinação de qualquer data e hora
- `TIMESTAMP`: Data e hora, muito usado para metadados

Outros tipos de dados:
- `BOOLEAN`: Representa valores lógicos (TRUE ou FALSE)
- `BLOB`: Dados binários grandes, usados para armazenar arquivos como imagens e vídeos (pouco usados)
- `ENUM`: Conjunto de valores predefinidos
- `JSON`: Armazena dados em formato JSON

Dica: Em casos de querer armazenar dados como imagem ou vídeos, seria mais eficaz **salvá-los em ambientes exertos (serviços de nuvens e afins)**