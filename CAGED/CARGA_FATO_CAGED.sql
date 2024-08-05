
--CRIAÇÃO DA TABELA DE FATO CAGED_DimFonteMovimentacao
IF OBJECT_ID('[CAGED_FatoMovimentacoesTrabalhadores]', 'U') IS NOT NULL
    DROP TABLE [CAGED_FatoMovimentacoesTrabalhadores];

CREATE TABLE [DadosExternos].[dbo].[CAGED_FatoMovimentacoesTrabalhadores] (
    [MOVIMENTACAO] NVARCHAR(50),
    [REGIAO] INT,
    [UF] INT,
    [COD_MUNICIPIO_CAGED] INT,
    [CNAE_SUBCLASSE] NVARCHAR(255),
    [SALDO_MOVIMENTACAO] INT,
    [COD_OCUPACAO] NVARCHAR(255),
    [CATEGORIA_TRABALHADOR] INT,
    [GRAU_INSTRUCAO] INT,
    [IDADE] INT,
    [HORAS_CONTRATUAIS] DECIMAL(8,2),
    [RACA_COR] INT,
    [SEXO_TRABALHADOR] INT,
    [TIPO_EMPREGADOR] INT,
    [TIPO_ESTABELECIMENTO] INT,
    [TIPO_MOVIMENTACAO] INT,
    [TIPO_DEFICIENCIA] INT,
    [IND_TRABALHADOR_INTERMITENTE] NVARCHAR(255),
    [IND_TRABALHADOR_PARCIAL] NVARCHAR(255),
    [VALOR_SALARIO] DECIMAL(8,2),
    [TAM_EMPRESA_JANEIRO] INT,
    [IND_APRENDIZ] NVARCHAR(255),
    [COMPETENCIA_MOVIMENTACAO] NVARCHAR(255),
    [ORIGEM_INFORMACAO] NVARCHAR(255),
    [COMPETENCIA_DECLARACAO] NVARCHAR(255),
    [IND_FORA_PRAZO] NVARCHAR(255),
    [ANO] INT
);

INSERT INTO [DadosExternos].[dbo].[CAGED_FatoMovimentacoesTrabalhadores]

--Carga CAGED 2019

SELECT 
   CASE WHEN [Admitidos Desligados] = '01' THEN 'ADMITIDO' ELSE 'DESLIGADO' END AS 'MOVIMENTACAO'
  ,CAST(LEFT([UF], 1) AS INT) AS 'REGIAO'
  ,CAST([UF] AS INT) AS 'UF'
  ,CAST([Município] AS INT) AS 'COD_MUNICIPIO_CAGED'
  ,[CNAE 2 0 Subclas] AS 'CNAE_SUBCLASSE'
  ,[Saldo Mov] AS 'SALDO_MOVIMENTACAO'
  ,[CBO 2002 Ocupação] AS 'COD_OCUPACAO'
  ,999 AS 'CATEGORIA_TRABALHADOR'
  ,CAST([Grau Instrução] AS INT) AS 'GRAU_INSTRUCAO'
  ,CAST([Idade] AS INT) AS 'IDADE'
  ,CAST(replace([Qtd Hora Contrat],',','.') AS DECIMAL(8,2)) AS 'HORAS_CONTRATUAIS'
  ,CAST([Raça Cor] AS INT) AS 'RACA_COR'
  ,CAST([Sexo] AS INT) AS 'SEXO_TRABALHADOR'
  ,CASE WHEN CAST([Tipo Estab] AS INT) = 1 THEN 0 ELSE 2 END AS 'TIPO_EMPREGADOR'
  ,CASE WHEN CAST([TIPO ESTAB] AS INT) = 3 THEN 30 ELSE CAST([TIPO ESTAB] AS INT) END AS 'TIPO_ESTABELECIMENTO'
  ,CASE WHEN CAST([Tipo Mov Desagregado] AS INT) = 10 THEN 100 ELSE CAST([Tipo Mov Desagregado] AS INT) END AS 'TIPO_MOVIMENTACAO'
  ,CAST([Tipo Defic] AS INT) AS 'TIPO_DEFICIENCIA'
  ,[Ind Trab Intermitente] AS 'IND_TRABALHADOR_INTERMITENTE'
  ,[Ind Trab Parcial] AS 'IND_TRABALHADOR_PARCIAL'
  ,CAST(replace([Salário Mensal],',','.') AS DECIMAL(8,2))  AS 'VALOR_SALARIO'
  ,CAST([Faixa Empr Início Jan] AS INT) AS 'TAM_EMPRESA_JANEIRO'
  ,[Ind Aprendiz] AS 'IND_APRENDIZ'
  ,[Competência Declarada] AS 'COMPETENCIA_MOVIMENTACAO'
  ,NULL AS 'ORIGEM_INFORMACAO'
  ,[Competência Declarada] AS 'COMPETENCIA_DECLARACAO'
  ,NULL AS 'IND_FORA_PRAZO'
  ,[Ano Declarado] AS 'ANO'
