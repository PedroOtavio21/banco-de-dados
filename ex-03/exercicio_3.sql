CREATE DATABASE exercicio_3;

-- Pacientes
CREATE TABLE IF NOT EXISTS pacientes (
	id SERIAL PRIMARY KEY,
  nome_completo VARCHAR(255) NOT NULL,
  data_nascimento DATE,
  genero CHAR(1),
  telefone VARCHAR(30),
  endereco VARCHAR(255)
);

-- Medicos
CREATE TABLE IF NOT EXISTS medicos (
	id SERIAL PRIMARY KEY,
  nome_completo VARCHAR(255) NOT NULL,
  telefone VARCHAR(30),
  especializacao_id INT,
  FOREIGN KEY (especializacao_id) REFERENCES especializacao (id)
);

-- Especializações
CREATE TABLE IF NOT EXISTS especializacao (
	id SERIAL PRIMARY KEY,
  titulo VARCHAR(100) NOT NULL
);

-- Concultas
CREATE TABLE IF NOT EXISTS consultas (
	id SERIAL PRIMARY KEY,
  paciente_id INT,
  medico_id INT,
  data_realizada DATE,
  observacoes VARCHAR(255),
  tipo_atendimento VARCHAR(100),
  FOREIGN KEY (paciente_id) REFERENCES pacientes (id),
  FOREIGN KEY (medico_id) REFERENCES medicos (id)
);

-- Tratamentos
CREATE TABLE IF NOT EXISTS tratamentos (
	id SERIAL PRIMARY KEY,
  consulta_id INT,
  medicamentos VARCHAR(255),
  descricao TEXT,
  FOREIGN KEY (consulta_id) REFERENCES consultas (id)
);

INSERT INTO pacientes (nome_completo, data_nascimento, genero, telefone, endereco) VALUES
('Pedro Otávio', '2002-08-06', 'm', '85987654321', 'Rua. Grande Desenvolvedor'),
('Beatriz', '2003-12-25', 'f', '85987785445', 'Rua. Super Linda'),
('Luciana Rocha', '1971-09-21', 'f', '8543342112', 'Rua. Engenhosa Mamãe'),
('João Gui', '1992-04-04', 'm', '85967321212', 'Rua. Inigualável Vendedor'),
('Pedro Pires', '2003-07-13', 'm', '85991194445', 'Rua. Ultra Médico');

INSERT INTO especializacao (titulo) VALUES 
('Cardiologia'), 
('Ortopedia'), 
('Neurologia'), 
('Dermatologia'), 
('Odontologia');

INSERT INTO medicos (nome_completo, telefone, especializacao_id) VALUES 
('Dr. Mirella Vieira', '12345678', 5),
('Dr. House', '54678329', 3),
('Dr. Luis Felopa', '34215743', 1),
('Dr. Alexandre Moreira', '35789643', 2),
('Dr. Eliza Ribeiro', '39019912', 4);

INSERT INTO consultas (paciente_id, medico_id, data_realizada, observacoes, tipo_atendimento) VALUES 
(1, 1, '2024-06-01', 'Paciente com dores no peito.', 'Particular'),
	(2, 2, '2024-06-01', 'Paciente com irritações na pele.', 'Particular'),
	(3, 3, '2024-06-01', 'Paciente com dores de cabeça.', 'Plano de Saúde B'),
	(4, 4, '2024-06-02', 'Paciente com febre e tosse.', 'Particular'),
	(5, 5, '2024-06-02', 'Paciente com dores nas costas.', 'Particular'),
	(1, 3, '2024-06-02', 'Paciente com tonturas.', 'Plano de Saúde A'),
	(2, 4, '2024-06-02', 'Paciente com dor de garganta.', 'Particular'),
	(3, 1, '2024-06-04', 'Paciente com pressão alta.', 'Particular'),
	(4, 2, '2024-06-05', 'Paciente com alergias.', 'Particular'),
	(5, 3, '2024-06-06', 'Paciente com enxaqueca.', 'Plano de Saúde A');
  
  INSERT INTO tratamentos (consulta_id, medicamentos, descricao) VALUES
	(1, 'Aspirina', 'Repouso e medicação para dor.'),
	(2, 'Pomada Antialérgica', 'Aplicação tópica diária.'),
	(3, 'Paracetamol', 'Medicação para dor e repouso.'),
	(4, 'Antibiótico', 'Medicação para infecção e repouso.'),
	(5, 'Analgésico', 'Medicação para dor e fisioterapia.'),
	(6, 'Vertizine', 'Medicação para vertigem e repouso.'),
	(7, 'Antitérmico', 'Medicação para febre e repouso.'),
	(8, 'Anti-hipertensivo', 'Medicação para controle da pressão.'),
	(9, 'Antialérgico', 'Medicação para alergia.'),
	(10, 'Analgesico', 'Medicação para dor intensa.');

