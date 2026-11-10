SELECT
    a.nome   AS aluno,
    m.nome   AS materia,
    b.n1, b.n2, b.n3, b.n4,
    b.media,
    b.total_faltas,
    b.perc_freq,
    b.nota_exame,
    b.media_final,
    b.resultado
FROM vw_boletim b
JOIN alunos  a ON a.matricula = b.matricula
JOIN materias m ON m.sigla    = b.materia
ORDER BY a.nome, m.nome;
 
SELECT resultado, COUNT(*) AS quantidade
FROM vw_boletim
GROUP BY resultado;
 
SELECT a.nome, b.materia, b.resultado
FROM vw_boletim b
JOIN alunos a ON a.matricula = b.matricula
WHERE b.resultado = 'REPROVADO';