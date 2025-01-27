# Aula 17 - Relacionamento entre Tabelas

## O que são relacionamentos?
Também chamados de associações, são formas de **vincularmos** os dados de uma tabela aos dados de **outra tabela**.

**Exemplo:**
Temos duas tabelas: **clientes** e **endereços**.
Um relacionamento entre essas tabelas permite que associemos uma linha da tabela de usuários a um endereço específico.

```
Usuário
id: 312,
nome: 'Pedro',
email: 'pedro@email.com'
id_endereco: 9634
```

```
Endereço
id: 9634,
rua: 'Av. Presidente Vargas',
numero: '34',
bairro: 'Centro',
id_usuario: 312
```

## Como funcionam os relacionamentos? 
Revisando conceitos:
- **Chave Primária (Primary Key, ou simplesmente PK)**: Coluna ou conjunto de colunas que identificam unicamente cada linha de uma tabela.

Além das Chaves Primárias, os relacionamentos utilizam o conceito de Chave Estrangeira:
- **Chave Estrangeira (Foreign Key ou FK)**: Coluna ou conjunto de colunas que estabelecem uma ligação entre duas tabelas. 

## Existem 3 tipos de relacionamentos no SQL
**Um-para-Um (1:1)**: 
- **Cada linha** de uma tabela está relacionada a, no máximo, **uma linha** de outra tabela.

- Ex.: **um usuário** possui **um endereço** e um endereço **só pode pertencer** a um usuário.

**Um-para-Muitos (1:n)**:
- **Cada linha** de uma tabela pode estar relacionada a **múltiplas linhas** de outra tabela.

- Ex.: **um filme** possui **um gênero**, mas um mesmo gênero pode ser usado para **vários filmes**.

**Muitos-para-Muitos (n:n)**:
- **Linhas de uma tabela** podem estar relacionadas a **múltiplas linhas de outra tabela** e vice-versa, implementado com a ajuda de uma tabela intermediária.

- Ex.: **um post** pode ser classificado com **várias tags**, e uma **mesma tag** pode ser usada para classificar **vários posts**.

## Por que os relacionamentos são importantes?
1. **Garantir integridade**
- Relacionamentos ajudam a manter a consistência dos dados que as associações entre tabelas sejam válidas
  - **Exemplo**: se uma tabela Pedidos tem uma chave estrangeira que referencia a tabela Clientes, cada pedido deve estar associado a um cliente existente 

- As chaves estrangeiras impôem restições que evitam a inserção de dados orfãos ou inconsistentes
  - **Exemplo**: você não pode inserir um pedido para um cliente que não existe na tabela de Clientes

2. **Evitar redundância**
- Relacionamentos permitem a normalização do banco de dados, onde os dados são divididos em tabelas relacionadas de forma que cada peça de informação seja armazenada uma única vez
  - ***Normalização*** é um conjunto de regras que visa a organização de um projeto de banco de dados para reduzir a redundancia de dados, aumentar a integridade de dados e o desempenho

- Com a redução da redundância, a manutenção dos dados se torna mais simples e menos propensa a erros

- Atualizações feitas em uma tabela relacionada automaticamente se refletem nas associações, eliminando a necessiade de múltiplas atualizações em várias tabelas

3. **Consultas eficientes**
- Relacionamentos bem estruturados permitem a execução de operações de junção (`JOIN`) eficientes, que são essenciais para consultas complexas envolvendo múltiplas tabelas ao mesmo tempo
  - **Exemplo**: para obter os pedidos feitos por um cliente, uma junção entre as tabelas Clientes e Pedidos pode ser realizada

4. **Modelagem intuitiva**
- Relacionamentos permitem que o modelo de dados do banco de dados reflita as relações do mundo real entre diferentes entidades

5. **Controle de acesso e segurança**
- Relacionamentos permitem controles de acesso mais precisos, permissões podem ser estabelecidas para que apenas determinados usuários possam modificar dados em tabelas específicas, enquanto outros possam apenas visualizar dados agregados ou relacionados

- Através de relacionamentos bem definidos, é possível implementar políticas de segurança que garantem que os dados sensíveis sejam protegidos e acessados apenas conforme necessário, evitando vazamentos e acessos não autorizados