SELECT 
	pacientes.id AS paciente_id,
  pacientes.nome_completo AS nome_paciente,
  consultas.id AS consulta_id,
  consultas.data_realizada,
  medicos.id AS doutor_id,
  medicos.nome_completo AS nome_doutor
FROM pacientes 
JOIN consultas ON pacientes.id = consultas.paciente_id 
JOIN medicos ON medicos.id = consultas.medico_id;

SELECT 
	medicos.id AS doutor_id,
  medicos.nome_completo AS nome_doutor,
  consultas.data_realizada,
  consultas.observacoes AS observacoes_consulta,
  pacientes.id AS paciente_id,
  pacientes.nome_completo AS nome_paciente
FROM medicos 
JOIN consultas ON medicos.id = consultas.medico_id 
JOIN pacientes ON consultas.paciente_id = pacientes.id
WHERE medicos.id = 1;

SELECT 
	tratamentos.id AS tratamento_id,
  tratamentos.descricao,
  tratamentos.medicamentos,
  consultas.data_realizada,
  medicos.nome_completo AS nome_doutor,
  pacientes.nome_completo AS nome_paciente
FROM tratamentos 
JOIN consultas ON tratamentos.consulta_id = consultas.id
JOIN medicos ON consultas.medico_id = medicos.id
JOIN pacientes ON consultas.paciente_id = pacientes.id;

SELECT 
	medicos.id AS doutor_id,
  medicos.nome_completo AS nome_completo,
  medicos.telefone,
  especializacao.titulo
FROM medicos
JOIN especializacao ON medicos.especializacao_id = especializacao.id;

SELECT 
	consultas.id AS consulta_id,
  consultas.data_realizada,
  pacientes.id AS paciente_id,
  pacientes.nome_completo AS nome_paciente,
  medicos.id AS doutor_id,
  medicos.nome_completo AS nome_doutor
FROM consultas JOIN pacientes ON consultas.paciente_id = pacientes.id
JOIN medicos ON consultas.medico_id = medicos.id
WHERE data_realizada = '2024-06-01';    

SELECT 
  pacientes.id AS paciente_id,
  pacientes.nome_completo AS nome_paciente,
  medicos.id AS doutor_id,
  medicos.nome_completo AS nome_doutor,
  especializacao.titulo
FROM pacientes 
JOIN consultas ON pacientes.id = consultas.paciente_id
JOIN medicos ON consultas.medico_id = medicos.id
JOIN especializacao ON medicos.especializacao_id = especializacao.id
WHERE especializacao.titulo = 'Cardiologia'

SELECT 
  tratamentos.medicamentos,
  tratamentos.descricao,
  consultas.data_realizada,
  consultas.observacoes,
  medicos.nome_completo AS nome_doutor,
  pacientes.nome_completo AS nome_paciente
FROM tratamentos 
JOIN consultas ON tratamentos.consulta_id = consultas.id
JOIN medicos ON consultas.medico_id = medicos.id
JOIN pacientes ON consultas.paciente_id = pacientes.id
WHERE pacientes.nome_completo = 'Pedro Otávio'
