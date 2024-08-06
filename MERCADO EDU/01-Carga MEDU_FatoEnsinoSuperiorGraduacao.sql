-- Criação da tabela 
IF OBJECT_ID('MEDU_FatoEnsinoSuperiorGraduacao', 'U') IS NOT NULL
BEGIN
    DROP TABLE MEDU_FatoEnsinoSuperiorGraduacao
END
GO

CREATE TABLE MEDU_FatoEnsinoSuperiorGraduacao (
    [ANO]								INT,
    [INSTITUICAO_ENSINO]				NVARCHAR(MAX),
    [COD_MUNICIPIO_IBGE]				INT,
    [COD_CATEGORIA_ADMINISTRATIVA]		INT,
    [CURSO]								NVARCHAR(MAX),
    [COD_GRAU]							INT,
    [COD_MODALIDADE]					INT,
    [AREA]								NVARCHAR(MAX),
	[MATRICULAS_TOTAL]					INT,
    [MATRICULAS_MASCULINO]				FLOAT,
    [MATRICULAS_FEMININO]				FLOAT,
	[MATRICULAS_NOTURNO]				FLOAT,
    [MATRICULAS_DIURNO]					FLOAT,
	[MATRICULAS_SEM_ETINIA_DECLARADA]	FLOAT,
    [MATRICULAS_BRANCOS]				FLOAT,
	[MATRICULAS_NEGROS]					FLOAT,
    [MATRICULAS_PARDOS]					FLOAT,
    [MATRICULAS_AMARELOS]				FLOAT,
    [MATRICULAS_INDIGENAS]				FLOAT,
	[TIPO_MATRICULA] 					VARCHAR(20),
	[NIVEL] 							VARCHAR(10) DEFAULT 'GRADUAÇÃO'

);

