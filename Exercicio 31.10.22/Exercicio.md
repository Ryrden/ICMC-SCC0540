# Exercícios de desenvolvimento

Considere o esquema a seguir, e as restrições semânticas conhecidas:

- o tipo do Time só pode assumir os valores "AMADOR" e "PROFISSIONAL";
- o atributo classico de Joga indica se o jogo é um clássico ou não;
- um jogador deve obrigatoriamente atuar em um time;
- o tipo do Uniforme pode ser "TITULAR" ou "RESERVA";
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
    PLACAR VARCHAR2(30) DEFAULT "0x0"
                        CHECK (PLACAR REGEXP_LIKE "^[0-9]+x[0-9]+$"),
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
