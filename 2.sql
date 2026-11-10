CREATE VIEW vw_notas AS
SELECT
    i.id_inscricao,
    i.matricula,
    m.curso,
    i.materia,
    i.per_letivo,
    m.professor,
    m.carga_horaria,
    i.nota_exame,
    MAX(CASE WHEN a.bimestre = 1 THEN a.nota   END) AS n1,
    MAX(CASE WHEN a.bimestre = 2 THEN a.nota   END) AS n2,
    MAX(CASE WHEN a.bimestre = 3 THEN a.nota   END) AS n3,
    MAX(CASE WHEN a.bimestre = 4 THEN a.nota   END) AS n4,
    MAX(CASE WHEN a.bimestre = 1 THEN a.faltas END) AS f1,
    MAX(CASE WHEN a.bimestre = 2 THEN a.faltas END) AS f2,
    MAX(CASE WHEN a.bimestre = 3 THEN a.faltas END) AS f3,
    MAX(CASE WHEN a.bimestre = 4 THEN a.faltas END) AS f4,
    COUNT(a.bimestre)               AS qtd_bimestres,
    COALESCE(SUM(a.nota), 0)        AS total_pontos,
    ROUND(AVG(a.nota), 2)           AS media,          -- media dos bimestres LANCADOS
    COALESCE(SUM(a.faltas), 0)      AS total_faltas
FROM inscricoes i
JOIN materias m              ON m.sigla = i.materia
LEFT JOIN avaliacoes a       ON a.id_inscricao = i.id_inscricao
GROUP BY i.id_inscricao, i.matricula, m.curso, i.materia, i.per_letivo,
         m.professor, m.carga_horaria, i.nota_exame;
 
CREATE VIEW vw_situacao AS
SELECT
    n.*,
    CASE
        WHEN n.qtd_bimestres = 4
        THEN ROUND((n.carga_horaria - n.total_faltas) / n.carga_horaria * 100, 2)
    END AS perc_freq
FROM vw_notas n;
 
CREATE VIEW vw_boletim AS
SELECT
    s.*,
    CASE
        WHEN s.qtd_bimestres < 4                          THEN NULL          -- ainda em andamento
        WHEN s.perc_freq < r.freq_minima                  THEN 'REPROVADO'   -- reprovado por falta
        WHEN s.media >= r.media_aprovacao                 THEN 'APROVADO'
        WHEN s.media >= r.media_minima_exame THEN
            CASE
                WHEN s.nota_exame IS NULL                 THEN 'EXAME'
                WHEN ROUND((s.media + s.nota_exame) / 2, 2) >= r.media_final_exame
                                                          THEN 'APROVADO'
                ELSE 'REPROVADO'
            END
        ELSE 'REPROVADO'
    END AS resultado,
    CASE
        WHEN s.qtd_bimestres < 4                          THEN NULL
        WHEN s.perc_freq < r.freq_minima                  THEN s.media
        WHEN s.media >= r.media_aprovacao                 THEN s.media
        WHEN s.media >= r.media_minima_exame THEN
            CASE
                WHEN s.nota_exame IS NULL                 THEN NULL
                ELSE ROUND((s.media + s.nota_exame) / 2, 2)
            END
        ELSE s.media
    END AS media_final
FROM vw_situacao s
CROSS JOIN regras r;
 