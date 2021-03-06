CREATE SCHEMA public;

SET SEARCH_PATH TO public;

CREATE TABLE CLIENTE (
	CODIGO_CLI INTEGER NOT NULL,
	NOME_CLI VARCHAR(50) NOT NULL,
	ENDERECO_CLI VARCHAR(60), 
	TELEFONE_CLI VARCHAR(14),
	PRIMARY KEY (CODIGO_CLI)
);

CREATE TABLE DEPARTAMENTO (
	CODIGO_DEP INTEGER NOT NULL,
	NOME_DEP VARCHAR(50) NOT NULL,
	PRIMARY KEY (CODIGO_DEP)
);

CREATE TABLE FUNCIONARIO (
	CODIGO_FUN INTEGER NOT NULL,
	NOME_FUN VARCHAR(50) NOT NULL,
	CPF_FUN VARCHAR(14),
	DATA_NASC_FUN DATE,
	SALARIO_FUN FLOAT,
	SEXO VARCHAR(1) CHECK (SEXO IN ('F','M')),
	COD_DEP INTEGER,
	PRIMARY KEY (CODIGO_FUN),
	FOREIGN KEY (COD_DEP) REFERENCES DEPARTAMENTO (CODIGO_DEP)
);

CREATE TABLE JORNALISTA (
	CODIGO_JOR INTEGER NOT NULL,
	ESPECIALIDADE_JOR VARCHAR(50),
	PRIMARY KEY (CODIGO_JOR),
	FOREIGN KEY (CODIGO_JOR) REFERENCES FUNCIONARIO (CODIGO_FUN)
);

CREATE TABLE ARTISTA (
	CODIGO_ART INTEGER NOT NULL,
	TIPO_ARTISTA VARCHAR(50),
	PRIMARY KEY (CODIGO_ART),
	FOREIGN KEY (CODIGO_ART) REFERENCES FUNCIONARIO (CODIGO_FUN)
);

CREATE TABLE TECNICO (
	CODIGO_TEC INTEGER NOT NULL,
	FORMACAO_TEC VARCHAR(50),
	PRIMARY KEY (CODIGO_TEC),
	FOREIGN KEY (CODIGO_TEC) REFERENCES FUNCIONARIO (CODIGO_FUN)
);

CREATE TABLE BEM (
	CODIGO_BEM INTEGER NOT NULL,
	DESCRICAO_BEM VARCHAR(50),
	TIPO_BEM VARCHAR(20),
	PRIMARY KEY (CODIGO_BEM)
);

CREATE TABLE FILME (
	CODIGO_FILME INTEGER NOT NULL,
	NOME VARCHAR(50),
	GENERO VARCHAR(20) CHECK (GENERO IN ('Aventura', 'Acao', 'Terror', 'Comedia Romantica', 'Suspense', 'Comedia', 'Fantasia', 'Musical', 'Drama', 'Romance')),
	PRIMARY KEY (CODIGO_FILME)
);

CREATE TABLE PROGRAMA (
	CODIGO_PROG INTEGER NOT NULL,
	NOME_prog VARCHAR(50) NOT NULL,
	DIA_PROG VARCHAR(80),
	HORARIO_PROG TIME,
	CLASSIFICACAO_PROG VARCHAR(30),
	COD_DEP INTEGER NOT NULL,
	COD_DIRETOR INTEGER NOT NULL,
	PRIMARY KEY (CODIGO_PROG),
	FOREIGN KEY (COD_DEP) REFERENCES DEPARTAMENTO (CODIGO_DEP),
	FOREIGN KEY (COD_DIRETOR) REFERENCES FUNCIONARIO (CODIGO_FUN)
);

CREATE TABLE JORNAL (
	CODIGO_JORNAL INTEGER NOT NULL,
	TIPO_JORNAL VARCHAR(20) CHECK (TIPO_JORNAL IN ('Noticiario', 'Esportivo')),
	COD_ANCORA INTEGER NOT NULL,
	PRIMARY KEY (CODIGO_JORNAL),
	FOREIGN KEY (CODIGO_JORNAL) REFERENCES PROGRAMA (CODIGO_PROG),
	FOREIGN KEY (COD_ANCORA) REFERENCES JORNALISTA (CODIGO_JOR)
);

