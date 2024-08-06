
/*CRIA��O DAS TABELAS DE DIMENS�O DAS CATEGORIAS ADMINSITRATIVAS DO MERCADO EDU*/

-- ENSINO T�CNICO E B�SICO
IF OBJECT_ID('MEDU_DimCategoriaAdministrativaEnsinoTecnicoBasico', 'U') IS NOT NULL
    DROP TABLE MEDU_DimCategoriaAdministrativaEnsinoTecnicoBasico;

-- Cria��o da tabela
CREATE TABLE MEDU_DimCategoriaAdministrativaEnsinoTecnicoBasico (
    COD_CATEGORIA_ADMINISTRATIVA INT PRIMARY KEY,
    CATEGORIA_ADMINISTRATIVA VARCHAR(50),
    GRUPO VARCHAR(50)
);

-- Inser��o de dados
INSERT INTO MEDU_DimCategoriaAdministrativaEnsinoTecnicoBasico (COD_CATEGORIA_ADMINISTRATIVA, CATEGORIA_ADMINISTRATIVA, GRUPO) VALUES
(1, 'P�blica Federal', 'P�blica'),
(2, 'P�blica Estadual', 'P�blica'),
(3, 'P�blica Municipal', 'P�blica'),
(4, 'Privada com Fins Lucrativos', 'Privada'),
(5, 'Privada sem Fins Lucrativos', 'Privada'),
(0, 'N�o Informado', 'N�o Informado');

-- GRADUA��O
IF OBJECT_ID('MEDU_DimCategoriaAdministrativaGraduacao', 'U') IS NOT NULL
    DROP TABLE MEDU_DimCategoriaAdministrativaGraduacao;

-- Cria��o da tabela
CREATE TABLE MEDU_DimCategoriaAdministrativaGraduacao (
    COD_CATEGORIA_ADMINISTRATIVA INT PRIMARY KEY,
    CATEGORIA_ADMINISTRATIVA VARCHAR(50),
    GRUPO VARCHAR(50)
);

-- Inser��o de dados
INSERT INTO MEDU_DimCategoriaAdministrativaGraduacao (COD_CATEGORIA_ADMINISTRATIVA, CATEGORIA_ADMINISTRATIVA, GRUPO) VALUES
(1,'P�blica Federal','P�blica'),
(2,'P�blica Estadual','P�blica'),
(3,'Municipal','P�blica'),
(4,'Privada com fins lucrativos','Privada'),
(5,'Privada sem fins lucrativos','Privada'),
(6,'Privada confessional','Privada'),
(7,'Especial','P�blica/Privada');

-- P�S GRADUA��O
IF OBJECT_ID('MEDU_DimCategoriaAdministrativaPosGraduacao', 'U') IS NOT NULL
    DROP TABLE MEDU_DimCategoriaAdministrativaPosGraduacao;

-- Cria��o da tabela
CREATE TABLE MEDU_DimCategoriaAdministrativaPosGraduacao (
    COD_CATEGORIA_ADMINISTRATIVA INT PRIMARY KEY,
    CATEGORIA_ADMINISTRATIVA VARCHAR(50)
);

-- Inser��o de dados
INSERT INTO MEDU_DimCategoriaAdministrativaPosGraduacao (COD_CATEGORIA_ADMINISTRATIVA, CATEGORIA_ADMINISTRATIVA) VALUES
(1,'P�blica'),
(2,'Privada');


/*CRIA��O DA TABELA DE DIMENS�O DAS MODALIDADES DO MERCADO EDU*/

-- Drop da tabela se existir
IF OBJECT_ID('MEDU_DimModalidade', 'U') IS NOT NULL
    DROP TABLE MEDU_DimModalidade;

-- Cria��o da tabela
CREATE TABLE MEDU_DimModalidade (
    COD_MODALIDADE INT
    ,MODALIDADE VARCHAR(20)
);

-- Inser��o de dados
INSERT INTO MEDU_DimModalidade (COD_MODALIDADE, MODALIDADE) VALUES
(1,'PRESENCIAL'),
(2,'EAD'),
(3,'H�BRIDO'),
(4,'PCD'),
(9,'N�o Informado');



/*CRIA��O DAS TABELAS DE DIMENS�O DE GRAUS DO MERCADO EDU*/

-- GRADUA��O
IF OBJECT_ID('MEDU_DimGrauGraduacao', 'U') IS NOT NULL
    DROP TABLE MEDU_DimGrauGraduacao;

-- Cria��o da tabela
CREATE TABLE MEDU_DimGrauGraduacao (
    COD_GRAU INT
    ,GRAU VARCHAR(40)
);

-- Inser��o de dados
INSERT INTO MEDU_DimGrauGraduacao (COD_GRAU, GRAU) VALUES
(1,'Bacharelado'),
(2,'Licenciatura'),
(3,'Tecnologo'),
(4,'Bacharelado e Licenciatura'),
(9,'N�o Informado'),
(0,'N�o Informado');

-- P�S GRADUA��O
IF OBJECT_ID('MEDU_DimGrauPosGraduacao', 'U') IS NOT NULL
    DROP TABLE MEDU_DimGrauPosGraduacao;

-- Cria��o da tabela
CREATE TABLE MEDU_DimGrauPosGraduacao (
    COD_GRAU INT
    ,GRAU VARCHAR(40)
);

-- Inser��o de dados
INSERT INTO MEDU_DimGrauPosGraduacao (COD_GRAU, GRAU) VALUES
(1,'Mestrado'),
(2,'Doutorado'),
(3,'Mestrado/Doutorado'),
(4,'Mestrado Profissional'),
(9,'N�o Informado'),
(0,'N�o Informado');


/*CRIA��O DAS TABELAS DE DIMENS�O DE G�NERO DO MERCADO EDU*/

-- T�CNICO
IF OBJECT_ID('MEDU_DimGeneroTecnico', 'U') IS NOT NULL
    DROP TABLE MEDU_DimGeneroTecnico;

-- Cria��o da tabela
CREATE TABLE MEDU_DimGeneroTecnico (
    COD_GENERO INT
    ,GENERO VARCHAR(20)
);

-- Inser��o de dados
INSERT INTO MEDU_DimGeneroTecnico (COD_GENERO, GENERO) VALUES
(0,'Masculino'),
(1,'Feminino'),
(9,'N�o Identificado');


/*CRIA��O DAS TABELAS DE DIMENS�O DE RA�A/COR DO MERCADO EDU*/

-- T�CNICO
IF OBJECT_ID('MEDU_DimRacaCor', 'U') IS NOT NULL
    DROP TABLE MEDU_DimRacaCor;

-- Cria��o da tabela
CREATE TABLE MEDU_DimRacaCor (
    COD_RACA_COR INT
    ,RACA_COR VARCHAR(20)
);

-- Inser��o de dados
INSERT INTO MEDU_DimRacaCor (COD_RACA_COR, RACA_COR) VALUES
(0,'N�o Informado'),
(1,'Branca'),
(2,'Preta'),
(3,'Parda'),
(4,'Amarela'),
(5,'Ind�gena');