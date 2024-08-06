
/*CRIAÇÃO DAS TABELAS DE DIMENSÃO DAS CATEGORIAS ADMINSITRATIVAS DO MERCADO EDU*/

-- ENSINO TÉCNICO E BÁSICO
IF OBJECT_ID('MEDU_DimCategoriaAdministrativaEnsinoTecnicoBasico', 'U') IS NOT NULL
    DROP TABLE MEDU_DimCategoriaAdministrativaEnsinoTecnicoBasico;

-- Criação da tabela
CREATE TABLE MEDU_DimCategoriaAdministrativaEnsinoTecnicoBasico (
    COD_CATEGORIA_ADMINISTRATIVA INT PRIMARY KEY,
    CATEGORIA_ADMINISTRATIVA VARCHAR(50),
    GRUPO VARCHAR(50)
);

-- Inserção de dados
INSERT INTO MEDU_DimCategoriaAdministrativaEnsinoTecnicoBasico (COD_CATEGORIA_ADMINISTRATIVA, CATEGORIA_ADMINISTRATIVA, GRUPO) VALUES
(1, 'Pública Federal', 'Pública'),
(2, 'Pública Estadual', 'Pública'),
(3, 'Pública Municipal', 'Pública'),
(4, 'Privada com Fins Lucrativos', 'Privada'),
(5, 'Privada sem Fins Lucrativos', 'Privada'),
(0, 'Não Informado', 'Não Informado');

-- GRADUAÇÃO
IF OBJECT_ID('MEDU_DimCategoriaAdministrativaGraduacao', 'U') IS NOT NULL
    DROP TABLE MEDU_DimCategoriaAdministrativaGraduacao;

-- Criação da tabela
CREATE TABLE MEDU_DimCategoriaAdministrativaGraduacao (
    COD_CATEGORIA_ADMINISTRATIVA INT PRIMARY KEY,
    CATEGORIA_ADMINISTRATIVA VARCHAR(50),
    GRUPO VARCHAR(50)
);

-- Inserção de dados
INSERT INTO MEDU_DimCategoriaAdministrativaGraduacao (COD_CATEGORIA_ADMINISTRATIVA, CATEGORIA_ADMINISTRATIVA, GRUPO) VALUES
(1,'Pública Federal','Pública'),
(2,'Pública Estadual','Pública'),
(3,'Municipal','Pública'),
(4,'Privada com fins lucrativos','Privada'),
(5,'Privada sem fins lucrativos','Privada'),
(6,'Privada confessional','Privada'),
(7,'Especial','Pública/Privada');

-- PÓS GRADUAÇÃO
IF OBJECT_ID('MEDU_DimCategoriaAdministrativaPosGraduacao', 'U') IS NOT NULL
    DROP TABLE MEDU_DimCategoriaAdministrativaPosGraduacao;

-- Criação da tabela
CREATE TABLE MEDU_DimCategoriaAdministrativaPosGraduacao (
    COD_CATEGORIA_ADMINISTRATIVA INT PRIMARY KEY,
    CATEGORIA_ADMINISTRATIVA VARCHAR(50)
);

-- Inserção de dados
INSERT INTO MEDU_DimCategoriaAdministrativaPosGraduacao (COD_CATEGORIA_ADMINISTRATIVA, CATEGORIA_ADMINISTRATIVA) VALUES
(1,'Pública'),
(2,'Privada');


/*CRIAÇÃO DA TABELA DE DIMENSÃO DAS MODALIDADES DO MERCADO EDU*/

-- Drop da tabela se existir
IF OBJECT_ID('MEDU_DimModalidade', 'U') IS NOT NULL
    DROP TABLE MEDU_DimModalidade;

-- Criação da tabela
CREATE TABLE MEDU_DimModalidade (
    COD_MODALIDADE INT
    ,MODALIDADE VARCHAR(20)
);

-- Inserção de dados
INSERT INTO MEDU_DimModalidade (COD_MODALIDADE, MODALIDADE) VALUES
(1,'PRESENCIAL'),
(2,'EAD'),
(3,'HÍBRIDO'),
(4,'PCD'),
(9,'Não Informado');



/*CRIAÇÃO DAS TABELAS DE DIMENSÃO DE GRAUS DO MERCADO EDU*/

-- GRADUAÇÃO
IF OBJECT_ID('MEDU_DimGrauGraduacao', 'U') IS NOT NULL
    DROP TABLE MEDU_DimGrauGraduacao;

-- Criação da tabela
CREATE TABLE MEDU_DimGrauGraduacao (
    COD_GRAU INT
    ,GRAU VARCHAR(40)
);

-- Inserção de dados
INSERT INTO MEDU_DimGrauGraduacao (COD_GRAU, GRAU) VALUES
(1,'Bacharelado'),
(2,'Licenciatura'),
(3,'Tecnologo'),
(4,'Bacharelado e Licenciatura'),
(9,'Não Informado'),
(0,'Não Informado');

-- PÓS GRADUAÇÃO
IF OBJECT_ID('MEDU_DimGrauPosGraduacao', 'U') IS NOT NULL
    DROP TABLE MEDU_DimGrauPosGraduacao;

-- Criação da tabela
CREATE TABLE MEDU_DimGrauPosGraduacao (
    COD_GRAU INT
    ,GRAU VARCHAR(40)
);

-- Inserção de dados
INSERT INTO MEDU_DimGrauPosGraduacao (COD_GRAU, GRAU) VALUES
(1,'Mestrado'),
(2,'Doutorado'),
(3,'Mestrado/Doutorado'),
(4,'Mestrado Profissional'),
(9,'Não Informado'),
(0,'Não Informado');


/*CRIAÇÃO DAS TABELAS DE DIMENSÃO DE GÊNERO DO MERCADO EDU*/

-- TÉCNICO
IF OBJECT_ID('MEDU_DimGeneroTecnico', 'U') IS NOT NULL
    DROP TABLE MEDU_DimGeneroTecnico;

-- Criação da tabela
CREATE TABLE MEDU_DimGeneroTecnico (
    COD_GENERO INT
    ,GENERO VARCHAR(20)
);

-- Inserção de dados
INSERT INTO MEDU_DimGeneroTecnico (COD_GENERO, GENERO) VALUES
(0,'Masculino'),
(1,'Feminino'),
(9,'Não Identificado');


/*CRIAÇÃO DAS TABELAS DE DIMENSÃO DE RAÇA/COR DO MERCADO EDU*/

-- TÉCNICO
IF OBJECT_ID('MEDU_DimRacaCor', 'U') IS NOT NULL
    DROP TABLE MEDU_DimRacaCor;

-- Criação da tabela
CREATE TABLE MEDU_DimRacaCor (
    COD_RACA_COR INT
    ,RACA_COR VARCHAR(20)
);

-- Inserção de dados
INSERT INTO MEDU_DimRacaCor (COD_RACA_COR, RACA_COR) VALUES
(0,'Não Informado'),
(1,'Branca'),
(2,'Preta'),
(3,'Parda'),
(4,'Amarela'),
(5,'Indígena');