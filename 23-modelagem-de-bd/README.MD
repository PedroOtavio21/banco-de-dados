# Aula 21 - Introdução à Modelagem de Banco de Dados

## O que é e para que serve?
Processo de criar uma **representação visual** do sistema de banco de dados

Organizar os dados de maneira **lógica e eficiente**, ajudando a definir quais informações precisam ser armazenadas

## Identificando requisitos
Chamamos de **requisitos** as funcionalidades e regras necessárias para o sistema

Os *stakeholders* tem um papel importante nessa etapa

- Stakeholders são as partes interessadas no desenvolvimento do sistema, geralmente é quem melhor consegue definir o que o sistema precisa fazer 

Devem ser coletadas tantas informações quanto for possível sobre como o sistema deverá se comportar

## Definindo tabelas
As informações coletadas são utilizadas para mapear tabelas e colunas

Entidades costumam se tornar tabelas, atributos costumam se tornar colunas

**Exemplo**:
- Entidade "alunos" -> Tabela "alunos",
- Entidade "professores" -> Tabela "professores",
- Atributos "nome", "telefone", "matrícula", "data de nascimento" se tornam colunas

## Pensando nos relacionamentos
1. Alguns relacionamentos são intuitivos, podem ser inferidos a partir das características das entidades

**Exemplo**:
- Uma publicação e um autor são entidades (e tabelas) diferentes, mas **uma aplicação necessita de um autor**, logo, temos um relacionamento

2. Outros relacionamentos são um pouco mais 'artificiais', modelamos a partir de uma necessidade do sistema

**Exemplo**:
- Um paciente e um médico são entidades (e tabela) diferentes, e a princípio não tem conexão. No entanto, o sistema necessita saber quais pacientes foram atendidos por quais médicos, logo, temos que criar um relacionamento (que pode ser feito através de outra tabela, como a de "consultas")

3. E uma última dica é usar como referência as consultas que deverão ser executadas para planejar os relacionamentos necessários

**Exemplo**:
- Um sistema de móveis precisa que seja possível realizar uma consulta para obter os usuários que demonstraram interesse em um imóvel disponível, logo, precisamos de uma forma de armazenar isso (antes mesmo de alugar o imóvel, que seria um relacionamento mais intuitivo)