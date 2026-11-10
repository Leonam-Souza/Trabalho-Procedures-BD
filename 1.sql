CREATE DATABASE Universidade_v2;
USE Universidade_v2;
 
CREATE TABLE regras (
    id                  TINYINT      NOT NULL DEFAULT 1,
    ano_letivo          INT          NOT NULL,
    media_aprovacao     DECIMAL(4,2) NOT NULL,   -- >= aprova direto
    media_minima_exame  DECIMAL(4,2) NOT NULL,   -- >= vai para exame
    media_final_exame   DECIMAL(4,2) NOT NULL,   -- (media + exame)/2 >= aprova
    freq_minima         DECIMAL(5,2) NOT NULL,   -- % minimo de frequencia
    PRIMARY KEY (id),
    CONSTRAINT ck_regras_linha_unica CHECK (id = 1)
);
 
CREATE TABLE alunos (
    matricula INT         NOT NULL AUTO_INCREMENT,
    nome      VARCHAR(50) NOT NULL,
    PRIMARY KEY (matricula)
);
 
CREATE TABLE cursos (
    curso CHAR(3)     NOT NULL,
    nome  VARCHAR(50) NOT NULL,
    PRIMARY KEY (curso)
);
 
CREATE TABLE professores (
    professor INT         NOT NULL AUTO_INCREMENT,
    nome      VARCHAR(50) NOT NULL,
    PRIMARY KEY (professor)
);
 
CREATE TABLE materias (
    sigla         CHAR(3)     NOT NULL,
    nome          VARCHAR(50) NOT NULL,
    carga_horaria INT         NOT NULL,
    curso         CHAR(3)     NOT NULL,
    professor     INT         NULL,
    PRIMARY KEY (sigla),
    CONSTRAINT ck_materias_carga CHECK (carga_horaria > 0),
    CONSTRAINT fk_materias_curso     FOREIGN KEY (curso)     REFERENCES cursos (curso),
    CONSTRAINT fk_materias_professor FOREIGN KEY (professor) REFERENCES professores (professor)
);
 
CREATE TABLE inscricoes (
    id_inscricao INT          NOT NULL AUTO_INCREMENT,
    matricula    INT          NOT NULL,
    materia      CHAR(3)      NOT NULL,
    per_letivo   INT          NOT NULL,
    nota_exame   DECIMAL(4,2) NULL,
    PRIMARY KEY (id_inscricao),
    UNIQUE KEY uq_inscricao (matricula, materia, per_letivo),
    CONSTRAINT ck_inscricoes_exame CHECK (nota_exame IS NULL OR nota_exame BETWEEN 0 AND 10),
    CONSTRAINT fk_inscricoes_aluno   FOREIGN KEY (matricula) REFERENCES alunos (matricula),
    CONSTRAINT fk_inscricoes_materia FOREIGN KEY (materia)   REFERENCES materias (sigla)
);
 
CREATE TABLE avaliacoes (
    id_inscricao INT          NOT NULL,
    bimestre     TINYINT      NOT NULL,
    nota         DECIMAL(4,2) NOT NULL,
    faltas       INT          NOT NULL DEFAULT 0,
    PRIMARY KEY (id_inscricao, bimestre),
    CONSTRAINT ck_aval_bimestre CHECK (bimestre BETWEEN 1 AND 4),
    CONSTRAINT ck_aval_nota     CHECK (nota BETWEEN 0 AND 10),
    CONSTRAINT ck_aval_faltas   CHECK (faltas >= 0),
    CONSTRAINT fk_aval_inscricao FOREIGN KEY (id_inscricao)
        REFERENCES inscricoes (id_inscricao) ON DELETE CASCADE
);
 