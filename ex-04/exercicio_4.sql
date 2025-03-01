CREATE DATABASE exercicio_4;

CREATE IF NOT EXISTS livros (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    genero VARCHAR(20) CHECKS (genero IN ('Romance', 'Ficção', 'Aventura', 'Suspense', 'Terror')),
    data_publicacao DATE,
    isbm VARCHAR(13),
    resumo TEXT
);

CREATE IF NOT EXISTS autores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    biografia TEXT,
    data_aniversario DATE
);

CREATE IF NOT EXISTS leitores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    genero CHAR(1) 
);

CREATE IF NOT EXISTS resenhas (
    id SERIAL PRIMARY KEY,
    livro_id INT REFERENCES livros(id),
    leitores_id INT REFERENCES leitores(id),
    avaliacao INT CHECK (avaliacao >= 1 AND avaliacao <= 5),
    comentario TEXT
);

CREATE TABLE IF NOT EXISTS livros_autores (
    livro_id INT REFERENCES livros(id),
    autores_id INT REFERENCES autores(id),
    PRIMARY KEY (livro_id, autores_id)
);