DROP TABLE [DadosExternos].[dbo].[IBGE_DimCNAE];
CREATE TABLE [DadosExternos].[dbo].[IBGE_DimCNAE]
(
    COD_SECAO VARCHAR(255),
    COD_DIVISAO VARCHAR(255),
    COD_GRUPO VARCHAR(255),
    COD_CLASSE VARCHAR(255),
    COD_SUBCLASSE VARCHAR(255),
    SECAO VARCHAR(255),
    DIVISAO VARCHAR(255),
    GRUPO VARCHAR(255),
    CLASSE VARCHAR(255),
    SUBCLASSE VARCHAR(255),
    GRANDE_AGRUPAMENTO VARCHAR(255)
);
INSERT INTO [DadosExternos].[dbo].[IBGE_DimCNAE]
SELECT [Seção]				AS 'COD_SECAO'
      ,[Divisão]			AS 'COD_DIVISAO'
      ,[Grupo]				AS 'COD_GRUPO'
      ,[Classe]				AS 'COD_CLASSE'
      ,[Subclasse]			AS 'COD_SUBCLASSE'
      ,[Seção1]				AS 'SECAO'
      ,[Divisão1]			AS 'DIVISAO'
      ,[Grupo1]				AS 'GRUPO'
      ,[Classe1]			AS 'CLASSE'
      ,[Subclasse1]			AS 'SUBCLASSE'
      ,[Grande Grupamento]	AS 'GRANDE_AGRUPAMENTO'
  FROM [Caged].[dbo].[dCNAE]

