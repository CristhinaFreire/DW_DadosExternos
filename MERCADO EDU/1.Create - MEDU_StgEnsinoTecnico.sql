-- Criação da tabela de staging
IF OBJECT_ID('MEDU_StgEnsinoTecnico', 'U') IS NOT NULL
BEGIN
    DROP TABLE MEDU_StgEnsinoTecnico;
END
GO


CREATE TABLE [MEDU_StgEnsinoTecnico] (
    [year] int,
    [be_technical_course_name] nvarchar(255),
    [be_school_name] nvarchar(255),
    [city_id] int,
    [be_school_administrative_category] int,
    [be_axis_name] nvarchar(255),
    [be_fact_student_aggregated_gender] int,
    [be_fact_student_aggregated_step_teaching_id] int,
    [be_fact_student_aggregated_skin_color] int,
    [be_fact_student_aggregated_total] int,
    [be_fact_student_aggregated_total_pres] int,
    [be_fact_student_aggregated_total_semi] int,
    [be_fact_student_aggregated_total_ead] int,
    [be_fact_student_aggregated_deficiency_total] int,
    [porcentagem_pcd] int,
	[index]int
)