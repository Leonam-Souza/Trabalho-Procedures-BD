INSERT INTO regras (id, ano_letivo, media_aprovacao, media_minima_exame, media_final_exame, freq_minima)
VALUES (1, 2025, 7.00, 4.00, 5.00, 75.00);
 
INSERT INTO cursos (curso, nome) VALUES ('ENG', 'ENGENHARIA');
 
INSERT INTO professores (nome) VALUES ('Cleito'), ('Mortandela');
 
INSERT INTO materias (sigla, nome, carga_horaria, curso, professor) VALUES
    ('BDA', 'BANCO DE DADOS', 144, 'ENG', 1),
    ('PRG', 'PROGRAMACAO',    144, 'ENG', 2);