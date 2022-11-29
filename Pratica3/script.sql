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
    FROM TIME T LEFT JOIN DIRETOR D ON T.NOME = D.TIME;

--Q4

SELECT COUNT(P.TIME1) AS NRO_CLASSICOS, J.CLASSICO
    FROM PARTIDA P RIGHT JOIN JOGA J ON P.TIME1 = J.TIME1 AND 
                                        P.TIME2 = J.TIME2 AND
                                        EXTRACT(MONTH FROM P.DATA) BETWEEN 1 AND 2
    WHERE J.CLASSICO IS NOT NULL
    GROUP BY J.CLASSICO;

--Q5

SELECT EXTRACT(MONTH FROM P.DATA) "MES", COUNT(*) AS NRO_PARTIDAS
    FROM PARTIDA P JOIN JOGA J ON J.TIME1 = P.TIME1 AND J.TIME2 = P.TIME2
    WHERE EXTRACT(YEAR FROM P.DATA) = 2018
    GROUP BY EXTRACT(MONTH FROM P.DATA)
    ORDER BY MES, NRO_PARTIDAS;

--Q6 (INCOMPLETO)

SELECT  T.NOME, T.ESTADO, T.SALDO_GOLS, 
        EXTRACT(YEAR FROM P.DATA) ANO, 
        COUNT(J.CLASSICO)AS JOGOS_CLASSICOS
    FROM TIME T JOIN JOGA J ON T.NOME = J.TIME1 OR T.NOME = J.TIME2
    JOIN PARTIDA P ON J.TIME1 = P.TIME1 OR J.TIME2 = P.TIME2
    WHERE J.CLASSICO = 'S'
    GROUP BY T.NOME, T.ESTADO, T.SALDO_GOLS, EXTRACT(YEAR FROM P.DATA)
    ORDER BY ANO;

SELECT  T.NOME, T.ESTADO, T.SALDO_GOLS,
        EXTRACT(YEAR FROM P.DATA) ANO, 
        COUNT(J.CLASSICO)AS JOGOS_CLASSICOS
    FROM TIME T JOIN JOGA J ON T.NOME = J.TIME1 OR T.NOME = J.TIME2
    JOIN PARTIDA P ON J.TIME1 = P.TIME1 OR J.TIME2 = P.TIME2
    WHERE T.NOME IN (SELECT DISTINCT T.NOME
                        FROM TIME T JOIN PARTIDA P 
                        ON T.NOME = P.TIME1 OR T.NOME = P.TIME2)
    GROUP BY T.NOME, T.ESTADO, T.SALDO_GOLS, EXTRACT(YEAR FROM P.DATA)
    ORDER BY ANO, T.NOME;

SELECT * FROM JOGA;
SELECT * FROM JOGADOR;
SELECT * FROM TIME;
SELECT * FROM PARTIDA;
SELECT * FROM UNIFORME;
SELECT * FROM DIRETOR;

--Q7 (INCOMPLETO)

SELECT T.NOME, P.TIME1,P.TIME2, P.PLACAR
    FROM TIME T JOIN JOGA J ON T.NOME = J.TIME1 OR T.NOME = J.TIME2
    JOIN PARTIDA P ON P.TIME1 = J.TIME1 AND P.TIME2 = J.TIME2
    WHERE   UPPER(T.TIPO) = 'PROFISSIONAL' AND 
            UPPER(J.CLASSICO) = 'S' AND
            P.PLACAR IS NOT NULL
    GROUP BY T.NOME,P.TIME1,P.TIME2, P.PLACAR;

--Q8

SELECT ESTADO, TIPO, COUNT(NOME) AS CONTAGEM, TRUNC(AVG(SALDO_GOLS),2) AS MEDIA
    FROM TIME
    WHERE ESTADO IS NOT NULL
    GROUP BY ESTADO,TIPO
    ORDER BY ESTADO, TIPO;

--Q9 

SELECT P.TIME1, P.TIME2, COUNT(*) AS VEZES_ENFRETADAS
    FROM JOGA J JOIN PARTIDA P ON J.TIME1 = P.TIME1 AND J.TIME2 = P.TIME2
    WHERE PLACAR IS NOT NULL
    GROUP BY P.TIME1, P.TIME2;
    
--Q10 (INCOMPLETO)
-- QUAL OPERADOR PARA GARANTIR MATCH ENTRE LISTA??

SELECT T.NOME, P.LOCAL
    FROM TIME T JOIN PARTIDA P ON T.NOME = P.TIME1 OR T.NOME = P.TIME2
    WHERE P.LOCAL <= ALL ( SELECT LOCAL FROM PARTIDA
                        WHERE   TIME1 = 'SANTOS' OR TIME2 = 'SANTOS' AND
                        LOCAL IS NOT NULL);
                        
--Q11

SELECT NOME, ESTADO, SALDO_GOLS
    FROM TIME
    WHERE ESTADO IS NOT NULL
    ORDER BY SALDO_GOLS, ESTADO;
 
 --DESAFIO (INCOMPLETO)
/*
ELABORE UMA OUTRA VERSAO PARA ESSA CONSULTA
QUERY: Selecionar, para cada jogador: nome, data de nascimento, time em que 
joga, estado do time e, se o time jogou alguma partida cl�ssica, listar tamb�m 
data e local da partida
*/
SELECT J.NOME, J.DATA_NASC, J.TIME, T.ESTADO, P.LOCAL, P.DATA
    FROM JOGA JA JOIN PARTIDA P ON (JA.TIME1 = P.TIME1 AND JA.TIME2 = P.TIME2) 
        AND JA.CLASSICO = 'S'
    RIGHT JOIN JOGADOR J ON JA.TIME1 = J.TIME OR JA.TIME2 = J.TIME
    JOIN TIME T ON J.TIME = T.NOME
    ORDER BY J.NOME;

SELECT JGD.NOME, JGD.DATA_NASC, JGD.TIME, T.ESTADO,  P.LOCAL, P.DATA
    FROM PARTIDA P JOIN JOGA J ON P.TIME1 = J.TIME1 AND P.TIME2 = J.TIME2
        AND J.CLASSICO = 'S' --observa��o, precisa ser feito a filtragem aqui
    RIGHT JOIN TIME T ON T.NOME = P.TIME1 OR T.NOME = P.TIME2
    JOIN JOGADOR JGD ON JGD.TIME = T.NOME
    ORDER BY JGD.NOME;
 
SELECT * FROM JOGA;
SELECT * FROM JOGADOR;
SELECT * FROM TIME;
SELECT * FROM PARTIDA;
SELECT * FROM UNIFORME;
SELECT * FROM DIRETOR;