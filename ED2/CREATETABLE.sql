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

-- -----------------------------------------------------
-- CREATE TABLE: Table Partidos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Partidos (
  Sigla VARCHAR(10) NOT NULL,
  UF CHAR(2) NOT NULL,
  UNIQUE INDEX Sigla_UNIQUE (Sigla ASC),
  PRIMARY KEY (Sigla)) -- a sigla foi escolhida como chave primaria pois todos os partidos possuem uma diferente e também não são muitos, assim não havendo necessidade da criação de um ID.
ENGINE = InnoDB; -- Para o funcionamento das foring keys

-- -----------------------------------------------------
-- CREATE TABLE: Table Fontes
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Fontes (
  Nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (Nome), -- foi escolhido pelo mesmo motivo da escolha do nome dos fornecedores como chave primária.
  UNIQUE INDEX Nome_UNIQUE (Nome ASC))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- CREATE TABLE: Table Fornecedores
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Fornecedores (
  Nome VARCHAR(150) NOT NULL,
  idFornecedores INT UNSIGNED NOT NULL AUTO_INCREMENT,
  CPFCNPJ VARCHAR(14) NOT NULL DEFAULT '00000000000',
  PRIMARY KEY (Nome, CPFCNPJ), -- nesse caso, a coluna Nome e CPFCNPJ foram escolhidas como chave primária pois nos outros arquivos a única referência para os fornecedores são o nome e o CPF/CNPJ (que não são únicos nem não-nulos).
  UNIQUE INDEX idFornecedores_UNIQUE (idFornecedores ASC),
  UNIQUE INDEX Nome_UNIQUE (Nome ASC))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- CREATE TABLE: Table Doadores
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Doadores (
  Nome VARCHAR(150) NOT NULL,
  idDoadores INT UNSIGNED NOT NULL AUTO_INCREMENT,
  CPFCNPJ VARCHAR(14) NOT NULL DEFAULT '00000000000',
  UNIQUE INDEX idDoadores_UNIQUE (idDoadores ASC),
  PRIMARY KEY (Nome, CPFCNPJ), -- aqui coluna Nome também foi escolhida como chave primária pois nos outros arquivos a única referência para os fornecedores são o nome e o CPF/CNPJ (que não são únicos).
  UNIQUE INDEX Nome_UNIQUE (Nome ASC))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- CREATE TABLE: Table Candidatos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Candidatos (
  Nome VARCHAR(60) NOT NULL,
  CPF VARCHAR(11) NULL DEFAULT '00000000000', -- os CPF's não sao únicos nessa base de dados.
  UF CHAR(2) NOT NULL,
  Cargo VARCHAR(45) NOT NULL,
  Partido VARCHAR(10) NOT NULL,
  PRIMARY KEY (Nome, Cargo, Partido), -- melhor forma que encontramos de definir um candidato visto que o campo CPF nesse banco não é confiavel.
  INDEX fk_Partido_idx (Partido ASC),
  CONSTRAINT fk_Partido
    FOREIGN KEY (Partido)
    REFERENCES Partidos (Sigla)
    ON DELETE CASCADE -- caso o partido é deletado, não tem porquê manter os deputados na base.
    ON UPDATE CASCADE)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- CREATE TABLE: Table Despesas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Despesas (
  idDespesas INT UNSIGNED NOT NULL AUTO_INCREMENT,
  UF CHAR(2) NOT NULL,
  Tipo_documento CHAR(50) NULL,
  Numero_documento VARCHAR(50) NULL,
  Data CHAR(10) NULL DEFAULT '00/00/0000',
  Valor FLOAT UNSIGNED NULL DEFAULT 0,
  Tipo_despesa VARCHAR(100) NOT NULL,
  Partido VARCHAR(10) NULL,
  Fornecedor VARCHAR(150) NULL,
  CPFCNPJ_Fornecedor VARCHAR(14) NULL,
  Nome_Candidato VARCHAR(60) NULL,
  Cargo_Candidato VARCHAR(45) NULL,
  Partido_Candidato VARCHAR(10) NULL,
  PRIMARY KEY (idDespesas),
  UNIQUE INDEX idDespesas_UNIQUE (idDespesas ASC),
  INDEX fk_PartidoD_idx (Partido ASC),
  INDEX fk_FornecedorD_idx (Fornecedor ASC, CPFCNPJ_Fornecedor ASC),
  INDEX fk_CandidatoD_idx (Nome_Candidato ASC, Cargo_Candidato ASC, Partido_Candidato ASC),
  CONSTRAINT fk_PartidoD
    FOREIGN KEY (Partido)
    REFERENCES Partidos (Sigla)
    ON DELETE CASCADE -- para excluir da base o historico do partido excluido 
    ON UPDATE CASCADE,
  CONSTRAINT fk_FornecedorD
    FOREIGN KEY (Fornecedor)
    REFERENCES Fornecedores (Nome)
    ON DELETE SET NULL 
    ON UPDATE CASCADE,
  CONSTRAINT fk_CandidatoD
    FOREIGN KEY (Nome_Candidato)
    REFERENCES Candidatos (Nome)
    ON DELETE NO ACTION /* como só funcionou direito colocando apenas o Nome na foreign key ( FK simlpes e em vez de composta), 
						para evitar exclusão de despesas de todos os candidatos com nomes iguais (mesmo sendo candidatos diferentes),
                        protegerei a despesa*/
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- CREATE TABLE: Table Receitas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Receitas (
  idReceitas INT UNSIGNED NOT NULL AUTO_INCREMENT,
  UF CHAR(2) NOT NULL,
  Tipo_documento CHAR(50) NULL,
  Numero_documento VARCHAR(50) NULL,
  Data CHAR(10) NOT NULL DEFAULT '00/00/0000',
  Valor FLOAT UNSIGNED NULL DEFAULT 0,
  Tipo_receita VARCHAR(100) NOT NULL,
  Partido VARCHAR(10) NULL,
  Fonte VARCHAR(45) NULL,
  Doador VARCHAR(150) NULL,
  CPFCNPJ_Doador VARCHAR(14) NULL,
  Nome_Candidato VARCHAR(60) NULL,
  Cargo_Candidato VARCHAR(45) NULL,
  Partido_Candidato VARCHAR(10) NULL,
  PRIMARY KEY (idReceitas),
  UNIQUE INDEX idReceitas_UNIQUE (idReceitas ASC),
  INDEX fk_PartidoR_idx (Partido ASC),
  INDEX fk_DoadorR_idx (Doador ASC, CPFCNPJ_Doador ASC),
  INDEX fk_FonteR_idx (Fonte ASC),
  INDEX fk_CandidatoR_idx (Nome_Candidato ASC, Cargo_Candidato ASC, Partido_Candidato ASC),
  CONSTRAINT fk_FonteR
    FOREIGN KEY (Fonte)
    REFERENCES Fontes (Nome)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT fk_PartidoR
    FOREIGN KEY (Partido)
    REFERENCES Partidos (Sigla)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_DoadorR
    FOREIGN KEY (Doador)
    REFERENCES Doadores (Nome)
    ON DELETE SET NULL 
    ON UPDATE CASCADE,
  CONSTRAINT fk_CandidatoR
    FOREIGN KEY (Nome_Candidato)
    REFERENCES Candidatos (Nome)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;
