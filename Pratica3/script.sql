--Q1

SELECT T.NOME, T.ESTADO 
    FROM TIME T JOIN UNIFORME U ON T.NOME = U.TIME
    WHERE   U.TIPO = 'TITULAR' AND
            U.COR_PRINCIPAL IS NULL;

--Q2

SELECT J.NOME, J.DATA_NASC, J.TIME, P.DATA, P.LOCAL, JG.CLASSICO
    FROM JOGADOR J JOIN JOGA JG ON J.TIME = JG.TIME1 OR J.TIME = JG.TIME2
    JOIN PARTIDA P ON P.TIME1 = JG.TIME1 AND P.TIME2 = JG.TIME2 
    AND JG.CLASSICO IS NOT NULL;

--Q3

SELECT T.NOME, T.ESTADO, D.NOME
    FROM TIME T JOIN DIRETOR D ON T.NOME = D.TIME;

--Q4

SELECT COUNT(*) AS NRO_CLASSICOS, J.CLASSICO
    FROM PARTIDA P JOIN JOGA J ON P.TIME1 = J.TIME1 AND P.TIME2 = J.TIME2
    WHERE EXTRACT(MONTH FROM P.DATA) BETWEEN 1 AND 2
    GROUP BY J.CLASSICO;

--Q5

SELECT EXTRACT(MONTH FROM P.DATA) "MES", COUNT(*) AS NRO_PARTIDAS
    FROM PARTIDA P JOIN JOGA J ON J.TIME1 = P.TIME1 AND J.TIME2 = P.TIME2
    WHERE EXTRACT(YEAR FROM P.DATA) = 2018
    GROUP BY EXTRACT(MONTH FROM P.DATA)
    ORDER BY MES, NRO_PARTIDAS;

--Q6

SELECT T.NOME, T.ESTADO, T.SALDO_GOLS, COUNT(J.CLASSICO)
    FROM TIME T JOIN JOGA J ON T.NOME = J.TIME1 OR T.NOME = J.TIME2
    WHERE J.CLASSICO = 'S'
    GROUP BY J.CLASSICO;

SELECT * FROM JOGA;
SELECT * FROM JOGADOR;
SELECT * FROM TIME;
SELECT * FROM PARTIDA;
SELECT * FROM UNIFORME;
SELECT * FROM DIRETOR;