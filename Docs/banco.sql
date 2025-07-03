CREATE DATABASE IF NOT EXISTS DB3bim;
USE DB3bim;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    sexo ENUM('M', 'F', 'O') NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20),
    ativo BOOLEAN DEFAULT TRUE,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tipos_deficiencia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('Física', 'Auditiva', 'Visual', 'Intelectual', 'Múltipla', 'Psicossocial') NOT NULL
);

CREATE TABLE graus_deficiencia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    grau ENUM('Leve', 'Moderada', 'Severa') NOT NULL
);

CREATE TABLE usuario_deficiencia (
    usuario_id INT NOT NULL,
    deficiencia_id INT NOT NULL,
    grau_id INT,
    descricao TEXT, -- Agora a descrição é do caso individual
    data_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (usuario_id, deficiencia_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (deficiencia_id) REFERENCES tipos_deficiencia(id),
    FOREIGN KEY (grau_id) REFERENCES graus_deficiencia(id)
);

INSERT INTO tipos_deficiencia (tipo) VALUES
('Física'), ('Auditiva'), ('Visual'), ('Intelectual'), ('Múltipla'), ('Psicossocial');

INSERT INTO graus_deficiencia (grau) VALUES
('Leve'), ('Moderada'), ('Severa');

INSERT INTO usuarios (nome, data_nascimento, sexo, email, telefone) VALUES
('João', '1992-04-10', 'M', 'joao@example.com', '11999990001'),
('Maria', '1999-08-22', 'F', 'maria@example.com', '11999990002'),
('Carlos', '1984-12-02', 'M', 'carlos@example.com', '11999990003'),
('Ana', '2006-03-15', 'F', 'ana@example.com', '11999990004'),
('Lucas', '1996-07-30', 'M', 'lucas@example.com', '11999990005'),
('Fernanda', '1989-11-18', 'F', 'fernanda@example.com', '11999990006');

INSERT INTO usuario_deficiencia (usuario_id, deficiencia_id, grau_id, descricao) VALUES
(1, 1, 2, 'Perneta');

INSERT INTO usuario_deficiencia (usuario_id, deficiencia_id, grau_id, descricao) VALUES
(2, 3, 3, 'Cegueira total');

INSERT INTO usuario_deficiencia (usuario_id, deficiencia_id, grau_id, descricao) VALUES
(3, 2, 1, 'Surdo de um ouvido');

INSERT INTO usuario_deficiencia (usuario_id, deficiencia_id, grau_id, descricao) VALUES
(4, 4, 2, 'TDAH');

INSERT INTO usuario_deficiencia (usuario_id, deficiencia_id, grau_id, descricao) VALUES
(5, 6, 3, 'Esquizofrenico. Viu a mãe morta na feira do rolo');

INSERT INTO usuario_deficiencia (usuario_id, deficiencia_id, grau_id, descricao) VALUES
(6, 5, 3, 'Cego manco');
