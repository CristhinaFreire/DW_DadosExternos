-- Criação da tabela 
IF OBJECT_ID('MEDU_FatoEnsinoSuperiorPos', 'U') IS NOT NULL
BEGIN
    DROP TABLE MEDU_FatoEnsinoSuperiorPos
END
GO

CREATE TABLE MEDU_FatoEnsinoSuperiorPos (
ANO								INT,
INSTITUICAO_ENSINO				NVARCHAR(MAX),
COD_MUNICIPIO_IBGE				INT,
COD_CATEGORIA_ADMINISTRATIVA	INT,
CURSO							NVARCHAR(MAX),
AREA							NVARCHAR(MAX),
COD_GRAU						INT,
MATRICULAS						INT,
TIPO_MATRICULA					VARCHAR(20),
NIVEL 							VARCHAR(20) DEFAULT 'PÓS GRADUAÇÃO'
);

INSERT INTO MEDU_FatoEnsinoSuperiorPos (
 ANO							
,INSTITUICAO_ENSINO			
,COD_MUNICIPIO_IBGE			
,COD_CATEGORIA_ADMINISTRATIVA
,CURSO						
,AREA						
,COD_GRAU						
,MATRICULAS					
,TIPO_MATRICULA				
) 						
SELECT [year]													AS 'ANO'
	  ,[pos_teaching_entity_name]								AS 'INSTITUICAO_ENSINO'
      ,[city_id]												AS 'COD_MUNICIPIO_IBGE'
      ,[pos_teaching_entity_administrative_category]			AS 'COD_CATEGORIA_ADMINISTRATIVA'
      ,[pos_knowledge_area_name]								AS 'CURSO'
	  ,[pos_big_knowledge_area_name]							AS 'AREA'
      ,[pos_program_degree]										AS 'COD_GRAU'
      ,SUM([fact_pos_student_aggregated_matriculation_total])	AS 'MATRICULAS'
	  ,CASE
		WHEN [pos_teaching_entity_name] LIKE '%SESC%' 										THEN 'SESC'
		WHEN [pos_teaching_entity_name] LIKE '%SERVICO SOCIAL DO COMERCIO%' 				THEN 'SESC'
		WHEN [pos_teaching_entity_name] LIKE '%SESQUINHO%' 									THEN 'SESC'
		WHEN [pos_teaching_entity_name] LIKE '%SERVICO NACIONAL DE APRENDIZAGEM COMERCIAL%' THEN 'SENAC'			
		WHEN [pos_teaching_entity_name] LIKE '%SENAC%' 										THEN 'SENAC'
		ELSE 'CONCORRENTES'
	  END														AS 'TIPO_MATRICULA' 
  FROM [DadosExternos].[dbo].[MEDU_StgEnsinoSuperiorPos]
  GROUP BY 
   [year]										
  ,[city_id]									
  ,[pos_teaching_entity_name]					
  ,[pos_teaching_entity_administrative_category]
  ,[pos_knowledge_area_name]
  ,pos_big_knowledge_area_name  
  ,[pos_program_degree]							
	  ,CASE
		WHEN [pos_teaching_entity_name] LIKE '%SESC%' 										THEN 'SESC'
		WHEN [pos_teaching_entity_name] LIKE '%SERVICO SOCIAL DO COMERCIO%' 				THEN 'SESC'
		WHEN [pos_teaching_entity_name] LIKE '%SESQUINHO%' 									THEN 'SESC'
		WHEN [pos_teaching_entity_name] LIKE '%SERVICO NACIONAL DE APRENDIZAGEM COMERCIAL%' THEN 'SENAC'			
		WHEN [pos_teaching_entity_name] LIKE '%SENAC%' 										THEN 'SENAC'
		ELSE 'CONCORRENTES'
	  END	