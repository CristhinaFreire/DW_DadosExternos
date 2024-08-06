-- Criar a tabela para armazenar os dados interpolados
CREATE TABLE [DadosExternos].[dbo].[IBGE_FatoPopulacaoEstimada] (
    UF VARCHAR(2),
    COD_MUNICIPIO_IBGE INT,
    MUNICIPIO VARCHAR(255),
    ANO INT,
    QUANTIDADE_POPULACAO INT
);
 
-- Inserir os dados interpolados na nova tabela
WITH PopulacaoComAnoBase AS (
    SELECT 
        UF,
        COD_MUNICIPIO_IBGE,
        MUNICIPIO,
        ANO,
        QUANTIDADE_POPULACAO,
        LEAD(ANO) OVER (PARTITION BY UF, COD_MUNICIPIO_IBGE ORDER BY ANO) AS ANO_SEGUINTE,
        LEAD(QUANTIDADE_POPULACAO) OVER (PARTITION BY UF, COD_MUNICIPIO_IBGE ORDER BY ANO) AS POPULACAO_SEGUINTE
    FROM 
        [DadosExternos].[dbo].[IBGE_FatoPopulacaoMunicipios]
),
Anos AS (
    SELECT DISTINCT ANO
    FROM [DadosExternos].[dbo].[IBGE_FatoPopulacaoMunicipios]
    UNION
    SELECT DISTINCT ANO + 1
    FROM [DadosExternos].[dbo].[IBGE_FatoPopulacaoMunicipios]
),
TodosAnos AS (
    SELECT DISTINCT ANO
    FROM (
        SELECT DISTINCT ANO FROM [DadosExternos].[dbo].[IBGE_FatoPopulacaoMunicipios]
        UNION
        SELECT DISTINCT ANO + n AS ANO
        FROM [DadosExternos].[dbo].[IBGE_FatoPopulacaoMunicipios], (VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12), (13), (14), (15), (16), (17), (18), (19), (20)) AS x(n)
    ) AS AllYears
    WHERE ANO BETWEEN (SELECT MIN(ANO) FROM [DadosExternos].[dbo].[IBGE_FatoPopulacaoMunicipios]) AND (SELECT MAX(ANO) FROM [DadosExternos].[dbo].[IBGE_FatoPopulacaoMunicipios])
),
PopulacaoInterpolada AS (
    SELECT 
        a.UF,
        a.COD_MUNICIPIO_IBGE,
        a.MUNICIPIO,
        y.ANO,
        COALESCE(
            (SELECT TOP 1 b.QUANTIDADE_POPULACAO FROM [DadosExternos].[dbo].[IBGE_FatoPopulacaoMunicipios] b WHERE b.UF = a.UF AND b.COD_MUNICIPIO_IBGE = a.COD_MUNICIPIO_IBGE AND b.ANO = y.ANO),
            CAST(a.QUANTIDADE_POPULACAO * POWER(1.0 * a.POPULACAO_SEGUINTE / a.QUANTIDADE_POPULACAO, 1.0 / (a.ANO_SEGUINTE - a.ANO) * (y.ANO - a.ANO)) AS INT)
        ) AS QUANTIDADE_POPULACAO
    FROM 
        PopulacaoComAnoBase a
    JOIN 
        TodosAnos y ON y.ANO BETWEEN a.ANO AND COALESCE(a.ANO_SEGUINTE, y.ANO)
)
INSERT INTO [DadosExternos].[dbo].[IBGE_FatoPopulacaoEstimada] (UF, COD_MUNICIPIO_IBGE, MUNICIPIO, ANO, QUANTIDADE_POPULACAO)
SELECT 
    UF,
    COD_MUNICIPIO_IBGE,
    MUNICIPIO,
    ANO,
    MAX(QUANTIDADE_POPULACAO) AS QUANTIDADE_POPULACAO
FROM 
    PopulacaoInterpolada
GROUP BY 
    UF, 
    COD_MUNICIPIO_IBGE, 
    MUNICIPIO, 
    ANO
ORDER BY 
    UF, 
    COD_MUNICIPIO_IBGE, 
    ANO;