-- Criação da tabela 
IF OBJECT_ID('MEDU_FatoEnsinoTecnico', 'U') IS NOT NULL
BEGIN
    DROP TABLE MEDU_FatoEnsinoTecnico
END
GO

CREATE TABLE MEDU_FatoEnsinoTecnico (
     ANO INT
    ,CURSO NVARCHAR(255)
    ,INSTITUICAO_ENSINO NVARCHAR(255)
    ,COD_MUNICIPIO_IBGE INT
    ,COD_CATEGORIA_ADMINISTRATIVA INT
    ,AREA NVARCHAR(255)
    ,COD_GENERO INT
    ,COD_RACA_COR INT
    ,MODALIDADE NVARCHAR(50) -- Esta coluna agora será usada para os diferentes sufixos de matrículas
	,COD_MODALIDADE INT
    ,NIVEL VARCHAR(10) DEFAULT 'TÉCNICO'
	,MATRICULAS INT
	,TIPO_MATRICULA VARCHAR(20) 
);

-- ETL para criação da tabela fato
WITH PivotMatriculas AS (
-- ######SEMPRE QUE ATUALIZAR A BASE, É POSSIVEL VALIDAR OS TOTAIS ATIVANDO ESTE SELECT ABAIXO, E O A ÚLTIMA PARTE DESTE SCRIPT#####  
/* 	SELECT
         year AS ANO
        ,be_technical_course_name 										AS 'CURSO'
        ,be_school_name 												AS 'INSTITUICAO_ENSINO'
        ,city_id 														AS 'COD_MUNICIPIO_IBGE'
        ,be_school_administrative_category 								AS 'COD_CATEGORIA_ADMINISTRATIVA'
        ,be_axis_name 													AS 'AREA'
        ,ISNULL(be_fact_student_aggregated_gender,9)  					AS 'COD_GENERO'
        ,ISNULL(be_fact_student_aggregated_skin_color,0) 				AS 'COD_RACA_COR'
        ,'TOTAL' 														AS 'MODALIDADE' -- Total para controle
		,0 														        AS 'COD_MODALIDADE'
        ,be_fact_student_aggregated_total 								AS 'MATRICULAS'
		,CASE
			WHEN be_school_name LIKE '%SESC%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO SOCIAL DO COMERCIO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SESQUINHO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO NACIONAL DE APRENDIZAGEM COMERCIAL%' THEN 'SENAC'			
			WHEN be_school_name LIKE '%SENAC%' THEN 'SENAC'
			ELSE 'CONCORRENTES'
		END 												AS 'TIPO_MATRICULA'
    FROM MEDU_StgEnsinoTecnico
    UNION ALL */
    SELECT
         year 															AS 'ANO'
        ,be_technical_course_name 										AS 'CURSO'
        ,be_school_name 												AS 'INSTITUICAO_ENSINO'
        ,city_id 														AS 'COD_MUNICIPIO_IBGE'
        ,be_school_administrative_category 								AS 'COD_CATEGORIA_ADMINISTRATIVA'
        ,be_axis_name													AS 'AREA'
        ,ISNULL(be_fact_student_aggregated_gender,9)  					AS 'COD_GENERO'
        ,ISNULL(be_fact_student_aggregated_skin_color,0) 				AS 'COD_RACA_COR'
	    ,'PRESENCIAL' 													AS 'MODALIDADE' --Sumariza o presencial
		,1 														        AS 'COD_MODALIDADE'
        ,CASE 
			WHEN year <= 2014 THEN be_fact_student_aggregated_total 
			ELSE be_fact_student_aggregated_total_pres 
		 END 															AS 'MATRICULAS'
		,CASE
			WHEN be_school_name LIKE '%SESC%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO SOCIAL DO COMERCIO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SESQUINHO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO NACIONAL DE APRENDIZAGEM COMERCIAL%' THEN 'SENAC'			
			WHEN be_school_name LIKE '%SENAC%' THEN 'SENAC'
			ELSE 'CONCORRENTES'
		END 												AS 'TIPO_MATRICULA'
    FROM MEDU_StgEnsinoTecnico
    UNION ALL
    SELECT
         year 															AS 'ANO'
        ,be_technical_course_name 										AS 'CURSO'
        ,be_school_name 												AS 'INSTITUICAO_ENSINO'
        ,city_id 														AS 'COD_MUNICIPIO_IBGE'
        ,be_school_administrative_category 								AS 'COD_CATEGORIA_ADMINISTRATIVA'
        ,be_axis_name 													AS 'AREA'
        ,ISNULL(be_fact_student_aggregated_gender,9)  					AS 'COD_GENERO'
        ,ISNULL(be_fact_student_aggregated_skin_color,0) 				AS 'COD_RACA_COR'
        ,'HÍBRIDO' 														AS 'MODALIDADE' -- Sumariza o HIBRIDO
		,3 														        AS 'COD_MODALIDADE'
        ,be_fact_student_aggregated_total_semi 							AS 'MATRICULAS'
		,CASE
			WHEN be_school_name LIKE '%SESC%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO SOCIAL DO COMERCIO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SESQUINHO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO NACIONAL DE APRENDIZAGEM COMERCIAL%' THEN 'SENAC'			
			WHEN be_school_name LIKE '%SENAC%' THEN 'SENAC'
			ELSE 'CONCORRENTES'
		END 												AS 'TIPO_MATRICULA'
    FROM MEDU_StgEnsinoTecnico
    UNION ALL
    SELECT
         year 															AS 'ANO'
        ,be_technical_course_name 										AS 'CURSO'
        ,be_school_name 												AS 'INSTITUICAO_ENSINO'
        ,city_id 														AS 'COD_MUNICIPIO_IBGE'
        ,be_school_administrative_category 								AS 'COD_CATEGORIA_ADMINISTRATIVA'
        ,be_axis_name 													AS 'AREA'
        ,ISNULL(be_fact_student_aggregated_gender,9)  					AS 'COD_GENERO'
        ,ISNULL(be_fact_student_aggregated_skin_color,0) 				AS 'COD_RACA_COR'
        ,'EAD' 															AS 'MODALIDADE' -- Sumariza o EAD
		,2 														        AS 'COD_MODALIDADE'
        ,be_fact_student_aggregated_total_ead  							AS 'MATRICULAS'
		,CASE
			WHEN be_school_name LIKE '%SESC%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO SOCIAL DO COMERCIO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SESQUINHO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO NACIONAL DE APRENDIZAGEM COMERCIAL%' THEN 'SENAC'			
			WHEN be_school_name LIKE '%SENAC%' THEN 'SENAC'
			ELSE 'CONCORRENTES'
		END 												AS 'TIPO_MATRICULA'
    FROM MEDU_StgEnsinoTecnico
    UNION ALL
    SELECT
         year 															AS 'ANO'
        ,be_technical_course_name 										AS 'CURSO'
        ,be_school_name 												AS 'INSTITUICAO_ENSINO'
        ,city_id 														AS 'COD_MUNICIPIO_IBGE'
        ,be_school_administrative_category 								AS 'COD_CATEGORIA_ADMINISTRATIVA'
        ,be_axis_name 													AS 'AREA'
        ,ISNULL(be_fact_student_aggregated_gender,9)  					AS 'COD_GENERO'
        ,ISNULL(be_fact_student_aggregated_skin_color,0) 				AS 'COD_RACA_COR'
        ,'PCD' 															AS 'MODALIDADE' -- PCD não soma ao total, é só uma descrição quantitativa do que está calculado no total
		,4 														        AS 'COD_MODALIDADE'
		,be_fact_student_aggregated_deficiency_total  					AS 'MATRICULAS'
		,CASE
			WHEN be_school_name LIKE '%SESC%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO SOCIAL DO COMERCIO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SESQUINHO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO NACIONAL DE APRENDIZAGEM COMERCIAL%' THEN 'SENAC'			
			WHEN be_school_name LIKE '%SENAC%' THEN 'SENAC'
			ELSE 'CONCORRENTES'
		END 												AS 'TIPO_MATRICULA'
    FROM MEDU_StgEnsinoTecnico
)

