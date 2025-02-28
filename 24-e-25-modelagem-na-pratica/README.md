# Aulas 24 e 25 - Modelagem de Banco de Dados na prática

### Interprete e construa o diagrama uml:

“Nossa empresa atua com serviços gerais de informática para pequenas e médias empresas, como manutenção de computadores, redes e impressoras, tanto em modelo help-desk quanto em service-desk. Sabendo disso, precisamos de um sistema automatizado que atue no gerenciamento dos chamados de atendimento técnico.

Esse sistema deverá permitir que um chamado de atendimento seja aberto pelos nossos clientes, onde eles informarão qual é o problema e escolherão a categoria do atendimento, que pode ser problema de hardware, instalação ou configuração, suíte office, impressora, rede e outros. O chamado também precisa possuir um campo de “situação”, onde o cliente pode acompanhar o andamento e nossa equipe técnica pode ir atualizando conforme o andamento do atendimento.

Outra funcionalidade importante é a de mensagens/comentários nos chamados. A equipe técnica e o cliente devem ser capazes de anexar mensagens no chamado, informando um ao outro sobre atualizações ou observações mais detalhadas do atendimento.

Nesse sistema também queremos ter um perfil individual para cada funcionário da equipe técnica, para que ele possa ser identificado e responder diretamente aos chamados. Também precisamos que nossos clientes possuam seu próprio cadastro, assim os chamados podem ser consultados por cliente ou por responsável da equipe técnica, a fim de metrificar o desempenho de nossa equipe.”

## Entidades
Chamados (Tickets)
- descrição
- categoria
- situação
- data e hora de abertura (created_at)
- data e hora de atualização (updated_at)
- cliente que abriu
- funcionário (técnico) que respondeu

Clientes (empresa)
- cnpj
- nome
- usuário
- senha

Funcionários de equipe técnica
- nome
- usuário
- senha

Mensagens
- conteúdo
- data e hora de envio
- remetente
- chamado

## Código da aula
```sql
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  username VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS clients (
  id SERIAL PRIMARY KEY,
  cnpj VARCHAR(32) NOT NULL,
  user_id INT NOT NULL UNIQUE,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS technicians (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL UNIQUE REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS tickets (
  id SERIAL PRIMARY KEY,
  description TEXT NOT NULL,
  category VARCHAR(50)
  	NOT NULL
  	CHECK (category IN ('hardware', 'installation', 'office', 'printer', 'network', 'others')),
  status VARCHAR(50)
  	NOT NULL
  	CHECK (status IN ('open', 'queued', 'in_progress', 'closed', 'cancelled'))
  	DEFAULT 'open',
  opened_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  client_id INT NOT NULL REFERENCES clients(id),
  technician_id INT REFERENCES technicians(id)
);

CREATE TABLE IF NOT EXISTS messages (
  id SERIAL PRIMARY KEY,
  content TEXT NOT NULL,
  sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  ticket_id INT NOT NULL,
  sender_id INT NOT NULL,
  
  FOREIGN KEY (ticket_id) REFERENCES tickets(id) ON DELETE CASCADE,
  FOREIGN KEY (sender_id) REFERENCES users(id) ON DELETE CASCADE
);
```