FROM [SenacDW_Stg].[dbo].[Caged_2019]


-- Carga CAGED 2020
union all

SELECT 
case when [saldomovimentacao] > 0 then 'ADMITIDO' else 'DESLIGADO' end AS 'MOVIMENTACAO'
,[regiao] AS 'REGIAO'
,[uf] AS 'UF'
,[municipio] AS 'COD_MUNICIPIO_CAGED'
,[subclasse] AS 'CNAE_SUBCLASSE'
,[saldomovimentacao] AS 'SALDO_MOVIMENTACAO'
,[cbo2002ocupacao] AS 'COD_OCUPACAO'
,[categoria] AS 'CATEGORIA_TRABALHADOR'
,[graudeinstrucao] AS 'GRAU_INSTRUCAO'
,[idade] AS 'IDADE'
,CAST(replace([horascontratuais] ,',','.') AS DECIMAL(8,2)) AS 'HORAS_CONTRATUAIS'
,[racacor] AS 'RACA_COR'
,[sexo] AS 'SEXO_TRABALHADOR'
,[tipoempregador] AS 'TIPO_EMPREGADOR'
,[tipoestabelecimento] AS 'TIPO_ESTABELECIMENTO'
,[tipomovimentacao] AS 'TIPO_MOVIMENTACAO'
,[tipodedeficiencia] AS 'TIPO_DEFICIENCIA'
,[indtrabintermitente] AS 'IND_TRABALHADOR_INTERMITENTE'
,[indtrabparcial] AS 'IND_TRABALHADOR_PARCIAL'
,CAST(replace([salario],',','.') AS DECIMAL(8,2))  AS 'VALOR_SALARIO'
,[tamestabjan] AS 'TAM_EMPRESA_JANEIRO'
,[indicadoraprendiz] AS 'IND_APRENDIZ'
,[competencia] AS 'COMPETENCIA_MOVIMENTACAO'
,null AS 'ORIGEM_INFORMACAO'
,[competencia] AS 'COMPETENCIA_DECLARACAO'
,null AS 'IND_FORA_PRAZO'
,2020 AS 'ANO'
FROM [SenacDW_Stg].[dbo].[Caged_2020]

-- Carga CAGED 2021
union all

SELECT 
case when [saldomovimentacao] > 0 then 'ADMITIDO' else 'DESLIGADO' end AS 'MOVIMENTACAO'
,[regiao] AS 'REGIAO'
,[uf] AS 'UF'
,[municipio] AS 'COD_MUNICIPIO_CAGED'
,[subclasse] AS 'CNAE_SUBCLASSE'
,[saldomovimentacao] AS 'SALDO_MOVIMENTACAO'
,[cbo2002ocupacao] AS 'COD_OCUPACAO'
,[categoria] AS 'CATEGORIA_TRABALHADOR'
,[graudeinstrucao] AS 'GRAU_INSTRUCAO'
,[idade] AS 'IDADE'
,CAST(replace([horascontratuais] ,',','.') AS DECIMAL(8,2))  AS 'HORAS_CONTRATUAIS'
,[racacor] AS 'RACA_COR'
,[sexo] AS 'SEXO_TRABALHADOR'
,[tipoempregador] AS 'TIPO_EMPREGADOR'
,[tipoestabelecimento] AS 'TIPO_ESTABELECIMENTO'
,[tipomovimentacao] AS 'TIPO_MOVIMENTACAO'
,[tipodedeficiencia] AS 'TIPO_DEFICIENCIA'
,[indtrabintermitente] AS 'IND_TRABALHADOR_INTERMITENTE'
,[indtrabparcial] AS 'IND_TRABALHADOR_PARCIAL'
,CAST(replace([salario],',','.') AS DECIMAL(8,2))  AS 'VALOR_SALARIO'
,[tamestabjan] AS 'TAM_EMPRESA_JANEIRO'
,[indicadoraprendiz] AS 'IND_APRENDIZ'
,[competenciamov] AS 'COMPETENCIA_MOVIMENTACAO'
,[origemdainformacao] AS 'ORIGEM_INFORMACAO'
,[competenciadec] AS 'COMPETENCIA_DECLARACAO'
,[indicadordeforadoprazo] AS 'IND_FORA_PRAZO'
,2021 AS 'ANO'
FROM [SenacDW_Stg].[dbo].[Caged_2021]

