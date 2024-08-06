-- Cria��o da tabela 
IF OBJECT_ID('MEDU_FatoEnsinoBasico', 'U') IS NOT NULL
BEGIN
    DROP TABLE MEDU_FatoEnsinoBasico
END
GO

CREATE TABLE MEDU_FatoEnsinoBasico (
    ANO INT
	,INSTITUICAO_ENSINO NVARCHAR(255)
	,COD_MUNICIPIO_IBGE INT
	,COD_CATEGORIA_ADMINISTRATIVA INT
	,NIVEL VARCHAR(50)
    ,MATRICULAS INT
	,TIPO_MATRICULA VARCHAR(20)
);

--ETL para cria��o da tabela fato

WITH PivotNivel AS (
	-- Pivotando o n�vel 'FUNDAMENTAL ANOS INICIAIS'
    SELECT
        year												AS 'ANO'
        ,be_school_name										AS 'INSTITUICAO_ENSINO'
        ,city_id											AS 'COD_MUNICIPIO_IBGE'
        ,be_school_administrative_category					AS 'COD_CATEGORIA_ADMINISTRATIVA'
        ,'Fundamental Anos Iniciais'						AS 'NIVEL'
        ,be_fact2_student_aggregated_qt_mat_fund_ai 		AS 'MATRICULAS'
		,CASE
			WHEN be_school_name LIKE '%SESC%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO SOCIAL DO COMERCIO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SESQUINHO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO NACIONAL DE APRENDIZAGEM COMERCIAL%' THEN 'SENAC'			
			WHEN be_school_name LIKE '%SENAC%' THEN 'SENAC'
			ELSE 'CONCORRENTES'
		END 												AS 'TIPO_MATRICULA'
    FROM [DadosExternos].[dbo].[MEDU_StgEnsinoBasico]		
    UNION ALL	
		
	-- Pivotando o n�vel 'FUNDAMENTAL ANOS FINAIS'	
    SELECT	
        year												AS 'ANO'
        ,be_school_name										AS 'INSTITUICAO_ENSINO'
        ,city_id											AS 'COD_MUNICIPIO_IBGE'
        ,be_school_administrative_category					AS 'COD_CATEGORIA_ADMINISTRATIVA'
        ,'Fundamental Anos Finais'							AS 'NIVEL'
        ,be_fact2_student_aggregated_qt_mat_fund_af 		AS 'MATRICULAS'
		,CASE
			WHEN be_school_name LIKE '%SESC%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO SOCIAL DO COMERCIO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SESQUINHO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO NACIONAL DE APRENDIZAGEM COMERCIAL%' THEN 'SENAC'			
			WHEN be_school_name LIKE '%SENAC%' THEN 'SENAC'
			ELSE 'CONCORRENTES'
		END 												AS 'TIPO_MATRICULA'
    FROM [DadosExternos].[dbo].[MEDU_StgEnsinoBasico]		
    UNION ALL	
		
	-- Pivotando o n�vel 'EJA FUNDAMENTAL'	
    SELECT	
        year												AS 'ANO'
        ,be_school_name										AS 'INSTITUICAO_ENSINO'
        ,city_id											AS 'COD_MUNICIPIO_IBGE'
        ,be_school_administrative_category					AS 'COD_CATEGORIA_ADMINISTRATIVA'
        ,'EJA Fundamental'									AS 'NIVEL'
        ,be_fact2_student_aggregated_qt_mat_eja_fund 		AS 'MATRICULAS'
		,CASE
			WHEN be_school_name LIKE '%SESC%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO SOCIAL DO COMERCIO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SESQUINHO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO NACIONAL DE APRENDIZAGEM COMERCIAL%' THEN 'SENAC'			
			WHEN be_school_name LIKE '%SENAC%' THEN 'SENAC'
			ELSE 'CONCORRENTES'
		END 												AS 'TIPO_MATRICULA'
    FROM [DadosExternos].[dbo].[MEDU_StgEnsinoBasico]		
    UNION ALL	
		
	-- Pivotando o n�vel 'INFANTIL'	
    SELECT	
        year												AS 'ANO'
        ,be_school_name										AS 'INSTITUICAO_ENSINO'
        ,city_id											AS 'COD_MUNICIPIO_IBGE'
        ,be_school_administrative_category					AS 'COD_CATEGORIA_ADMINISTRATIVA'
        ,'Infantil'											AS 'NIVEL'
        ,be_fact2_student_aggregated_qt_mat_inf 			AS 'MATRICULAS'
		,CASE
			WHEN be_school_name LIKE '%SESC%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO SOCIAL DO COMERCIO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SESQUINHO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO NACIONAL DE APRENDIZAGEM COMERCIAL%' THEN 'SENAC'			
			WHEN be_school_name LIKE '%SENAC%' THEN 'SENAC'
			ELSE 'CONCORRENTES'
		END 												AS 'TIPO_MATRICULA'
    FROM [DadosExternos].[dbo].[MEDU_StgEnsinoBasico]		
    UNION ALL	
	
	-- Pivotando o n�vel 'INFANTIL CRECHE INTEGRAL'		
    SELECT	
        year												AS 'ANO'
        ,be_school_name										AS 'INSTITUICAO_ENSINO'
        ,city_id											AS 'COD_MUNICIPIO_IBGE'
        ,be_school_administrative_category					AS 'COD_CATEGORIA_ADMINISTRATIVA'
        ,'Infantil Creche Integral'							AS 'NIVEL'
        ,be_fact2_student_aggregated_qt_mat_inf_cre_int 	AS 'MATRICULAS'
		,CASE
			WHEN be_school_name LIKE '%SESC%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO SOCIAL DO COMERCIO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SESQUINHO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO NACIONAL DE APRENDIZAGEM COMERCIAL%' THEN 'SENAC'			
			WHEN be_school_name LIKE '%SENAC%' THEN 'SENAC'
			ELSE 'CONCORRENTES'
		END 												AS 'TIPO_MATRICULA'
    FROM [DadosExternos].[dbo].[MEDU_StgEnsinoBasico]		
    UNION ALL	
		
	-- Pivotando o n�vel 'INFANTIL PRE ESCOLA INTEGRAL'	
	SELECT	
        year												AS 'ANO'
        ,be_school_name										AS 'INSTITUICAO_ENSINO'
        ,city_id											AS 'COD_MUNICIPIO_IBGE'
        ,be_school_administrative_category					AS 'COD_CATEGORIA_ADMINISTRATIVA'
        ,'Infantil Pr� Escola Integral'						AS 'NIVEL'
        ,be_fact2_student_aggregated_qt_mat_inf_pre_int 	AS 'MATRICULAS'
		,CASE
			WHEN be_school_name LIKE '%SESC%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO SOCIAL DO COMERCIO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SESQUINHO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO NACIONAL DE APRENDIZAGEM COMERCIAL%' THEN 'SENAC'			
			WHEN be_school_name LIKE '%SENAC%' THEN 'SENAC'
			ELSE 'CONCORRENTES'
		END 												AS 'TIPO_MATRICULA'
    FROM [DadosExternos].[dbo].[MEDU_StgEnsinoBasico]		
    UNION ALL	
		
	-- Pivotando o n�vel 'FUNDAMENTAL'	
	SELECT	
        year												AS 'ANO'
        ,be_school_name										AS 'INSTITUICAO_ENSINO'
        ,city_id											AS 'COD_MUNICIPIO_IBGE'
        ,be_school_administrative_category					AS 'COD_CATEGORIA_ADMINISTRATIVA'
        ,'Fundamental'										AS 'NIVEL'
        ,be_fact2_student_aggregated_qt_mat_fund 			AS 'MATRICULAS'
		,CASE
			WHEN be_school_name LIKE '%SESC%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO SOCIAL DO COMERCIO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SESQUINHO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO NACIONAL DE APRENDIZAGEM COMERCIAL%' THEN 'SENAC'			
			WHEN be_school_name LIKE '%SENAC%' THEN 'SENAC'
			ELSE 'CONCORRENTES'
		END 												AS 'TIPO_MATRICULA'
    FROM [DadosExternos].[dbo].[MEDU_StgEnsinoBasico]
    UNION ALL
	
	-- Pivotando o n�vel 'FUNDAMENTAL INTEGRAL'
	SELECT	
        year												AS 'ANO'
        ,be_school_name										AS 'INSTITUICAO_ENSINO'
        ,city_id											AS 'COD_MUNICIPIO_IBGE'
        ,be_school_administrative_category					AS 'COD_CATEGORIA_ADMINISTRATIVA'
        ,'Fundamental Integral'								AS 'NIVEL'
        ,be_fact2_student_aggregated_qt_mat_fund_int 		AS 'MATRICULAS'
		,CASE
			WHEN be_school_name LIKE '%SESC%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO SOCIAL DO COMERCIO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SESQUINHO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO NACIONAL DE APRENDIZAGEM COMERCIAL%' THEN 'SENAC'			
			WHEN be_school_name LIKE '%SENAC%' THEN 'SENAC'
			ELSE 'CONCORRENTES'
		END 												AS 'TIPO_MATRICULA'
    FROM [DadosExternos].[dbo].[MEDU_StgEnsinoBasico]
    UNION ALL
	
	-- Pivotando o n�vel 'FUNDAMENTAL ANOS INICIAIS INTEGRAL'
	SELECT	
        year												AS 'ANO'
        ,be_school_name										AS 'INSTITUICAO_ENSINO'
        ,city_id											AS 'COD_MUNICIPIO_IBGE'
        ,be_school_administrative_category					AS 'COD_CATEGORIA_ADMINISTRATIVA'
        ,'Fundamental Anos Iniciais Integral'				AS 'NIVEL'
        ,be_fact2_student_aggregated_qt_mat_fund_ai_int 	AS 'MATRICULAS'
		,CASE
			WHEN be_school_name LIKE '%SESC%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO SOCIAL DO COMERCIO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SESQUINHO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO NACIONAL DE APRENDIZAGEM COMERCIAL%' THEN 'SENAC'			
			WHEN be_school_name LIKE '%SENAC%' THEN 'SENAC'
			ELSE 'CONCORRENTES'
		END 												AS 'TIPO_MATRICULA'
    FROM [DadosExternos].[dbo].[MEDU_StgEnsinoBasico]
    UNION ALL
	
	-- Pivotando o n�vel 'FUNDAMENTAL ANOS FINAIS INTEGRAL'
	SELECT	
        year												AS 'ANO'
        ,be_school_name										AS 'INSTITUICAO_ENSINO'
        ,city_id											AS 'COD_MUNICIPIO_IBGE'
        ,be_school_administrative_category					AS 'COD_CATEGORIA_ADMINISTRATIVA'
        ,'Fundamental Anos Finais Integral'					AS 'NIVEL'
        ,be_fact2_student_aggregated_qt_mat_fund_af_int 	AS 'MATRICULAS'
		,CASE
			WHEN be_school_name LIKE '%SESC%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO SOCIAL DO COMERCIO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SESQUINHO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO NACIONAL DE APRENDIZAGEM COMERCIAL%' THEN 'SENAC'			
			WHEN be_school_name LIKE '%SENAC%' THEN 'SENAC'
			ELSE 'CONCORRENTES'
		END 												AS 'TIPO_MATRICULA'
    FROM [DadosExternos].[dbo].[MEDU_StgEnsinoBasico]
    UNION ALL
	-- Pivotando o n�vel 'INFANTIL INTEGRAL'
		SELECT	
        year												AS 'ANO'
        ,be_school_name										AS 'INSTITUICAO_ENSINO'
        ,city_id											AS 'COD_MUNICIPIO_IBGE'
        ,be_school_administrative_category					AS 'COD_CATEGORIA_ADMINISTRATIVA'
        ,'Infantil Integral'								AS 'NIVEL'
        ,be_fact2_student_aggregated_qt_mat_inf_int 		AS 'MATRICULAS'
		,CASE
			WHEN be_school_name LIKE '%SESC%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO SOCIAL DO COMERCIO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SESQUINHO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO NACIONAL DE APRENDIZAGEM COMERCIAL%' THEN 'SENAC'			
			WHEN be_school_name LIKE '%SENAC%' THEN 'SENAC'
			ELSE 'CONCORRENTES'
		END 												AS 'TIPO_MATRICULA'
    FROM [DadosExternos].[dbo].[MEDU_StgEnsinoBasico]
    UNION ALL
	
	-- Pivotando o n�vel 'INFANTIL CRECHE'
	SELECT	
        year												AS 'ANO'
        ,be_school_name										AS 'INSTITUICAO_ENSINO'
        ,city_id											AS 'COD_MUNICIPIO_IBGE'
        ,be_school_administrative_category					AS 'COD_CATEGORIA_ADMINISTRATIVA'
        ,'Infantil Creche'									AS 'NIVEL'
        ,be_fact2_student_aggregated_qt_mat_inf_cre 		AS 'MATRICULAS'
		,CASE
			WHEN be_school_name LIKE '%SESC%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO SOCIAL DO COMERCIO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SESQUINHO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO NACIONAL DE APRENDIZAGEM COMERCIAL%' THEN 'SENAC'			
			WHEN be_school_name LIKE '%SENAC%' THEN 'SENAC'
			ELSE 'CONCORRENTES'
		END 												AS 'TIPO_MATRICULA'
    FROM [DadosExternos].[dbo].[MEDU_StgEnsinoBasico]
    UNION ALL
	
	-- Pivotando o n�vel 'INFANTIL PRE ESCOLA'
	SELECT	
        year												AS 'ANO'
        ,be_school_name										AS 'INSTITUICAO_ENSINO'
        ,city_id											AS 'COD_MUNICIPIO_IBGE'
        ,be_school_administrative_category					AS 'COD_CATEGORIA_ADMINISTRATIVA'
        ,'Infantil Pr� Escola'								AS 'NIVEL'
        ,be_fact2_student_aggregated_qt_mat_inf_pre 		AS 'MATRICULAS'
		,CASE
			WHEN be_school_name LIKE '%SESC%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO SOCIAL DO COMERCIO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SESQUINHO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO NACIONAL DE APRENDIZAGEM COMERCIAL%' THEN 'SENAC'			
			WHEN be_school_name LIKE '%SENAC%' THEN 'SENAC'
			ELSE 'CONCORRENTES'
		END 												AS 'TIPO_MATRICULA'
    FROM [DadosExternos].[dbo].[MEDU_StgEnsinoBasico]
    UNION ALL
	
	-- Pivotando o n�vel 'M�DIO'	
	SELECT	
        year												AS 'ANO'
        ,be_school_name										AS 'INSTITUICAO_ENSINO'
        ,city_id											AS 'COD_MUNICIPIO_IBGE'
        ,be_school_administrative_category					AS 'COD_CATEGORIA_ADMINISTRATIVA'
        ,'M�dio'											AS 'NIVEL'
        ,be_fact2_student_aggregated_qt_mat_med 			AS 'MATRICULAS'
		,CASE
			WHEN be_school_name LIKE '%SESC%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO SOCIAL DO COMERCIO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SESQUINHO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO NACIONAL DE APRENDIZAGEM COMERCIAL%' THEN 'SENAC'			
			WHEN be_school_name LIKE '%SENAC%' THEN 'SENAC'
			ELSE 'CONCORRENTES'
		END 												AS 'TIPO_MATRICULA'
    FROM [DadosExternos].[dbo].[MEDU_StgEnsinoBasico]
    UNION ALL
	
	-- Pivotando o n�vel 'EJA_M�DIO'	
	SELECT	
        year												AS 'ANO'
        ,be_school_name										AS 'INSTITUICAO_ENSINO'
        ,city_id											AS 'COD_MUNICIPIO_IBGE'
        ,be_school_administrative_category					AS 'COD_CATEGORIA_ADMINISTRATIVA'
        ,'EJA M�dio'										AS 'NIVEL'
        ,be_fact2_student_aggregated_qt_mat_eja_med 		AS 'MATRICULAS'
		,CASE
			WHEN be_school_name LIKE '%SESC%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO SOCIAL DO COMERCIO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SESQUINHO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO NACIONAL DE APRENDIZAGEM COMERCIAL%' THEN 'SENAC'			
			WHEN be_school_name LIKE '%SENAC%' THEN 'SENAC'
			ELSE 'CONCORRENTES'
		END 												AS 'TIPO_MATRICULA'
    FROM [DadosExternos].[dbo].[MEDU_StgEnsinoBasico]
    UNION ALL
	
	-- Pivotando o n�vel 'M�DIO INTEGRAL'	
	SELECT	
        year												AS 'ANO'
        ,be_school_name										AS 'INSTITUICAO_ENSINO'
        ,city_id											AS 'COD_MUNICIPIO_IBGE'
        ,be_school_administrative_category					AS 'COD_CATEGORIA_ADMINISTRATIVA'
        ,'M�dio Integral'									AS 'NIVEL'
        ,be_fact2_student_aggregated_qt_mat_med_int 		AS 'MATRICULAS'
		,CASE
			WHEN be_school_name LIKE '%SESC%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO SOCIAL DO COMERCIO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SESQUINHO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO NACIONAL DE APRENDIZAGEM COMERCIAL%' THEN 'SENAC'			
			WHEN be_school_name LIKE '%SENAC%' THEN 'SENAC'
			ELSE 'CONCORRENTES'
		END 												AS 'TIPO_MATRICULA'
    FROM [DadosExternos].[dbo].[MEDU_StgEnsinoBasico]
    UNION ALL

		-- Pivotando o n�vel 'M�DIO INTEGRAL'
	SELECT	
        year												AS 'ANO'
        ,be_school_name										AS 'INSTITUICAO_ENSINO'
        ,city_id											AS 'COD_MUNICIPIO_IBGE'
        ,be_school_administrative_category					AS 'COD_CATEGORIA_ADMINISTRATIVA'
        ,'EJA'												AS 'NIVEL'
        ,be_fact2_student_aggregated_qt_mat_eja 			AS 'MATRICULAS'
		,CASE
			WHEN be_school_name LIKE '%SESC%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO SOCIAL DO COMERCIO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SESQUINHO%' THEN 'SESC'
			WHEN be_school_name LIKE '%SERVICO NACIONAL DE APRENDIZAGEM COMERCIAL%' THEN 'SENAC'			
			WHEN be_school_name LIKE '%SENAC%' THEN 'SENAC'
			ELSE 'CONCORRENTES'
		END 												AS 'TIPO_MATRICULA'
    FROM [DadosExternos].[dbo].[MEDU_StgEnsinoBasico]
)
, Sumarizada AS (
    -- Sumariza��o da tabela para reduzir registros
   SELECT
	ANO
	,INSTITUICAO_ENSINO
	,COD_MUNICIPIO_IBGE
	,COD_CATEGORIA_ADMINISTRATIVA
	,TIPO_MATRICULA
	,NIVEL
	,SUM(MATRICULAS) AS MATRICULAS
   FROM PivotNivel
   GROUP BY
	ANO
	,INSTITUICAO_ENSINO
	,COD_MUNICIPIO_IBGE
	,COD_CATEGORIA_ADMINISTRATIVA
	,NIVEL
	,TIPO_MATRICULA
)
-- INSERT NA TABELA FATO FINAL

INSERT INTO MEDU_FatoEnsinoBasico (ANO, INSTITUICAO_ENSINO, COD_MUNICIPIO_IBGE, COD_CATEGORIA_ADMINISTRATIVA, MATRICULAS, TIPO_MATRICULA, NIVEL)
SELECT
	 ANO
    ,INSTITUICAO_ENSINO
    ,COD_MUNICIPIO_IBGE
    ,COD_CATEGORIA_ADMINISTRATIVA
    ,MATRICULAS
	,TIPO_MATRICULA
    ,NIVEL
FROM Sumarizada;