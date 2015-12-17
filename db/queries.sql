/*CONSULTAS*/

--1) Qual o nome dos funcionários que tem filhos.
	
SELECT F.NOME_FUN
FROM FUNCIONARIO F, DEPENDENTE D
WHERE F.CODIGO_FUN = D.COD_FUN
GROUP BY F.NOME_FUN
ORDER BY F.NOME_FUN ASC;

/*
"BETH DA SILVA"
"FATIMA BERNARDES"
"FLAVIO CESAR TORRES"
"JONAS ALBUQUERQUE"
"JORGE BRITO"
*/

--2) Quais os 3 clientes que mais pagaram para as suas propagandas serem exibidas.

SELECT C.NOME_CLI, E.VALOR_PROPAGANDA
FROM CLIENTE C, EXIBE_PROPAGANDA E
WHERE C.CODIGO_CLI = E.COD_CLI
ORDER BY E.VALOR_PROPAGANDA DESC
LIMIT 3;

/*
"Netflix";85111.34
"Nestle";64345.23
"Nintendo";45323.23
*/

--3) Qual a média dos salários dos funcionários que trabalham em programas do tipo jornal.

SELECT AVG(F.SALARIO_FUN)
FROM FUNCIONARIO F, JORNALISTA J
WHERE F.CODIGO_FUN = J.CODIGO_JOR;

/*
2621.36363636364
*/

--4) Quantos funcionários trabalham no departamento de entreterimento.

SELECT COUNT(F.CODIGO_FUN)
FROM FUNCIONARIO F, DEPARTAMENTO D
WHERE (D.NOME_DEP = 'ENTRETERIMENTO') AND
      (F.COD_DEP = D.CODIGO_DEP);

/*
6
*/

--5)Qual o nome das atrores homens comediantes e nome da novela em que eles estão atuando.
SELECT f.nome_fun,p.nome_prog
FROM FUNCIONARIO f, NOVELA n, ATUA a, ARTISTA art,PROGRAMA p
WHERE f.SEXO='M' AND
			f.CODIGO_FUN = art.CODIGO_ART AND
			art.TIPO_ARTISTA = 'Comedia' AND
			f.CODIGO_FUN = a.COD_ATOR AND
			a.COD_NOVELA = n.CODIGO_NOVELA AND
			n.CODIGO_NOVELA = p.CODIGO_PROG;

/*
"JONAS SILVA";"A Regra do Jogo"
"Anderson Rodrigues dos Santos";"Malhacao"
*/

--6) Quais os programas e quantos são os clientes que tem contratos de propagandas com valor maior que R$3000. 

SELECT p.nome_prog,COUNT(c.CODIGO_CLI)
FROM PROGRAMA p, CLIENTE c, EXIBE_PROPAGANDA e
WHERE c.CODIGO_CLI = e.COD_CLI AND
			e.COD_PROG = p.CODIGO_PROG AND
			e.VALOR_PROPAGANDA > 30000
GROUP BY p.nome_prog;

/*
"Encontro com Fatima Bernardes";1
"Under the Dome";1
"Tela Quente";2
"Malhacao";2
*/

--7)Nome, salário e departamento em que trabalham os funcionários que não são jornalistas, técnicos e atores

SELECT  f.NOME_FUN, f.SALARIO_FUN, d.NOME_DEP
FROM FUNCIONARIO f, DEPARTAMENTO d
WHERE f.COD_DEP = d.CODIGO_DEP
      AND f.CODIGO_FUN NOT IN (SELECT CODIGO_ART FROM ARTISTA)
      AND f.CODIGO_FUN NOT IN (SELECT CODIGO_TEC FROM TECNICO)
      AND f.CODIGO_FUN NOT IN (SELECT CODIGO_JOR FROM JORNALISTA);

/*
"JOSY OLIVEIRA";3250;"REDAcAO"
"FELIPE NASCIMENTO";4600;"ADMISTRATIVO"
"ANTONIO MORAIS";9500;"ADMISTRATIVO"
"MAURICIO FELIX";2785;"FINANCEIRO"
"LIVIO FIGUEIRAS";2785;"FINANCEIRO"
*/

--8) Quais os filmes de ação que foram exibidos entre 15/08/1978 e 15/08/2015.

SELECT F.NOME
FROM FILME F, REPRODUZ R 
WHERE (F.CODIGO_FILME = R.COD_FILME) AND
			(UPPER(F.GENERO) = 'ACAO') AND
			(DATA_REPRODUCAO BETWEEN  '15/08/1978' AND '15/08/2015')
GROUP BY F.Nome;

/*
"007 Cassino Royale"
"Velozes e Furiosos"
"Kill Bill"
*/