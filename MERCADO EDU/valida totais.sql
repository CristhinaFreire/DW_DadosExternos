/****** Script do comando SelectTopNRows de SSMS  ******/
SELECT [ANO]
      ,SUM([MATRICULAS]) AS SOMATORIO
  FROM [DadosExternos].[dbo].[MEDU_FatoEnsinoTecnico]
  WHERE MODALIDADE <> 'TOTAL' and MODALIDADE <> 'PCD'
  GROUP BY ANO

SELECT 
	[ANO]
    ,SUM([MATRICULAS]) AS TOTAL_TABELA
FROM [DadosExternos].[dbo].[MEDU_FatoEnsinoTecnico]
WHERE MODALIDADE = 'TOTAL'
GROUP BY ANO