CREATE TABLE SERIE (
	CODIGO_SERIE INTEGER NOT NULL,
	NRO_EPISODIOS INTEGER,
	TEMPORADA INTEGER,
	DATA_INICIO_SERIE DATE,
	DATA_FIM_SERIE DATE,
	PRIMARY KEY (CODIGO_SERIE),
	FOREIGN KEY (CODIGO_SERIE) REFERENCES PROGRAMA (CODIGO_PROG)
);

CREATE TABLE NOVELA (
	CODIGO_NOVELA INTEGER NOT NULL,
	DATA_INICIO_NOV DATE,
	DATA_FIM_NOV DATE,
	PRIMARY KEY (CODIGO_NOVELA),
	FOREIGN KEY (CODIGO_NOVELA) REFERENCES PROGRAMA (CODIGO_PROG)
);

CREATE TABLE AUDITORIO (
	CODIGO_AUD INTEGER NOT NULL,
	TIPO VARCHAR(30),
	COD_APRESENTADOR INTEGER NOT NULL,
	PRIMARY KEY (CODIGO_AUD),
	FOREIGN KEY (CODIGO_AUD) REFERENCES PROGRAMA (CODIGO_PROG),
	FOREIGN KEY (COD_APRESENTADOR) REFERENCES ARTISTA (CODIGO_ART)
);

CREATE TABLE DEPENDENTE (
	NOME_DEPENDENTE VARCHAR(50) NOT NULL,
	COD_FUN INTEGER NOT NULL,
	DATA_NASC_DEPENDENTE DATE,
	PRIMARY KEY (NOME_DEPENDENTE, COD_FUN),
	FOREIGN KEY (COD_FUN) REFERENCES FUNCIONARIO (CODIGO_FUN)
);

CREATE TABLE EXIBE_PROPAGANDA (
	COD_CLI INTEGER NOT NULL,
	COD_PROG INTEGER NOT NULL,
	DESCRICAO_PROPAGANDA VARCHAR(60),
	VALOR_PROPAGANDA FLOAT,
	PRIMARY KEY (COD_CLI, COD_PROG),
	FOREIGN KEY (COD_CLI) REFERENCES CLIENTE (CODIGO_CLI),
	FOREIGN KEY (COD_PROG) REFERENCES PROGRAMA (CODIGO_PROG)
);

CREATE TABLE ATUA (
	COD_NOVELA INTEGER NOT NULL,
	COD_ATOR INTEGER NOT NULL,
	PRIMARY KEY (COD_NOVELA, COD_ATOR),
	FOREIGN KEY (COD_NOVELA) REFERENCES NOVELA (CODIGO_NOVELA),
	FOREIGN KEY (COD_ATOR) REFERENCES ARTISTA (CODIGO_ART)
);

CREATE TABLE REPRODUZ (
	COD_PROG INTEGER NOT NULL,
	COD_FILME INTEGER NOT NULL,
	DATA_REPRODUCAO DATE NOT NULL,
	PRIMARY KEY (COD_PROG, COD_FILME, DATA_REPRODUCAO),
	FOREIGN KEY (COD_PROG) REFERENCES PROGRAMA (CODIGO_PROG),
	FOREIGN KEY (COD_FILME) REFERENCES FILME (CODIGO_FILME)
);

CREATE TABLE USA (
	COD_BEM INTEGER NOT NULL,
	COD_DEP INTEGER NOT NULL,
	PRIMARY KEY (COD_BEM, COD_DEP),
	FOREIGN KEY (COD_BEM) REFERENCES BEM (CODIGO_BEM),
	FOREIGN KEY (COD_DEP) REFERENCES DEPARTAMENTO (CODIGO_DEP)
);