-- INSERT NA TABELA FATO FINAL
INSERT INTO MEDU_FatoEnsinoTecnico (
ANO
,CURSO
,INSTITUICAO_ENSINO
,COD_MUNICIPIO_IBGE
,COD_CATEGORIA_ADMINISTRATIVA
,AREA
,COD_GENERO
,COD_RACA_COR
,MODALIDADE
,COD_MODALIDADE
,MATRICULAS
,TIPO_MATRICULA )
SELECT
    ANO
    ,CURSO
    ,INSTITUICAO_ENSINO
    ,COD_MUNICIPIO_IBGE
    ,COD_CATEGORIA_ADMINISTRATIVA
    ,AREA
    ,COD_GENERO
    ,COD_RACA_COR
    ,MODALIDADE
	,COD_MODALIDADE
    ,MATRICULAS
	,TIPO_MATRICULA
FROM PivotMatriculas;

--#### SCRIPT DE VALIDAÇÃO DOS TOTAIS, PARA UTILIZAR, PRECISA DESCOMENTAR O PRIMEIRO SELECT DOS UNIONS LÁ NO INICIO DO SCRIPT########
/* SELECT 
    A.ANO,
    A.SOMATORIO,
    B.TOTAL_TABELA,
    A.SOMATORIO - B.TOTAL_TABELA AS DIFERENCA_MATRICULAS
FROM
    (SELECT 
        ANO,
        SUM(MATRICULAS) AS SOMATORIO
    FROM 
        [DadosExternos].[dbo].[MEDU_FatoEnsinoTecnico]
    WHERE 
        MODALIDADE <> 'TOTAL' AND MODALIDADE <> 'PCD'
    GROUP BY 
        ANO) AS A
JOIN
    (SELECT 
        ANO,
        SUM(MATRICULAS) AS TOTAL_TABELA
    FROM 
        [DadosExternos].[dbo].[MEDU_FatoEnsinoTecnico]
    WHERE 
        MODALIDADE = 'TOTAL'
    GROUP BY 
        ANO) AS B
ON 
    A.ANO = B.ANO */
