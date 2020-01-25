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
-- LOAD DATA PARA RECEITAS CANDIDATOS 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- ANO2016 - ESTADO RJ

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_candidatos_prestacao_contas_final_2016_RJ.txt'
    IGNORE 
    INTO TABLE partidos
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
    (@dummy,@dummy,@dummy,@dummy,@dummy,UF,@dummy,@dummy,Sigla,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_candidatos_prestacao_contas_final_2016_RJ.txt'
    IGNORE 
    INTO TABLE candidatos
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
    (@dummy,@dummy,@dummy,@dummy,@dummy,UF,@dummy,@dummy,Partido,@dummy,Cargo,Nome,CPF,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_candidatos_prestacao_contas_final_2016_RJ.txt'
    IGNORE 
    INTO TABLE fontes
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
    (@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_candidatos_prestacao_contas_final_2016_RJ.txt'
    IGNORE 
    INTO TABLE doadores
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
    (@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,CPFCNPJ,@dummy,Nome,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_candidatos_prestacao_contas_final_2016_RJ.txt'
    IGNORE 
    INTO TABLE receitas
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
    (@dummy,@dummy,@dummy,@dummy,@dummy,UF,@dummy,@dummy,Partido_Candidato,@dummy,Cargo_Candidato,Nome_Candidato,@dummy,@dummy,@dummy,Numero_documento,CPFCNPJ_Doador,@dummy,Doador,@dummy,@dummy,@dummy,@dummy,@dummy,Data,@valor,Tipo_receita,Fonte,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
	SET Valor = REPLACE(@valor, ",", ".");


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- LOAD DATA PARA RECEITAS CANDIDATOS 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- ANO2016 - ESTADO SP

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_candidatos_prestacao_contas_final_2016_SP.txt'
    IGNORE 
    INTO TABLE partidos
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
    (@dummy,@dummy,@dummy,@dummy,@dummy,UF,@dummy,@dummy,Sigla,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_candidatos_prestacao_contas_final_2016_SP.txt'
    IGNORE 
    INTO TABLE candidatos
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
    (@dummy,@dummy,@dummy,@dummy,@dummy,UF,@dummy,@dummy,Partido,@dummy,Cargo,Nome,CPF,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_candidatos_prestacao_contas_final_2016_SP.txt'
    IGNORE 
    INTO TABLE fontes
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
    (@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_candidatos_prestacao_contas_final_2016_SP.txt'
    IGNORE 
    INTO TABLE doadores
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
    (@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,CPFCNPJ,@dummy,Nome,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receitas_candidatos_prestacao_contas_final_2016_SP.txt'
    IGNORE 
    INTO TABLE receitas
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
    (@dummy,@dummy,@dummy,@dummy,@dummy,UF,@dummy,@dummy,Partido_Candidato,@dummy,Cargo_Candidato,Nome_Candidato,@dummy,@dummy,@dummy,Numero_documento,CPFCNPJ_Doador,@dummy,Doador,@dummy,@dummy,@dummy,@dummy,@dummy,Data,@valor,Tipo_receita,Fonte,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
	SET Valor = REPLACE(@valor, ",", ".");

