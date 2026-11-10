CALL sp_matricular_aluno('Robertinho', 'ENG');   -- 1
CALL sp_matricular_aluno('Maria',      'ENG');   -- 2
CALL sp_matricular_aluno('Joao',       'ENG');   -- 3
CALL sp_matricular_aluno('Ana',        'ENG');   -- 4
CALL sp_matricular_aluno('Pedro',      'ENG');   -- 5
 
-- Aluno 1: BDA vai para exame e passa; PRG aprovado direto
CALL sp_lancar_nota(1, 'BDA', 2025, 1, 8.00, 2);
CALL sp_lancar_nota(1, 'BDA', 2025, 2, 7.00, 0);
CALL sp_lancar_nota(1, 'BDA', 2025, 3, 6.00, 4);
CALL sp_lancar_nota(1, 'BDA', 2025, 4, 5.00, 0);
CALL sp_lancar_exame(1, 'BDA', 2025, 6.00);
 
CALL sp_lancar_nota(1, 'PRG', 2025, 1,  9.00, 0);
CALL sp_lancar_nota(1, 'PRG', 2025, 2,  9.00, 1);
CALL sp_lancar_nota(1, 'PRG', 2025, 3,  8.00, 0);
CALL sp_lancar_nota(1, 'PRG', 2025, 4, 10.00, 0);
 
-- Aluno 2: BDA aprovado; PRG reprovado (e depois corrige o 1o bimestre)
CALL sp_lancar_nota(2, 'BDA', 2025, 1, 7.00, 0);
CALL sp_lancar_nota(2, 'BDA', 2025, 2, 8.00, 2);
CALL sp_lancar_nota(2, 'BDA', 2025, 3, 7.00, 0);
CALL sp_lancar_nota(2, 'BDA', 2025, 4, 8.00, 2);
 
CALL sp_lancar_nota(2, 'PRG', 2025, 1, 3.00, 1);
CALL sp_lancar_nota(2, 'PRG', 2025, 2, 4.00, 1);
CALL sp_lancar_nota(2, 'PRG', 2025, 3, 2.00, 1);
CALL sp_lancar_nota(2, 'PRG', 2025, 4, 3.00, 1);
 
CALL sp_lancar_nota(2, 'PRG', 2025, 1, 9.00, 1);     -- correcao do bimestre 1
CALL sp_lancar_exame(2, 'PRG', 2025, 3.00);
 
-- Aluno 3: BDA reprovado por frequencia; PRG exatamente 75% (aprovado)
CALL sp_lancar_nota(3, 'BDA', 2025, 1, 9.00, 10);
CALL sp_lancar_nota(3, 'BDA', 2025, 2, 9.00, 10);
CALL sp_lancar_nota(3, 'BDA', 2025, 3, 9.00, 10);
CALL sp_lancar_nota(3, 'BDA', 2025, 4, 9.00, 10);
CALL sp_lancar_exame(3, 'BDA', 2025, 10.00);         -- ignorado (nao esta em EXAME)
 
CALL sp_lancar_nota(3, 'PRG', 2025, 1, 7.00, 9);
CALL sp_lancar_nota(3, 'PRG', 2025, 2, 7.00, 9);
CALL sp_lancar_nota(3, 'PRG', 2025, 3, 7.00, 9);
CALL sp_lancar_nota(3, 'PRG', 2025, 4, 7.00, 9);
 
-- Aluno 4: BDA exame e passa raspando; PRG com so 2 bimestres (em andamento)
CALL sp_lancar_nota(4, 'BDA', 2025, 1, 4.00, 0);
CALL sp_lancar_nota(4, 'BDA', 2025, 2, 4.00, 0);
CALL sp_lancar_nota(4, 'BDA', 2025, 3, 4.00, 0);
CALL sp_lancar_nota(4, 'BDA', 2025, 4, 4.00, 0);
CALL sp_lancar_exame(4, 'BDA', 2025, 6.00);
 
CALL sp_lancar_nota(4, 'PRG', 2025, 1, 8.00, 1);
CALL sp_lancar_nota(4, 'PRG', 2025, 2, 6.00, 0);
 
-- Aluno 5: BDA zerado; PRG 10,10,10,10 e depois correcoes que levam a exame
CALL sp_lancar_nota(5, 'BDA', 2025, 1, 0.00, 0);
CALL sp_lancar_nota(5, 'BDA', 2025, 2, 0.00, 0);
CALL sp_lancar_nota(5, 'BDA', 2025, 3, 0.00, 0);
CALL sp_lancar_nota(5, 'BDA', 2025, 4, 0.00, 0);
 
CALL sp_lancar_nota(5, 'PRG', 2025, 1, 10.00, 0);
CALL sp_lancar_nota(5, 'PRG', 2025, 2, 10.00, 0);
CALL sp_lancar_nota(5, 'PRG', 2025, 3, 10.00, 0);
CALL sp_lancar_nota(5, 'PRG', 2025, 4, 10.00, 0);
 
CALL sp_lancar_nota(5, 'PRG', 2025, 2, 2.00, 0);     -- correcoes
CALL sp_lancar_nota(5, 'PRG', 2025, 3, 0.00, 0);
CALL sp_lancar_exame(5, 'PRG', 2025, 9.00);