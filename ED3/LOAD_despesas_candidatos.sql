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
-- LOAD DATA PARA DESPESAS CANDIDATOS 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
use trabalho00;
-- ANO2012 - ESTADO RJ

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/despesas_candidatos_2012_RJ.txt'
    IGNORE 
    INTO TABLE partidos
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
    (@dummy,@dummy,@dummy,@dummy,UF,@dummy,@dummy,Sigla,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/despesas_candidatos_2012_RJ.txt'
    IGNORE 
    INTO TABLE fornecedores
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
    (@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,CPFCNPJ,@dummy,Nome,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/despesas_candidatos_2012_RJ.txt'
    IGNORE 
    INTO TABLE candidatos
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
    (@dummy,@dummy,@dummy,@dummy,UF,@dummy,@dummy,Partido,@dummy,Cargo,Nome,CPF,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/despesas_candidatos_2012_RJ.txt'
    IGNORE 
    INTO TABLE despesas
    CHARACTER SET latin1
    FIELDS
        TERMINATED BY ';'
        ENCLOSED BY '"'
    LINES
        TERMINATED BY '\n'
    IGNORE 1 LINES 
    (@dummy,@dummy,@dummy,@dummy,UF,@dummy,@dummy,Partido_Candidato,@dummy,Cargo_Candidato,Nome_Candidato,@dummy,Tipo_documento,Numero_documento,CPFCNPJ_Fornecedor,@dummy,Fornecedor,@dummy,@dummy,Data,@valor,Tipo_despesa,@dummy)
	SET Valor = REPLACE(@valor, ",", ".");
