# Aula 2 - O que são Bancos de Dados
São um conjunto de arquivos relacionados entre si que armazenam todo o tipo de dados (sobre pessoas, usuários, objetos, etc)

No começo, eram gerenciados pelo próprio sistema de arquivos e SOs, até surgirem os SGBDs 
- Um SGBD (Sistema de Gerênciamento de Banco de Dados) é um software encarregado de cuidar do acesso, persistencia, manipulação e organização dos dados.

- Um SGBD (do inglês, DBMS) é o que chamamos hoje informalmente de "banco de dados", mas ele não é o banco de dados em si

- Um SGBD inclui o banco de dados, mas pode incluir várias outras ferramentas em seu ecossistema (aplicativo de interface gráfica e afins)

- Exemplos de SGBDs conhecidos: PostgreSQL, SQL Server, MySQL, MariaDB, Oracle, Firebird, MongoDB, etc

São comumente divididos em duas categorias:
- **Relacionais ou SQL**: bancos mais tradicionais que trabalham com uma linguagem de consulta estruturada padrão (SQL)

- **Não-relacionais ou NoSQL**: bancos mais modernos que se popularizaram a partir da década de 2010 para solução de diversos problemas específicos, não utilizando os conceitos tradicionais e linguagem SQL

- Neste curos trabalharemos exclusivamente com o **primeiro tipo (SQL)**

Conceitos fundamentais para entender os bancos de dados SQL:
1. **Tabelas**: forma estruturada de armazenar os dados. Um banco de dados é composto de várias tabelas (relacionadas ou não)

2. **Colunas**: definem quais os dados podem ser inseridos em uma tabela

3. **Linhas**: são os registros de dados em si. Cada linha é considerada uma entrada individual da tabela

4. **Relacionamentos**: formas de vincular uma tabela a outra para criar estruturas mais robustas e coesas
- Obs.: Apesar de o relacionamento ser entre tabelas, na prática são as linhas de uma tabela que acabam vinculadas às linhas de outras tabelas

5. **Chave Primária**: a coluna de uma tabela que é a única e serve para identificar cada linha

6. **Constraints**: (do inglês: restrições ou regras) limitações e regras impostas sobre o banco de dados