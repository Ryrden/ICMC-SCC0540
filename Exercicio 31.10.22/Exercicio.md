# Exercícios de desenvolvimento

Considere o esquema a seguir, e as restrições semânticas conhecidas:

- o tipo do Time só pode assumir os valores 'AMADOR' e 'PROFISSIONAL';
- o atributo classico de Joga indica se o jogo é um clássico ou não;
- um jogador deve obrigatoriamente atuar em um time;
- o tipo do Uniforme pode ser 'TITULAR' ou 'RESERVA';
- o placar inicial (default) de uma partida é sempre 0X0;

![modelo Relacional](ModeloRelacional.png)

1. Crie o esquema da base de dados (tabelas) de acordo com o esquema lógico acima.
    - crie todas as tabelas
    - defina todas as restrições de integridade e semânticas necessárias
      - dica: para o atributo de placar, faça check de verificação de formato.
    Pesquise REGEXP_LIKE
    - defina os atributos que podem e que não podem assumir valor nulo;
    - defina valores default
    - defina as ações apropriadas associadas a operações de remoção de tuplas referenciadas por chaves estrangeiras (ON DELETE)

2. Faça algumas inserções/atualizações/remoções de dados nas tabelas:
   - use TO_DATE() para inserção de datas
   - teste as restrições (inserções com sucesso e inserções com erros)
   - faça a seguinte inserção:
     - 1 time de SP
     - 1 time do RJ
     - 1 jogador para cada um desses times
     - 1 partida entre esses dois times
   - remova da tabela Time o time de SP (usando o estado como condição de localização); quais tabelas foram afetadas, e como?

## Exercicio 1

```SQL

CREATE TABLE TIME (
    NOME VARCHAR2(30) NOT NULL,
    ESTADO VARCHAR2(30) NOT NULL,
    TIPO VARCHAR2(30) NOT NULL
                    CHECK (TIPO IN ('AMADOR', 'PROFISSIONAL')),
    SALDO_GOLS NUMBER(3) DEFAULT 0,
    PRIMARY KEY (NOME)
);  

CREATE TABLE JOGA (
    TIME1 VARCHAR2(30) NOT NULL,
    TIME2 VARCHAR2(30) NOT NULL,
    CLASSICO BOOLEAN NOT NULL,
    PRIMARY KEY (TIME1, TIME2),
    CONSTRAINT FK_JOGA_1 FOREIGN KEY (TIME1) REFERENCES TIME (NOME)
    ON DELETE CASCADE,
    CONSTRAINT FK_JOGA_2 FOREIGN KEY (TIME2) REFERENCES TIME (NOME)
    ON DELETE CASCADE
);

CREATE TABLE PARTIDA (
    TIME1 VARCHAR2(30) NOT NULL,
    TIME2 VARCHAR2(30) NOT NULL,
    DATA DATE NOT NULL,
    PLACAR VARCHAR2(30) DEFAULT '0x0'
                        CHECK (PLACAR REGEXP_LIKE '^[0-9]+x[0-9]+$'),
    LOCAL VARCHAR2(30) NOT NULL,
    PRIMARY KEY (TIME1, TIME2, DATA),
    CONSTRAINT FK_PARTIDA FOREIGN KEY (TIME1, TIME2) REFERENCES JOGA (TIME1, TIME2) ON DELETE CASCADE
);

CREATE TABLE JOGADOR (
    CPF VARCHAR2(30) NOT NULL,
    RG VARCHAR2(30) NOT NULL,
    NOME VARCHAR2(30) NOT NULL,
    DATA_NASC DATE NOT NULL,
    NATURALIDADE VARCHAR2(30) NOT NULL,
    TIME VARCHAR2(30) NOT NULL,
    PRIMARY KEY (CPF),
    UNIQUE (RG, NOME),
    CONSTRAINT FK_JOGADOR FOREIGN KEY (TIME) REFERENCES TIME (NOME) 
    ON DELETE RESTRICT
);

CREATE TABLE POSICAO_JOGADOR (
    JOGADOR VARCHAR2(30) NOT NULL,
    POSICAO VARCHAR2(30) NOT NULL,
    PRIMARY KEY (JOGADOR, POSICAO),
    CONSTRAINT FK_POSICAO_JOGADOR FOREIGN KEY (JOGADOR) REFERENCES JOGADOR (CPF) ON DELETE CASCADE 
);

CREATE TABLE DIRETOR (
    TIME VARCHAR2(30) NOT NULL,
    NOME VARCHAR2(30) NOT NULL,
    PRIMARY KEY (TIME, NOME),
    CONSTRAINT FK_DIRETOR FOREIGN KEY (TIME) REFERENCES TIME (NOME)
    ON DELETE CASCADE
);

CREATE TABLE UNIFORME (
    TIME VARCHAR2(30) NOT NULL,
    TIPO VARCHAR2(30) NOT NULL
                    CHECK (TIPO IN ('TITULAR', 'RESERVA')),
    COR_PRINCIPAL VARCHAR2(30) NOT NULL,
    PRIMARY KEY (TIME, TIPO),
    CONSTRAINT FK_UNIFORME FOREIGN KEY (TIME) REFERENCES TIME (NOME)
    ON DELETE CASCADE
);

```

