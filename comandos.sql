USE Universidade;

CALL procMATRICULAALUNO('Robertinho', 'ENG');

CALL sp_CadastraNotas(1, 'ENG', 'BDA', 2025, 8.00, 2, 1);
CALL sp_CadastraNotas(1, 'ENG', 'BDA', 2025, 7.00, 0, 2);
CALL sp_CadastraNotas(1, 'ENG', 'BDA', 2025, 6.00, 4, 3);
CALL sp_CadastraNotas(1, 'ENG', 'BDA', 2025, 5.00, 0, 4);

CALL sp_LancaExame(1, 'ENG', 'BDA', 2025, 6.00);

SELECT * FROM MATRICULA;

USE Universidade;

CALL procMATRICULAALUNO('Robertinho', 'ENG');
CALL procMATRICULAALUNO('Maria', 'ENG');
CALL procMATRICULAALUNO('Joao', 'ENG');
CALL procMATRICULAALUNO('Ana', 'ENG');
CALL procMATRICULAALUNO('Pedro', 'ENG');

SELECT * FROM ALUNOS;
SELECT MATRICULA, MATERIA, PERLETIVO, RESULTADO FROM MATRICULA;


CALL sp_CadastraNotas(1, 'ENG', 'BDA', 2025, 8.00, 2, 1);
CALL sp_CadastraNotas(1, 'ENG', 'BDA', 2025, 7.00, 0, 2);
CALL sp_CadastraNotas(1, 'ENG', 'BDA', 2025, 6.00, 4, 3);
CALL sp_CadastraNotas(1, 'ENG', 'BDA', 2025, 5.00, 0, 4);
CALL sp_LancaExame(1, 'ENG', 'BDA', 2025, 6.00);

CALL sp_CadastraNotas(1, 'ENG', 'PRG', 2025, 9.00, 0, 1);
CALL sp_CadastraNotas(1, 'ENG', 'PRG', 2025, 9.00, 1, 2);
CALL sp_CadastraNotas(1, 'ENG', 'PRG', 2025, 8.00, 0, 3);
CALL sp_CadastraNotas(1, 'ENG', 'PRG', 2025, 10.00, 0, 4);

CALL sp_CadastraNotas(2, 'ENG', 'BDA', 2025, 7.00, 0, 1);
CALL sp_CadastraNotas(2, 'ENG', 'BDA', 2025, 8.00, 2, 2);
CALL sp_CadastraNotas(2, 'ENG', 'BDA', 2025, 7.00, 0, 3);
CALL sp_CadastraNotas(2, 'ENG', 'BDA', 2025, 8.00, 2, 4);

CALL sp_CadastraNotas(2, 'ENG', 'PRG', 2025, 3.00, 1, 1);
CALL sp_CadastraNotas(2, 'ENG', 'PRG', 2025, 4.00, 1, 2);
CALL sp_CadastraNotas(2, 'ENG', 'PRG', 2025, 2.00, 1, 3);
CALL sp_CadastraNotas(2, 'ENG', 'PRG', 2025, 3.00, 1, 4);

CALL sp_CadastraNotas(2, 'ENG', 'PRG', 2025, 9.00, 1, 1);
CALL sp_LancaExame(2, 'ENG', 'PRG', 2025, 3.00);

CALL sp_CadastraNotas(3, 'ENG', 'BDA', 2025, 9.00, 10, 1);
CALL sp_CadastraNotas(3, 'ENG', 'BDA', 2025, 9.00, 10, 2);
CALL sp_CadastraNotas(3, 'ENG', 'BDA', 2025, 9.00, 10, 3);
CALL sp_CadastraNotas(3, 'ENG', 'BDA', 2025, 9.00, 10, 4);

CALL sp_LancaExame(3, 'ENG', 'BDA', 2025, 10.00);


CALL sp_CadastraNotas(3, 'ENG', 'PRG', 2025, 7.00, 9, 1);
CALL sp_CadastraNotas(3, 'ENG', 'PRG', 2025, 7.00, 9, 2);
CALL sp_CadastraNotas(3, 'ENG', 'PRG', 2025, 7.00, 9, 3);
CALL sp_CadastraNotas(3, 'ENG', 'PRG', 2025, 7.00, 9, 4);

CALL sp_CadastraNotas(4, 'ENG', 'BDA', 2025, 4.00, 0, 1);
CALL sp_CadastraNotas(4, 'ENG', 'BDA', 2025, 4.00, 0, 2);
CALL sp_CadastraNotas(4, 'ENG', 'BDA', 2025, 4.00, 0, 3);
CALL sp_CadastraNotas(4, 'ENG', 'BDA', 2025, 4.00, 0, 4);
CALL sp_LancaExame(4, 'ENG', 'BDA', 2025, 6.00);


CALL sp_CadastraNotas(4, 'ENG', 'PRG', 2025, 8.00, 1, 1);
CALL sp_CadastraNotas(4, 'ENG', 'PRG', 2025, 6.00, 0, 2);

CALL sp_CadastraNotas(5, 'ENG', 'BDA', 2025, 0.00, 0, 1);
CALL sp_CadastraNotas(5, 'ENG', 'BDA', 2025, 0.00, 0, 2);
CALL sp_CadastraNotas(5, 'ENG', 'BDA', 2025, 0.00, 0, 3);
CALL sp_CadastraNotas(5, 'ENG', 'BDA', 2025, 0.00, 0, 4);

CALL sp_CadastraNotas(5, 'ENG', 'PRG', 2025, 10.00, 0, 1);
CALL sp_CadastraNotas(5, 'ENG', 'PRG', 2025, 10.00, 0, 2);
CALL sp_CadastraNotas(5, 'ENG', 'PRG', 2025, 10.00, 0, 3);
CALL sp_CadastraNotas(5, 'ENG', 'PRG', 2025, 10.00, 0, 4);

CALL sp_CadastraNotas(5, 'ENG', 'PRG', 2025, 2.00, 0, 2);

CALL sp_CadastraNotas(5, 'ENG', 'PRG', 2025, 0.00, 0, 3);

CALL sp_LancaExame(5, 'ENG', 'PRG', 2025, 9.00);

SELECT
    A.NOME AS ALUNO,
    M.NOME AS MATERIA,
    MT.N1, MT.N2, MT.N3, MT.N4,
    MT.MEDIA,
    MT.TOTALFALTAS,
    MT.PERCFREQ,
    MT.NOTAEXAME,
    MT.MEDIAFINAL,
    MT.RESULTADO
FROM MATRICULA MT
INNER JOIN ALUNOS A ON MT.MATRICULA = A.MATRICULA
INNER JOIN MATERIAS M ON MT.MATERIA = M.SIGLA
ORDER BY A.NOME, M.NOME;

SELECT RESULTADO, COUNT(*) AS QUANTIDADE
FROM MATRICULA
GROUP BY RESULTADO;

SELECT A.NOME, MT.MATERIA, MT.RESULTADO
FROM MATRICULA MT
INNER JOIN ALUNOS A ON MT.MATRICULA = A.MATRICULA
WHERE MT.RESULTADO = 'REPROVADO';

