
-- Criação da tabela de staging
IF OBJECT_ID('MEDU_StgEnsinoBasico', 'U') IS NOT NULL
BEGIN
    DROP TABLE MEDU_StgEnsinoBasico;
END
GO

CREATE TABLE [MEDU_StgEnsinoBasico] (
    [year] int,
    [be_school_name] nvarchar(255),
    [city_id] int,
    [be_school_administrative_category] int,
    [be_fact2_student_aggregated_qt_mat_inf] int,
    [be_fact2_student_aggregated_qt_mat_inf_pre_int] int,
    [be_fact2_student_aggregated_qt_mat_inf_cre] int,
    [be_fact2_student_aggregated_qt_mat_med] int,
    [be_fact2_student_aggregated_qt_mat_inf_pre] int,
    [be_fact2_student_aggregated_qt_mat_eja_med] int,
    [be_fact2_student_aggregated_qt_mat_inf_int] int,
    [be_fact2_student_aggregated_qt_mat_med_int] int,
    [be_fact2_student_aggregated_qt_mat_inf_cre_int] int,
    [be_fact2_student_aggregated_qt_mat_fund] int,
    [be_fact2_student_aggregated_qt_mat_fund_ai] int,
    [be_fact2_student_aggregated_qt_mat_fund_af] int,
    [be_fact2_student_aggregated_qt_mat_eja_fund] int,
    [be_fact2_student_aggregated_qt_mat_fund_int] int,
    [be_fact2_student_aggregated_qt_mat_fund_ai_int] int,
    [be_fact2_student_aggregated_qt_mat_fund_af_int] int,
    [be_fact2_student_aggregated_qt_mat_eja] int
)