## Exercicio 2

```SQL
----- Inserção de dados -----

-- Times profissionais
INSERT INTO TIME VALUES ('Corinthians', 'SP', 'PROFISSIONAL', 0);
INSERT INTO TIME VALUES ('Flamengo', 'RJ', 'PROFISSIONAL', 0);

-- Uniformes dos times
INSERT INTO UNIFORME VALUES ('Corinthians', 'TITULAR', 'BRANCO');
INSERT INTO UNIFORME VALUES ('Corinthians', 'RESERVA', 'PRETO');

INSERT INTO UNIFORME VALUES ('Flamengo', 'TITULAR', 'VERMELHO');
INSERT INTO UNIFORME VALUES ('Flamengo', 'RESERVA', 'PRETO');

-- Diretores dos times
INSERT INTO DIRETOR VALUES ('Flamengo', 'Zé');
INSERT INTO DIRETOR VALUES ('Corinthians', 'Cláudio');

-- Jogadores 
INSERT INTO JOGADOR VALUES ('123456789-00', '123456789', 'João', TO_DATE('01/01/1991', 'DD/MM/YYYY'), 'Rio de Janeiro', 'Flamengo');
INSERT INTO JOGADOR VALUES ('123456789-01', '123456789', 'Pedro', TO_DATE('01/01/1987', 'DD/MM/YYYY'), 'São Paulo', 'Corinthians');

-- Posições dos jogadores (Somente goleiro e atacante)
INSERT INTO POSICAO VALUES ('123456789-00', 'Atacante');
INSERT INTO POSICAO VALUES ('123456789-01', 'Atacante');

-- Joga
INSERT INTO JOGA VALUES ('Flamengo', 'Corinthians', TRUE);

-- Partida
INSERT INTO PARTIDA VALUES ('Flamengo', 'Corinthians', TO_DATE('01/01/2019', 'DD/MM/YYYY'), '0x0', 'Maracanã');

```

```SQL
----- Atualização de dados -----

-- Atualização de saldo de gols
UPDATE PARTIDA 
    SET PLACAR = '1x0' 
    WHERE TIME1 = 'Flamengo' AND TIME2 = 'Corinthians';
UPDATE TIME 
    SET SALDO_GOLS = SALDO_GOLS + 1 
    WHERE NOME = 'Flamengo';

UPDATE PARTIDA 
    SET PLACAR = '2x0' 
    WHERE TIME1 = 'Flamengo' AND TIME2 = 'Corinthians';
UPDATE TIME 
    SET SALDO_GOLS = SALDO_GOLS + 1 
    WHERE NOME = 'Flamengo';

```

```SQL
----- Inserção com restrições de integridade -----

-- Não é possível inserir um jogador em um time que não existe
INSERT INTO JOGADOR VALUES ('123456789-02', '123456789', 'João', TO_DATE('01/01/1991', 'DD/MM/YYYY'), 'Rio de Janeiro', 'São Paulo');

-- Não é possível inserir um jogador com o mesmo CPF
INSERT INTO JOGADOR VALUES ('123456789-00', '123456789', 'João', TO_DATE('01/01/1991', 'DD/MM/YYYY'), 'Rio de Janeiro', 'Flamengo');

-- Não é possível inserir um jogador com o mesmo RG e nome
INSERT INTO JOGADOR VALUES ('123456789-03', '123456789', 'João', TO_DATE('01/01/1991', 'DD/MM/YYYY'), 'Rio de Janeiro', 'Flamengo');

```

```SQL
----- Exclusão de dados com e sem restrições de integridade -----

-- Exclusão do time de SP utilizando estado como condição de localização
DELETE FROM TIME 
    WHERE LOCALIZACAO = 'SP';

```

