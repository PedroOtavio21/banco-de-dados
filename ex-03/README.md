# Exercício 3 - Tabelas Relacionadas
Crie um banco de dados usando SQL para um sistema hospitalar para controle de pacientes e consultas. Serão 5 tabelas, para pacientes, consultas, médicos, especialidades e tratamentos. que deverão ser criadas seguindo os seguintes requisitos de relacionamento:

1. Os pacientes devem possuir nome completo, data de nascimento, gênero, telefone e endereço.

2. Os médicos devem possuir nome completo, telefone e também uma especialização (da tabela de especializações).

3. As especializações só precisam de um nome/título, e podem ser usadas para múltiplos médicos (ex.: a linha “Cardiologia” pode ser a especialização de 3 médicos simultaneamente)

4. As consultas são intermediárias entre pacientes e médicos, onde um paciente pode se consultar com vários médicos diferentes e um médico pode atender vários pacientes. As consultas também precisam possuir as informações: data de quando foi realizada, observações e tipo de atendimento (ex.: plano de saúde ou particular)

5. Por fim, os tratamentos só podem ser criados para uma consulta específica, porém uma mesma consulta pode ter mais de um tratamento associado a ela. O tratamento deve possuir informações sobre os medicamentos a serem usados e uma descrição do tratamento em si.

Além das tabelas, crie também as seguintes consultas SQL:

1. Obter todos os pacientes juntamente com suas consultas e os médicos que os atenderam.

2. Obter todas as consultas de um determinado médico, incluindo informações dos pacientes e observações.

3. Obter uma lista de todos os tratamentos prescritos em consultas, incluindo informações dos médicos e pacientes.

4. Obter todos os médicos com suas respectivas especializações.

5. Obter todas as consultas realizadas em uma data específica, incluindo informações de pacientes e médicos.

6. Obter uma lista de todos os pacientes que foram atendidos por médicos de uma determinada especialização.

7. Obter todos os tratamentos em andamento de um determinado paciente.