-- Carga CAGED 2022
union all

SELECT 
case when [saldomovimentacao] > 0 then 'ADMITIDO' else 'DESLIGADO' end AS 'MOVIMENTACAO'
,[regiao] AS 'REGIAO'
,[uf] AS 'UF'
,[municipio] AS 'COD_MUNICIPIO_CAGED'
,[subclasse] AS 'CNAE_SUBCLASSE'
,[saldomovimentacao] AS 'SALDO_MOVIMENTACAO'
,[cbo2002ocupacao] AS 'COD_OCUPACAO'
,[categoria] AS 'CATEGORIA_TRABALHADOR'
,[graudeinstrucao] AS 'GRAU_INSTRUCAO'
,[idade] AS 'IDADE'
,CAST(replace([horascontratuais] ,',','.') AS DECIMAL(8,2))  AS 'HORAS_CONTRATUAIS'
,[racacor] AS 'RACA_COR'
,[sexo] AS 'SEXO_TRABALHADOR'
,[tipoempregador] AS 'TIPO_EMPREGADOR'
,[tipoestabelecimento] AS 'TIPO_ESTABELECIMENTO'
,[tipomovimentacao] AS 'TIPO_MOVIMENTACAO'
,[tipodedeficiencia] AS 'TIPO_DEFICIENCIA'
,[indtrabintermitente] AS 'IND_TRABALHADOR_INTERMITENTE'
,[indtrabparcial] AS 'IND_TRABALHADOR_PARCIAL'
,CAST(replace([salario],',','.') AS DECIMAL(8,2)) AS 'VALOR_SALARIO'
,[tamestabjan] AS 'TAM_EMPRESA_JANEIRO'
,[indicadoraprendiz] AS 'IND_APRENDIZ'
,[competenciamov] AS 'COMPETENCIA_MOVIMENTACAO'
,[origemdainformacao] AS 'ORIGEM_INFORMACAO'
,[competenciadec] AS 'COMPETENCIA_DECLARACAO'
,[indicadordeforadoprazo] AS 'IND_FORA_PRAZO'
,2022 AS 'ANO'
FROM [SenacDW_Stg].[dbo].[Caged_2022]

-- Carga CAGED 2023
union all

SELECT 
case when [saldomovimentacao] > 0 then 'ADMITIDO' else 'DESLIGADO' end AS 'MOVIMENTACAO'
,[regiao] AS 'REGIAO'
,[uf] AS 'UF'
,[municipio] AS 'COD_MUNICIPIO_CAGED'
,[subclasse] AS 'CNAE_SUBCLASSE'
,[saldomovimentacao] AS 'SALDO_MOVIMENTACAO'
,[cbo2002ocupacao] AS 'COD_OCUPACAO'
,[categoria] AS 'CATEGORIA_TRABALHADOR'
,[graudeinstrucao] AS 'GRAU_INSTRUCAO'
,[idade] AS 'IDADE'
,CAST(replace([horascontratuais] ,',','.') AS DECIMAL(8,2))  AS 'HORAS_CONTRATUAIS'
,[racacor] AS 'RACA_COR'
,[sexo] AS 'SEXO_TRABALHADOR'
,[tipoempregador] AS 'TIPO_EMPREGADOR'
,[tipoestabelecimento] AS 'TIPO_ESTABELECIMENTO'
,[tipomovimentacao] AS 'TIPO_MOVIMENTACAO'
,[tipodedeficiencia] AS 'TIPO_DEFICIENCIA'
,[indtrabintermitente] AS 'IND_TRABALHADOR_INTERMITENTE'
,[indtrabparcial] AS 'IND_TRABALHADOR_PARCIAL'
,CAST(replace([salario],',','.') AS DECIMAL(8,2)) AS 'VALOR_SALARIO'
,[tamestabjan] AS 'TAM_EMPRESA_JANEIRO'
,[indicadoraprendiz] AS 'IND_APRENDIZ'
,[competenciamov] AS 'COMPETENCIA_MOVIMENTACAO'
,[origemdainformacao] AS 'ORIGEM_INFORMACAO'
,[competenciadec] AS 'COMPETENCIA_DECLARACAO'
,[indicadordeforadoprazo] AS 'IND_FORA_PRAZO'
,2023 AS 'ANO'
FROM [SenacDW_Stg].[dbo].[Caged_2023]