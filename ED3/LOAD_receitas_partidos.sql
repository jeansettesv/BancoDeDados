/**
* UFRJ - Universidade Federal do Rio de Janeiro
* IM - Instituto de Matemática
*
* TMAA - Programação C/C++ & Banco de Dados
* Professor: Milton Ramirez (milton@labma.ufrj.br)
*
* Nome1: Jean Sette Siqueira Vianna 
* DRE:116027396
* 
* Nome2: Antonio Frederico Nesti Lopes 
* DRE:112079163
*
* Nome3: Gabriel Felipe de Oliveira Antão
* DRE:114046394
*
* Rio de Janeiro, 21 de julho de 2018
**/

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- LOAD DATA PARA RECEITAS PARTIDOS 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- ANO2012 - ESTADO RJ

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_partidos_2012_RJ.txt'
    IGNORE 
    INTO TABLE partidos
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
    (@dummy,@dummy,@dummy,@dummy,`UF`,@dummy,@dummy,@dummy,`Sigla`,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_partidos_2012_RJ.txt'
    IGNORE 
    INTO TABLE fontes
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
    (@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,`Nome`,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_partidos_2012_RJ.txt'
    IGNORE 
    INTO TABLE doadores
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
    (@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,`CPFCNPJ`,@dummy,`Nome`,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_partidos_2012_RJ.txt'
    IGNORE 
    INTO TABLE receitas
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
    (@dummy,@dummy,@dummy,@dummy,UF,@dummy,@dummy,@dummy,Partido,@dummy,Numero_documento,CPFCNPJ_Doador,@dummy,Doador,@dummy,@dummy,@dummy,@dummy,@dummy,Data,@valor,Tipo_receita,Fonte,@dummy,@dummy)
	SET Valor = REPLACE(@valor, ",", ".");


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- ANO2012 - ESTADO SP

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_partidos_2012_SP.txt'
    IGNORE 
    INTO TABLE partidos
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
    (@dummy,@dummy,@dummy,@dummy,`UF`,@dummy,@dummy,@dummy,`Sigla`,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_partidos_2012_SP.txt'
    IGNORE 
    INTO TABLE fontes
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
    (@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,`Nome`,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_partidos_2012_SP.txt'
    IGNORE 
    INTO TABLE doadores
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
    (@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,`CPFCNPJ`,@dummy,`Nome`,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_partidos_2012_SP.txt'
    IGNORE 
    INTO TABLE receitas
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
    (@dummy,@dummy,@dummy,@dummy,UF,@dummy,@dummy,@dummy,Partido,@dummy,Numero_documento,CPFCNPJ_Doador,@dummy,Doador,@dummy,@dummy,@dummy,@dummy,@dummy,Data,@valor,Tipo_receita,Fonte,@dummy,@dummy)
	SET Valor = REPLACE(@valor, ",", ".");


- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- ANO2014 - ESTADO RJ

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_partidos_2014_RJ.txt'
    IGNORE 
    INTO TABLE partidos
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
	(@dummy,@dummy,@dummy,@dummy,@dummy,UF,@dummy,Sigla,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_partidos_2014_RJ.txt'
    IGNORE 
    INTO TABLE fontes
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
	(@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,Nome,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_partidos_2014_RJ.txt'
    IGNORE 
    INTO TABLE doadores
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
	(@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,CPFCNPJ,@dummy,Nome,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_partidos_2014_RJ.txt'
    IGNORE 
    INTO TABLE receitas
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
	IGNORE 1 LINES 
	(@dummy,@dummy,@dummy,@dummy,@dummy,UF,@dummy,Partido,Tipo_documento,Numero_documento,CPFCNPJ_Doador,@dummy,Doador,@dummy,@dummy,@dummy,@dummy,@dummy,Data,@valor,Tipo_receita,Fonte,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
	SET Valor = REPLACE(@valor, ",", ".");


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- ANO2014 - ESTADO SP

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_partidos_2014_SP.txt'
    IGNORE 
    INTO TABLE partidos
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
	(@dummy,@dummy,@dummy,@dummy,@dummy,UF,@dummy,Sigla,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_partidos_2014_SP.txt'
    IGNORE 
    INTO TABLE fontes
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
	(@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,Nome,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_partidos_2014_SP.txt'
    IGNORE 
    INTO TABLE doadores
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
	(@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,CPFCNPJ,@dummy,Nome,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_partidos_2014_SP.txt'
    IGNORE 
    INTO TABLE receitas
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
	(@dummy,@dummy,@dummy,@dummy,@dummy,UF,@dummy,Partido,Tipo_documento,Numero_documento,CPFCNPJ_Doador,@dummy,Doador,@dummy,@dummy,@dummy,@dummy,@dummy,Data,@valor,Tipo_receita,Fonte,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
	SET Valor = REPLACE(@valor, ",", ".");


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- ANO2016 - ESTADO RJ

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_partidos_prestacao_contas_final_2016_RJ.txt'
    IGNORE 
    INTO TABLE partidos
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
	(@dummy,@dummy,@dummy,@dummy,@dummy,UF,@dummy,@dummy,@dummy,Sigla,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_partidos_prestacao_contas_final_2016_RJ.txt'
    IGNORE 
    INTO TABLE fontes
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
	(@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,Nome,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_partidos_prestacao_contas_final_2016_RJ.txt'
    IGNORE 
    INTO TABLE doadores
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
	(@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,CPFCNPJ,@dummy,Nome,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_partidos_prestacao_contas_final_2016_RJ.txt'
    IGNORE 
    INTO TABLE receitas
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
	(@dummy,@dummy,@dummy,@dummy,@dummy,UF,@dummy,@dummy,@dummy,Partido,@dummy,Numero_documento,CPFCNPJ_Doador,@dummy,Doador,@dummy,@dummy,@dummy,@dummy,@dummy,Data,@valor,Tipo_receita,Fonte,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
	SET Valor = REPLACE(@valor, ",", ".");


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- ANO2016 - ESTADO SP

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_partidos_prestacao_contas_final_2016_SP.txt'
    IGNORE 
    INTO TABLE partidos
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
	(@dummy,@dummy,@dummy,@dummy,@dummy,UF,@dummy,@dummy,@dummy,Sigla,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_partidos_prestacao_contas_final_2016_SP.txt'
    IGNORE 
    INTO TABLE fontes
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
	(@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,Nome,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_partidos_prestacao_contas_final_2016_SP.txt'
    IGNORE 
    INTO TABLE doadores
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
	(@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,CPFCNPJ,@dummy,Nome,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_partidos_prestacao_contas_final_2016_SP.txt'
    IGNORE 
    INTO TABLE receitas
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
	(@dummy,@dummy,@dummy,@dummy,@dummy,UF,@dummy,@dummy,@dummy,Partido,@dummy,Numero_documento,CPFCNPJ_Doador,@dummy,Doador,@dummy,@dummy,@dummy,@dummy,@dummy,Data,@valor,Tipo_receita,Fonte,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
	SET Valor = REPLACE(@valor, ",", ".");