INSERT INTO MEDU_FatoEnsinoSuperiorGraduacao (
     [ANO]							
	,[INSTITUICAO_ENSINO]			
	,[COD_MUNICIPIO_IBGE]			
	,[COD_CATEGORIA_ADMINISTRATIVA]	
	,[CURSO]							
	,[COD_GRAU]							
	,[COD_MODALIDADE]					
	,[AREA]							
	,[MATRICULAS_TOTAL]				
	,[MATRICULAS_MASCULINO]			
	,[MATRICULAS_FEMININO]			
	,[MATRICULAS_NOTURNO]			
	,[MATRICULAS_DIURNO]				
	,[MATRICULAS_SEM_ETINIA_DECLARADA]
	,[MATRICULAS_BRANCOS]			
	,[MATRICULAS_NEGROS]				
	,[MATRICULAS_PARDOS]				
	,[MATRICULAS_AMARELOS]			
	,[MATRICULAS_INDIGENAS]
	,[TIPO_MATRICULA]
)	
SELECT 
   [year] 																				AS [ANO]							
  ,[ies_name]																			AS [INSTITUICAO_ENSINO]			
  ,[city_id]																			AS [COD_MUNICIPIO_IBGE]			
  ,[ies_administrative_type]															AS [COD_CATEGORIA_ADMINISTRATIVA]	
  ,[course_name]																		AS [CURSO]							
  ,ISNULL([course_degree],9)															AS [COD_GRAU]							
  ,[course_modality]																	AS [COD_MODALIDADE]					
  ,upper([cine_big_area_name])															AS [AREA]							
  ,SUM([fact_student_aggregated_matriculation_total]) 									AS [MATRICULAS_TOTAL]				
  ,SUM(
		CAST(
			CASE 
				WHEN [fact_student_aggregated_matriculation_total] <> 0 
					OR [fact_student_aggregated_matriculation_total] IS NOT NULL 
				THEN [fact_student_aggregated_male_total] 
				ELSE 0 
			END 
		AS FLOAT)) / NULLIF(SUM([fact_student_aggregated_total]), 0)					AS [MATRICULAS_MASCULINO]			
  ,SUM(
		CAST(
			CASE 
				WHEN [fact_student_aggregated_matriculation_total] <> 0 
					OR [fact_student_aggregated_matriculation_total] IS NOT NULL 
				THEN [fact_student_aggregated_female_total] 
				ELSE 0 
			END 
		AS FLOAT) ) / NULLIF(SUM([fact_student_aggregated_total]), 0)					AS [MATRICULAS_FEMININO]			
  ,SUM(
		CAST(
			CASE 
				WHEN [fact_student_aggregated_matriculation_total] <> 0 
					OR [fact_student_aggregated_matriculation_total] IS NOT NULL 
				THEN [fact_student_aggregated_matriculation_night] 
				ELSE 0 
			END 
		AS FLOAT)) / NULLIF(SUM([fact_student_aggregated_matriculation_total]), 0) 		AS [MATRICULAS_NOTURNO]			
  ,SUM(
		CAST(
			CASE 
				WHEN [fact_student_aggregated_matriculation_total] <> 0 
					OR [fact_student_aggregated_matriculation_total] IS NOT NULL 
				THEN [fact_student_aggregated_matriculation_daily] 
				ELSE 0 
			END 
		AS FLOAT)) / NULLIF(SUM([fact_student_aggregated_matriculation_total]), 0)		AS [MATRICULAS_DIURNO]				
  ,SUM(
		CAST(
			CASE 
				WHEN [fact_student_aggregated_matriculation_total] <> 0 
					OR [fact_student_aggregated_matriculation_total] IS NOT NULL 
				THEN [fact_student_aggregated_skin_color_undeclared_total] 
			ELSE 0 
		END AS FLOAT)) / NULLIF(SUM([fact_student_aggregated_matriculation_total]),0)	AS [MATRICULAS_SEM_ETINIA_DECLARADA]
  ,SUM(
		CAST(
			CASE 
				WHEN [fact_student_aggregated_matriculation_total] <> 0 
					OR [fact_student_aggregated_matriculation_total] IS NOT NULL 
				THEN [fact_student_aggregated_skin_color_white_total] 
				ELSE 0 
			END 
		AS FLOAT)) / NULLIF(SUM([fact_student_aggregated_matriculation_total]), 0)		AS [MATRICULAS_BRANCOS]			
  ,SUM(
		CAST(
			CASE 
				WHEN [fact_student_aggregated_matriculation_total] <> 0 
					OR [fact_student_aggregated_matriculation_total] IS NOT NULL 
				THEN [fact_student_aggregated_skin_color_black_total] 
				ELSE 0 
				END 
		AS FLOAT)) / NULLIF(SUM([fact_student_aggregated_matriculation_total]), 0)		AS [MATRICULAS_NEGROS]				
  ,SUM(		
		CAST(
			CASE 
				WHEN [fact_student_aggregated_matriculation_total] <> 0 
					OR [fact_student_aggregated_matriculation_total] IS NOT NULL 
				THEN [fact_student_aggregated_skin_color_brown_total] 
				ELSE 0 
			END 
		AS FLOAT)) / NULLIF(SUM([fact_student_aggregated_matriculation_total]), 0)		AS [MATRICULAS_PARDOS]				
  ,SUM(		
		CAST(
			CASE 
				WHEN [fact_student_aggregated_matriculation_total] <> 0 
					OR [fact_student_aggregated_matriculation_total] IS NOT NULL 
				THEN [fact_student_aggregated_skin_color_yellow_total] 
				ELSE 0 
			END 
		AS FLOAT)) / NULLIF(SUM([fact_student_aggregated_matriculation_total]), 0)		AS [MATRICULAS_AMARELOS]			
  ,SUM(				
		CAST(		
			CASE 
				WHEN [fact_student_aggregated_matriculation_total] <> 0 
					OR [fact_student_aggregated_matriculation_total] IS NOT NULL 
				THEN [fact_student_aggregated_skin_color_indigenous_total] 
				ELSE 0 
			END 
		AS FLOAT)) / NULLIF(SUM([fact_student_aggregated_matriculation_total]), 0)		AS [MATRICULAS_INDIGENAS]
  ,CASE
	WHEN ies_name LIKE '%SESC%' 										THEN 'SESC'
	WHEN ies_name LIKE '%SERVICO SOCIAL DO COMERCIO%' 					THEN 'SESC'
	WHEN ies_name LIKE '%SESQUINHO%' 									THEN 'SESC'
	WHEN ies_name LIKE '%SERVICO NACIONAL DE APRENDIZAGEM COMERCIAL%' 	THEN 'SENAC'			
	WHEN ies_name LIKE '%SENAC%' 										THEN 'SENAC'
    ELSE 'CONCORRENTES'
   END 																					AS [TIPO_MATRICULA] 
FROM 
  [DadosExternos].[dbo].[MEDU_StgEnsinoSuperiorGraduacao] 
GROUP BY
[year], 
[ies_name], 
[city_id], 
[ies_administrative_type], 
[course_name], 
[course_degree], 
[course_modality], 
[cine_big_area_name],
CASE
	WHEN ies_name LIKE '%SESC%' 										THEN 'SESC'
	WHEN ies_name LIKE '%SERVICO SOCIAL DO COMERCIO%' 					THEN 'SESC'
	WHEN ies_name LIKE '%SESQUINHO%' 									THEN 'SESC'
	WHEN ies_name LIKE '%SERVICO NACIONAL DE APRENDIZAGEM COMERCIAL%' 	THEN 'SENAC'			
	WHEN ies_name LIKE '%SENAC%' 										THEN 'SENAC'
    ELSE 'CONCORRENTES'
END 	
