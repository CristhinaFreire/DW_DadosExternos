--CARGA DA FATO RAIS_FatoMovimentacaoTrabalhadores, CADA SELECT É REFERENTE A UM ANO

DROP TABLE IF EXISTS RAIS_FatoMovimentacaoTrabalhadores;

CREATE TABLE RAIS_FatoMovimentacaoTrabalhadores (
    COD_OCUPACAO INT,                                                         -- Código da ocupação na CBO
    COD_SUBCLASSE INT,                                                        -- Código da subclasse da CNAE
    COD_GRAU_INSTRUCAO INT,                                                   -- Grau de instrução
    COD_FAIXA_ETARIA INT,                                                     -- Faixa Etária do trabalhador
    COD_FAIXA_HORA_CONTRATUAL INT,                                            -- Faixa de horas contratuais
    COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO INT,                                 -- Faixa de remuneração média de dezembro do trabalhador em salários mínimos
    COD_FAIXA_REMUNERACAO_MEDIA_ANO INT,                                      -- Faixa de remuneração média do ano do trabalhador em salários mínimos
    COD_FAIXA_TEMPO_EMPREGO INT,                                              -- Faixa de tempo de emprego
    TRABALHADOR_PCD TEXT,                                                     -- Indicador se o empregado/servidor é portador de deficiência habilitado ou beneficiário reabilitado
    EMPRESA_OPTANTE_SIMPLES TEXT,                                             -- Indicador de optante pelo SIMPLES - a partir de 2001
    ANO_RAIS INT,                                                             -- Ano da RAIS
    DATA_ADMISSAO DATE,                                                       -- Mês de admissão
    DATA_DEMISSAO DATE,                                                       -- Mês de desligamento
    COD_MOTIVO_DESLIGAMENTO INT,                                              -- Motivo do desligamento
    COD_MUNICIPIO_SERVICO_PRESTADO INT,                                       -- Município onde o empregado está trabalhando ou prestando serviço - a partir de 2002
    COD_NATUREZA_JURIDICA INT,                                                -- Natureza Jurídica (CONCLA/2002)
    QTD_HORAS_CONTRATUAIS INT,                                                -- Quantidade de horas contratuais por semana
    COD_RACA_COR INT,                                                         -- Raça e Cor do Trabalhador
    COD_SEXO_TRABALHADOR INT,                                                 -- Sexo do trabalhador
    COD_TAMANHO_ESTABELECIMENTO INT,                                          -- Tamanho do estabelecimento - empregados ativos em 31/12 (10 categorias)
    TEMPO_EMPREGADO FLOAT,                                                    -- Tempo de emprego do trabalhador (quando acumulada representa a soma dos meses)
    COD_TIPO_ADMISSAO INT,                                                    -- Tipo de admissão
    COD_TIPO_DEFICIENCIA INT,                                                 -- Tipo de deficiência/Beneficiário habilitado
    COD_TIPO_EMPREGATICIO INT,                                                -- Tipo de vínculo empregatício
    VINCULO_ATIVO_DEZEMBRO TEXT,                                              -- Indicador de vínculo ativo em 31/12
    COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO INT,                                    -- Faixa de remuneração média de dezembro do trabalhador em salários mínimos
    VALOR_REMUNERACAO_DEZEMBRO FLOAT,                                         -- Valor nominal do salário de dezembro do trabalhador
    COD_FAIXA_SALARIAL_MEDIA_ANO INT,                                         -- Faixa de remuneração média do ano do trabalhador em salários mínimos
    VALOR_REMUNERACAO_MEDIA FLOAT,                                            -- Valor nominal do salário médio do trabalhador
    IDADE_TRABALHADOR INT,                                                    -- Idade do trabalhador
    COD_MUNICIPIO_ESTABELECIMENTO INT,                                        -- Município de localização do estabelecimento
    COD_NACIONALIDADE INT,                                                    -- Nacionalidade do trabalhador
    TRABALHADOR_INTERMITENTE TEXT,                                            -- Indicador de movimentação referente a contrato intermitente (a partir de 2017)
    TRABALHADOR_PARCIAL TEXT                                                  -- Indicador de movimentação referente a contrato parcial (a partir de 2017)
);

--CADA SELECT ABAIXO É REFERENTE A UM ANO DE 2022 ATÉ 2012 PARA AS BASES DO RS
SELECT
    CASE 
        WHEN TRIM("CBO Ocupação 2002") IS NULL OR TRIM("CBO Ocupação 2002") = '' THEN -1
        ELSE CAST(TRIM("CBO Ocupação 2002") AS INT)
    END AS 'COD_OCUPACAO',
    CASE 
        WHEN TRIM("CNAE 2.0 Subclasse") IS NULL OR TRIM("CNAE 2.0 Subclasse") = '' THEN -1
        ELSE CAST(TRIM("CNAE 2.0 Subclasse") AS INT)
    END AS 'COD_SUBCLASSE',
    CASE 
        WHEN TRIM("Escolaridade após 2005") IS NULL OR TRIM("Escolaridade após 2005") = '' THEN -1
        ELSE CAST(TRIM("Escolaridade após 2005") AS INT)
    END AS 'COD_GRAU_INSTRUCAO',
    CASE 
        WHEN TRIM("Faixa Etária") IS NULL OR TRIM("Faixa Etária") = '' THEN -1
        ELSE CAST(TRIM("Faixa Etária") AS INT)
    END AS 'COD_FAIXA_ETARIA',
    CASE 
        WHEN TRIM("Faixa Hora Contrat") IS NULL OR TRIM("Faixa Hora Contrat") = '' THEN -1
        ELSE CAST(TRIM("Faixa Hora Contrat") AS INT)
    END AS 'COD_FAIXA_HORA_CONTRATUAL',
    CASE 
        WHEN TRIM("Faixa Remun Dezem (SM)") IS NULL OR TRIM("Faixa Remun Dezem (SM)") = '' OR TRIM("Faixa Remun Dezem (SM)") = '99' THEN -1
        ELSE CAST(TRIM("Faixa Remun Dezem (SM)") AS INT)
    END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
    CASE 
        WHEN TRIM("Faixa Remun Média (SM)") IS NULL OR TRIM("Faixa Remun Média (SM)") = '' OR TRIM("Faixa Remun Média (SM)") = '99' THEN -1
        ELSE CAST(TRIM("Faixa Remun Média (SM)") AS INT)
    END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
    CASE 
        WHEN TRIM("Faixa Tempo Emprego") IS NULL OR TRIM("Faixa Tempo Emprego") = '' THEN -1
        ELSE CAST(TRIM("Faixa Tempo Emprego") AS INT)
    END AS 'COD_FAIXA_TEMPO_EMPREGO',
    CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
    CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
    2022 AS 'ANO_RAIS',
    CASE 
        WHEN "Mês Admissão" IS NULL OR "Mês Admissão" = 0 THEN DATE('1900-01-01')
        ELSE DATE(2022 || '-' || "Mês Admissão" || '-28')
    END AS 'DATA_ADMISSAO',               
    CASE 
        WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN DATE('1900-01-01')
        ELSE DATE(2022 || '-' || "Mês Desligamento" || '-28')
    END AS 'DATA_DEMISSAO',  
    CASE 
        WHEN TRIM("Motivo Desligamento") IS NULL OR TRIM("Motivo Desligamento") = '' THEN -1
        ELSE CAST(TRIM("Motivo Desligamento") AS INT)
    END AS 'COD_MOTIVO_DESLIGAMENTO',
    CASE 
        WHEN TRIM("Mun Trab") IS NULL OR TRIM("Mun Trab") = '' THEN -1
        ELSE CAST(TRIM("Mun Trab") AS INT)
    END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
    CASE 
        WHEN TRIM("Natureza Jurídica") IS NULL OR TRIM("Natureza Jurídica") = '' THEN -1
        ELSE CAST(TRIM("Natureza Jurídica") AS INT)
    END AS 'COD_NATUREZA_JURIDICA',
    CAST("Qtd Hora Contr" AS INT) AS 'QTD_HORAS_CONTRATUAIS',
    CASE 
        WHEN TRIM("Raça Cor") IS NULL OR TRIM("Raça Cor") = '' THEN -1
        ELSE CAST(TRIM("Raça Cor") AS INT)
    END AS 'COD_RACA_COR',
    CASE 
        WHEN TRIM("Sexo Trabalhador") IS NULL OR TRIM("Sexo Trabalhador") = '' THEN -1
        ELSE CAST(TRIM("Sexo Trabalhador") AS INT)
    END AS 'COD_SEXO_TRABALHADOR',
    CASE 
        WHEN TRIM("Tamanho Estabelecimento") IS NULL OR TRIM("Tamanho Estabelecimento") = '' THEN -1
        ELSE CAST(TRIM("Tamanho Estabelecimento") AS INT)
    END AS 'COD_TAMANHO_ESTABELECIMENTO',
    CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT) AS 'TEMPO_EMPREGADO',
    CASE 
        WHEN TRIM("Tipo Admissão") IS NULL OR TRIM("Tipo Admissão") = '' THEN -1
        ELSE CAST(TRIM("Tipo Admissão") AS INT)
    END AS 'COD_TIPO_ADMISSAO',
    CASE 
        WHEN TRIM("Tipo Defic") IS NULL OR TRIM("Tipo Defic") = '' THEN -1
        ELSE CAST(TRIM("Tipo Defic") AS INT)
    END AS 'COD_TIPO_DEFICIENCIA',
    CASE 
        WHEN TRIM("Tipo Vínculo") IS NULL OR TRIM("Tipo Vínculo") = '' THEN -1
        ELSE CAST(TRIM("Tipo Vínculo") AS INT)
    END AS 'COD_TIPO_EMPREGATICIO',
    CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
    CASE 
        WHEN TRIM("Vl Remun Dezembro (SM)") IS NULL OR TRIM("Vl Remun Dezembro (SM)") = '' THEN -1
        ELSE CAST(TRIM("Vl Remun Dezembro (SM)") AS INT)
    END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
    CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT) AS 'VALOR_REMUNERACAO_DEZEMBRO',
    CASE 
        WHEN TRIM("Vl Remun Média (SM)") IS NULL OR TRIM("Vl Remun Média (SM)") = '' THEN -1
        ELSE CAST(TRIM("Vl Remun Média (SM)") AS INT)
    END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
    CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT) AS 'VALOR_REMUNERACAO_MEDIA',
    CAST(Idade AS INT) AS 'IDADE_TRABALHADOR',
    CASE 
        WHEN TRIM(Município) IS NULL OR TRIM(Município) = '' THEN -1
        ELSE CAST(TRIM(Município) AS INT)
    END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
    CASE 
        WHEN TRIM(Nacionalidade) IS NULL OR TRIM(Nacionalidade) = '' THEN -1
        ELSE CAST(TRIM(Nacionalidade) AS INT)
    END AS 'COD_NACIONALIDADE',
    CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
    CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2022_RAIS_VINC_PUB_SUL]
WHERE Município <> 'Município'
  AND substr(Município, 1, 2) = '43'
UNION ALL
SELECT
    CASE 
        WHEN TRIM("CBO Ocupação 2002") IS NULL OR TRIM("CBO Ocupação 2002") = '' THEN -1
        ELSE CAST(TRIM("CBO Ocupação 2002") AS INT)
    END AS 'COD_OCUPACAO',
    CASE 
        WHEN TRIM("CNAE 2.0 Subclasse") IS NULL OR TRIM("CNAE 2.0 Subclasse") = '' THEN -1
        ELSE CAST(TRIM("CNAE 2.0 Subclasse") AS INT)
    END AS 'COD_SUBCLASSE',
    CASE 
        WHEN TRIM("Escolaridade após 2005") IS NULL OR TRIM("Escolaridade após 2005") = '' THEN -1
        ELSE CAST(TRIM("Escolaridade após 2005") AS INT)
    END AS 'COD_GRAU_INSTRUCAO',
    CASE 
        WHEN TRIM("Faixa Etária") IS NULL OR TRIM("Faixa Etária") = '' THEN -1
        ELSE CAST(TRIM("Faixa Etária") AS INT)
    END AS 'COD_FAIXA_ETARIA',
    CASE 
        WHEN TRIM("Faixa Hora Contrat") IS NULL OR TRIM("Faixa Hora Contrat") = '' THEN -1
        ELSE CAST(TRIM("Faixa Hora Contrat") AS INT)
    END AS 'COD_FAIXA_HORA_CONTRATUAL',
    CASE 
        WHEN TRIM("Faixa Remun Dezem (SM)") IS NULL OR TRIM("Faixa Remun Dezem (SM)") = '' OR TRIM("Faixa Remun Dezem (SM)") = '99' THEN -1
        ELSE CAST(TRIM("Faixa Remun Dezem (SM)") AS INT)
    END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
    CASE 
        WHEN TRIM("Faixa Remun Média (SM)") IS NULL OR TRIM("Faixa Remun Média (SM)") = '' OR TRIM("Faixa Remun Média (SM)") = '99' THEN -1
        ELSE CAST(TRIM("Faixa Remun Média (SM)") AS INT)
    END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
    CASE 
        WHEN TRIM("Faixa Tempo Emprego") IS NULL OR TRIM("Faixa Tempo Emprego") = '' THEN -1
        ELSE CAST(TRIM("Faixa Tempo Emprego") AS INT)
    END AS 'COD_FAIXA_TEMPO_EMPREGO',
    CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
    CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
    2021 AS 'ANO_RAIS',
    CASE 
        WHEN "Mês Admissão" IS NULL OR "Mês Admissão" = 0 THEN DATE('1900-01-01')
        ELSE DATE(2021 || '-' || "Mês Admissão" || '-28')
    END AS 'DATA_ADMISSAO',               
    CASE 
        WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN DATE('1900-01-01')
        ELSE DATE(2021 || '-' || "Mês Desligamento" || '-28')
    END AS 'DATA_DEMISSAO',  
    CASE 
        WHEN TRIM("Motivo Desligamento") IS NULL OR TRIM("Motivo Desligamento") = '' THEN -1
        ELSE CAST(TRIM("Motivo Desligamento") AS INT)
    END AS 'COD_MOTIVO_DESLIGAMENTO',
    CASE 
        WHEN TRIM("Mun Trab") IS NULL OR TRIM("Mun Trab") = '' THEN -1
        ELSE CAST(TRIM("Mun Trab") AS INT)
    END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
    CASE 
        WHEN TRIM("Natureza Jurídica") IS NULL OR TRIM("Natureza Jurídica") = '' THEN -1
        ELSE CAST(TRIM("Natureza Jurídica") AS INT)
    END AS 'COD_NATUREZA_JURIDICA',
    CAST("Qtd Hora Contr" AS INT) AS 'QTD_HORAS_CONTRATUAIS',
    CASE 
        WHEN TRIM("Raça Cor") IS NULL OR TRIM("Raça Cor") = '' THEN -1
        ELSE CAST(TRIM("Raça Cor") AS INT)
    END AS 'COD_RACA_COR',
    CASE 
        WHEN TRIM("Sexo Trabalhador") IS NULL OR TRIM("Sexo Trabalhador") = '' THEN -1
        ELSE CAST(TRIM("Sexo Trabalhador") AS INT)
    END AS 'COD_SEXO_TRABALHADOR',
    CASE 
        WHEN TRIM("Tamanho Estabelecimento") IS NULL OR TRIM("Tamanho Estabelecimento") = '' THEN -1
        ELSE CAST(TRIM("Tamanho Estabelecimento") AS INT)
    END AS 'COD_TAMANHO_ESTABELECIMENTO',
    CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT) AS 'TEMPO_EMPREGADO',
    CASE 
        WHEN TRIM("Tipo Admissão") IS NULL OR TRIM("Tipo Admissão") = '' THEN -1
        ELSE CAST(TRIM("Tipo Admissão") AS INT)
    END AS 'COD_TIPO_ADMISSAO',
    CASE 
        WHEN TRIM("Tipo Defic") IS NULL OR TRIM("Tipo Defic") = '' THEN -1
        ELSE CAST(TRIM("Tipo Defic") AS INT)
    END AS 'COD_TIPO_DEFICIENCIA',
    CASE 
        WHEN TRIM("Tipo Vínculo") IS NULL OR TRIM("Tipo Vínculo") = '' THEN -1
        ELSE CAST(TRIM("Tipo Vínculo") AS INT)
    END AS 'COD_TIPO_EMPREGATICIO',
    CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
    CASE 
        WHEN TRIM("Vl Remun Dezembro (SM)") IS NULL OR TRIM("Vl Remun Dezembro (SM)") = '' THEN -1
        ELSE CAST(TRIM("Vl Remun Dezembro (SM)") AS INT)
    END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
    CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT) AS 'VALOR_REMUNERACAO_DEZEMBRO',
    CASE 
        WHEN TRIM("Vl Remun Média (SM)") IS NULL OR TRIM("Vl Remun Média (SM)") = '' THEN -1
        ELSE CAST(TRIM("Vl Remun Média (SM)") AS INT)
    END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
    CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT) AS 'VALOR_REMUNERACAO_MEDIA',
    CAST(Idade AS INT) AS 'IDADE_TRABALHADOR',
    CASE 
        WHEN TRIM(Município) IS NULL OR TRIM(Município) = '' THEN -1
        ELSE CAST(TRIM(Município) AS INT)
    END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
    CASE 
        WHEN TRIM(Nacionalidade) IS NULL OR TRIM(Nacionalidade) = '' THEN -1
        ELSE CAST(TRIM(Nacionalidade) AS INT)
    END AS 'COD_NACIONALIDADE',
    CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
    CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2021_RAIS_VINC_PUB_SUL]
WHERE Município <> 'Município'
  AND substr(Município, 1, 2) = '43'
UNION ALL
SELECT
    CASE 
        WHEN TRIM("CBO Ocupação 2002") IS NULL OR TRIM("CBO Ocupação 2002") = '' THEN -1
        ELSE CAST(TRIM("CBO Ocupação 2002") AS INT)
    END AS 'COD_OCUPACAO',
    CASE 
        WHEN TRIM("CNAE 2.0 Subclasse") IS NULL OR TRIM("CNAE 2.0 Subclasse") = '' THEN -1
        ELSE CAST(TRIM("CNAE 2.0 Subclasse") AS INT)
    END AS 'COD_SUBCLASSE',
    CASE 
        WHEN TRIM("Escolaridade após 2005") IS NULL OR TRIM("Escolaridade após 2005") = '' THEN -1
        ELSE CAST(TRIM("Escolaridade após 2005") AS INT)
    END AS 'COD_GRAU_INSTRUCAO',
    CASE 
        WHEN TRIM("Faixa Etária") IS NULL OR TRIM("Faixa Etária") = '' THEN -1
        ELSE CAST(TRIM("Faixa Etária") AS INT)
    END AS 'COD_FAIXA_ETARIA',
    CASE 
        WHEN TRIM("Faixa Hora Contrat") IS NULL OR TRIM("Faixa Hora Contrat") = '' THEN -1
        ELSE CAST(TRIM("Faixa Hora Contrat") AS INT)
    END AS 'COD_FAIXA_HORA_CONTRATUAL',
    CASE 
        WHEN TRIM("Faixa Remun Dezem (SM)") IS NULL OR TRIM("Faixa Remun Dezem (SM)") = '' OR TRIM("Faixa Remun Dezem (SM)") = '99' THEN -1
        ELSE CAST(TRIM("Faixa Remun Dezem (SM)") AS INT)
    END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
    CASE 
        WHEN TRIM("Faixa Remun Média (SM)") IS NULL OR TRIM("Faixa Remun Média (SM)") = '' OR TRIM("Faixa Remun Média (SM)") = '99' THEN -1
        ELSE CAST(TRIM("Faixa Remun Média (SM)") AS INT)
    END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
    CASE 
        WHEN TRIM("Faixa Tempo Emprego") IS NULL OR TRIM("Faixa Tempo Emprego") = '' THEN -1
        ELSE CAST(TRIM("Faixa Tempo Emprego") AS INT)
    END AS 'COD_FAIXA_TEMPO_EMPREGO',
    CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
    CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
    2020 AS 'ANO_RAIS',
    CASE 
        WHEN "Mês Admissão" IS NULL OR "Mês Admissão" = 0 THEN DATE('1900-01-01')
        ELSE DATE(2020 || '-' || "Mês Admissão" || '-28')
    END AS 'DATA_ADMISSAO',               
    CASE 
        WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN DATE('1900-01-01')
        ELSE DATE(2020 || '-' || "Mês Desligamento" || '-28')
    END AS 'DATA_DEMISSAO',  
    CASE 
        WHEN TRIM("Motivo Desligamento") IS NULL OR TRIM("Motivo Desligamento") = '' THEN -1
        ELSE CAST(TRIM("Motivo Desligamento") AS INT)
    END AS 'COD_MOTIVO_DESLIGAMENTO',
    CASE 
        WHEN TRIM("Mun Trab") IS NULL OR TRIM("Mun Trab") = '' THEN -1
        ELSE CAST(TRIM("Mun Trab") AS INT)
    END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
    CASE 
        WHEN TRIM("Natureza Jurídica") IS NULL OR TRIM("Natureza Jurídica") = '' THEN -1
        ELSE CAST(TRIM("Natureza Jurídica") AS INT)
    END AS 'COD_NATUREZA_JURIDICA',
    CAST("Qtd Hora Contr" AS INT) AS 'QTD_HORAS_CONTRATUAIS',
    CASE 
        WHEN TRIM("Raça Cor") IS NULL OR TRIM("Raça Cor") = '' THEN -1
        ELSE CAST(TRIM("Raça Cor") AS INT)
    END AS 'COD_RACA_COR',
    CASE 
        WHEN TRIM("Sexo Trabalhador") IS NULL OR TRIM("Sexo Trabalhador") = '' THEN -1
        ELSE CAST(TRIM("Sexo Trabalhador") AS INT)
    END AS 'COD_SEXO_TRABALHADOR',
    CASE 
        WHEN TRIM("Tamanho Estabelecimento") IS NULL OR TRIM("Tamanho Estabelecimento") = '' THEN -1
        ELSE CAST(TRIM("Tamanho Estabelecimento") AS INT)
    END AS 'COD_TAMANHO_ESTABELECIMENTO',
    CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT) AS 'TEMPO_EMPREGADO',
    CASE 
        WHEN TRIM("Tipo Admissão") IS NULL OR TRIM("Tipo Admissão") = '' THEN -1
        ELSE CAST(TRIM("Tipo Admissão") AS INT)
    END AS 'COD_TIPO_ADMISSAO',
    CASE 
        WHEN TRIM("Tipo Defic") IS NULL OR TRIM("Tipo Defic") = '' THEN -1
        ELSE CAST(TRIM("Tipo Defic") AS INT)
    END AS 'COD_TIPO_DEFICIENCIA',
    CASE 
        WHEN TRIM("Tipo Vínculo") IS NULL OR TRIM("Tipo Vínculo") = '' THEN -1
        ELSE CAST(TRIM("Tipo Vínculo") AS INT)
    END AS 'COD_TIPO_EMPREGATICIO',
    CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
    CASE 
        WHEN TRIM("Vl Remun Dezembro (SM)") IS NULL OR TRIM("Vl Remun Dezembro (SM)") = '' THEN -1
        ELSE CAST(TRIM("Vl Remun Dezembro (SM)") AS INT)
    END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
    CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT) AS 'VALOR_REMUNERACAO_DEZEMBRO',
    CASE 
        WHEN TRIM("Vl Remun Média (SM)") IS NULL OR TRIM("Vl Remun Média (SM)") = '' THEN -1
        ELSE CAST(TRIM("Vl Remun Média (SM)") AS INT)
    END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
    CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT) AS 'VALOR_REMUNERACAO_MEDIA',
    CAST(Idade AS INT) AS 'IDADE_TRABALHADOR',
    CASE 
        WHEN TRIM(Município) IS NULL OR TRIM(Município) = '' THEN -1
        ELSE CAST(TRIM(Município) AS INT)
    END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
    CASE 
        WHEN TRIM(Nacionalidade) IS NULL OR TRIM(Nacionalidade) = '' THEN -1
        ELSE CAST(TRIM(Nacionalidade) AS INT)
    END AS 'COD_NACIONALIDADE',
    CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
    CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2020_RAIS_VINC_PUB_SUL]
WHERE Município <> 'Município'
  AND substr(Município, 1, 2) = '43'
UNION ALL
SELECT
    CASE 
        WHEN TRIM("CBO Ocupação 2002") IS NULL OR TRIM("CBO Ocupação 2002") = '' THEN -1
        ELSE CAST(TRIM("CBO Ocupação 2002") AS INT)
    END AS 'COD_OCUPACAO',
    CASE 
        WHEN TRIM("CNAE 2.0 Subclasse") IS NULL OR TRIM("CNAE 2.0 Subclasse") = '' THEN -1
        ELSE CAST(TRIM("CNAE 2.0 Subclasse") AS INT)
    END AS 'COD_SUBCLASSE',
    CASE 
        WHEN TRIM("Escolaridade após 2005") IS NULL OR TRIM("Escolaridade após 2005") = '' THEN -1
        ELSE CAST(TRIM("Escolaridade após 2005") AS INT)
    END AS 'COD_GRAU_INSTRUCAO',
    CASE 
        WHEN TRIM("Faixa Etária") IS NULL OR TRIM("Faixa Etária") = '' THEN -1
        ELSE CAST(TRIM("Faixa Etária") AS INT)
    END AS 'COD_FAIXA_ETARIA',
    CASE 
        WHEN TRIM("Faixa Hora Contrat") IS NULL OR TRIM("Faixa Hora Contrat") = '' THEN -1
        ELSE CAST(TRIM("Faixa Hora Contrat") AS INT)
    END AS 'COD_FAIXA_HORA_CONTRATUAL',
    CASE 
        WHEN TRIM("Faixa Remun Dezem (SM)") IS NULL OR TRIM("Faixa Remun Dezem (SM)") = '' OR TRIM("Faixa Remun Dezem (SM)") = '99' THEN -1
        ELSE CAST(TRIM("Faixa Remun Dezem (SM)") AS INT)
    END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
    CASE 
        WHEN TRIM("Faixa Remun Média (SM)") IS NULL OR TRIM("Faixa Remun Média (SM)") = '' OR TRIM("Faixa Remun Média (SM)") = '99' THEN -1
        ELSE CAST(TRIM("Faixa Remun Média (SM)") AS INT)
    END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
    CASE 
        WHEN TRIM("Faixa Tempo Emprego") IS NULL OR TRIM("Faixa Tempo Emprego") = '' THEN -1
        ELSE CAST(TRIM("Faixa Tempo Emprego") AS INT)
    END AS 'COD_FAIXA_TEMPO_EMPREGO',
    CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
    CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
    2019 AS 'ANO_RAIS',
    CASE 
        WHEN "Mês Admissão" IS NULL OR "Mês Admissão" = 0 THEN DATE('1900-01-01')
        ELSE DATE(2019 || '-' || "Mês Admissão" || '-28')
    END AS 'DATA_ADMISSAO',               
    CASE 
        WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN DATE('1900-01-01')
        ELSE DATE(2019 || '-' || "Mês Desligamento" || '-28')
    END AS 'DATA_DEMISSAO',  
    CASE 
        WHEN TRIM("Motivo Desligamento") IS NULL OR TRIM("Motivo Desligamento") = '' THEN -1
        ELSE CAST(TRIM("Motivo Desligamento") AS INT)
    END AS 'COD_MOTIVO_DESLIGAMENTO',
    CASE 
        WHEN TRIM("Mun Trab") IS NULL OR TRIM("Mun Trab") = '' THEN -1
        ELSE CAST(TRIM("Mun Trab") AS INT)
    END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
    CASE 
        WHEN TRIM("Natureza Jurídica") IS NULL OR TRIM("Natureza Jurídica") = '' THEN -1
        ELSE CAST(TRIM("Natureza Jurídica") AS INT)
    END AS 'COD_NATUREZA_JURIDICA',
    CAST("Qtd Hora Contr" AS INT) AS 'QTD_HORAS_CONTRATUAIS',
    CASE 
        WHEN TRIM("Raça Cor") IS NULL OR TRIM("Raça Cor") = '' THEN -1
        ELSE CAST(TRIM("Raça Cor") AS INT)
    END AS 'COD_RACA_COR',
    CASE 
        WHEN TRIM("Sexo Trabalhador") IS NULL OR TRIM("Sexo Trabalhador") = '' THEN -1
        ELSE CAST(TRIM("Sexo Trabalhador") AS INT)
    END AS 'COD_SEXO_TRABALHADOR',
    CASE 
        WHEN TRIM("Tamanho Estabelecimento") IS NULL OR TRIM("Tamanho Estabelecimento") = '' THEN -1
        ELSE CAST(TRIM("Tamanho Estabelecimento") AS INT)
    END AS 'COD_TAMANHO_ESTABELECIMENTO',
    CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT) AS 'TEMPO_EMPREGADO',
    CASE 
        WHEN TRIM("Tipo Admissão") IS NULL OR TRIM("Tipo Admissão") = '' THEN -1
        ELSE CAST(TRIM("Tipo Admissão") AS INT)
    END AS 'COD_TIPO_ADMISSAO',
    CASE 
        WHEN TRIM("Tipo Defic") IS NULL OR TRIM("Tipo Defic") = '' THEN -1
        ELSE CAST(TRIM("Tipo Defic") AS INT)
    END AS 'COD_TIPO_DEFICIENCIA',
    CASE 
        WHEN TRIM("Tipo Vínculo") IS NULL OR TRIM("Tipo Vínculo") = '' THEN -1
        ELSE CAST(TRIM("Tipo Vínculo") AS INT)
    END AS 'COD_TIPO_EMPREGATICIO',
    CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
    CASE 
        WHEN TRIM("Vl Remun Dezembro (SM)") IS NULL OR TRIM("Vl Remun Dezembro (SM)") = '' THEN -1
        ELSE CAST(TRIM("Vl Remun Dezembro (SM)") AS INT)
    END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
    CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT) AS 'VALOR_REMUNERACAO_DEZEMBRO',
    CASE 
        WHEN TRIM("Vl Remun Média (SM)") IS NULL OR TRIM("Vl Remun Média (SM)") = '' THEN -1
        ELSE CAST(TRIM("Vl Remun Média (SM)") AS INT)
    END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
    CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT) AS 'VALOR_REMUNERACAO_MEDIA',
    CAST(Idade AS INT) AS 'IDADE_TRABALHADOR',
    CASE 
        WHEN TRIM(Município) IS NULL OR TRIM(Município) = '' THEN -1
        ELSE CAST(TRIM(Município) AS INT)
    END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
    CASE 
        WHEN TRIM(Nacionalidade) IS NULL OR TRIM(Nacionalidade) = '' THEN -1
        ELSE CAST(TRIM(Nacionalidade) AS INT)
    END AS 'COD_NACIONALIDADE',
    CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
    CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2019_RAIS_VINC_PUB_SUL]
WHERE Município <> 'Município'
  AND substr(Município, 1, 2) = '43'
UNION ALL
SELECT
    CASE 
        WHEN TRIM("CBO Ocupação 2002") IS NULL OR TRIM("CBO Ocupação 2002") = '' THEN -1
        ELSE CAST(TRIM("CBO Ocupação 2002") AS INT)
    END AS 'COD_OCUPACAO',
    CASE 
        WHEN TRIM("CNAE 2.0 Subclasse") IS NULL OR TRIM("CNAE 2.0 Subclasse") = '' THEN -1
        ELSE CAST(TRIM("CNAE 2.0 Subclasse") AS INT)
    END AS 'COD_SUBCLASSE',
    CASE 
        WHEN TRIM("Escolaridade após 2005") IS NULL OR TRIM("Escolaridade após 2005") = '' THEN -1
        ELSE CAST(TRIM("Escolaridade após 2005") AS INT)
    END AS 'COD_GRAU_INSTRUCAO',
    CASE 
        WHEN TRIM("Faixa Etária") IS NULL OR TRIM("Faixa Etária") = '' THEN -1
        ELSE CAST(TRIM("Faixa Etária") AS INT)
    END AS 'COD_FAIXA_ETARIA',
    CASE 
        WHEN TRIM("Faixa Hora Contrat") IS NULL OR TRIM("Faixa Hora Contrat") = '' THEN -1
        ELSE CAST(TRIM("Faixa Hora Contrat") AS INT)
    END AS 'COD_FAIXA_HORA_CONTRATUAL',
    CASE 
        WHEN TRIM("Faixa Remun Dezem (SM)") IS NULL OR TRIM("Faixa Remun Dezem (SM)") = '' OR TRIM("Faixa Remun Dezem (SM)") = '99' THEN -1
        ELSE CAST(TRIM("Faixa Remun Dezem (SM)") AS INT)
    END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
    CASE 
        WHEN TRIM("Faixa Remun Média (SM)") IS NULL OR TRIM("Faixa Remun Média (SM)") = '' OR TRIM("Faixa Remun Média (SM)") = '99' THEN -1
        ELSE CAST(TRIM("Faixa Remun Média (SM)") AS INT)
    END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
    CASE 
        WHEN TRIM("Faixa Tempo Emprego") IS NULL OR TRIM("Faixa Tempo Emprego") = '' THEN -1
        ELSE CAST(TRIM("Faixa Tempo Emprego") AS INT)
    END AS 'COD_FAIXA_TEMPO_EMPREGO',
    CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
    CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
    2018 AS 'ANO_RAIS',
    CASE 
        WHEN "Mês Admissão" IS NULL OR "Mês Admissão" = 0 THEN DATE('1900-01-01')
        ELSE DATE(2018 || '-' || "Mês Admissão" || '-28')
    END AS 'DATA_ADMISSAO',               
    CASE 
        WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN DATE('1900-01-01')
        ELSE DATE(2018 || '-' || "Mês Desligamento" || '-28')
    END AS 'DATA_DEMISSAO',  
    CASE 
        WHEN TRIM("Motivo Desligamento") IS NULL OR TRIM("Motivo Desligamento") = '' THEN -1
        ELSE CAST(TRIM("Motivo Desligamento") AS INT)
    END AS 'COD_MOTIVO_DESLIGAMENTO',
    CASE 
        WHEN TRIM("Mun Trab") IS NULL OR TRIM("Mun Trab") = '' THEN -1
        ELSE CAST(TRIM("Mun Trab") AS INT)
    END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
    CASE 
        WHEN TRIM("Natureza Jurídica") IS NULL OR TRIM("Natureza Jurídica") = '' THEN -1
        ELSE CAST(TRIM("Natureza Jurídica") AS INT)
    END AS 'COD_NATUREZA_JURIDICA',
    CAST("Qtd Hora Contr" AS INT) AS 'QTD_HORAS_CONTRATUAIS',
    CASE 
        WHEN TRIM("Raça Cor") IS NULL OR TRIM("Raça Cor") = '' THEN -1
        ELSE CAST(TRIM("Raça Cor") AS INT)
    END AS 'COD_RACA_COR',
    CASE 
        WHEN TRIM("Sexo Trabalhador") IS NULL OR TRIM("Sexo Trabalhador") = '' THEN -1
        ELSE CAST(TRIM("Sexo Trabalhador") AS INT)
    END AS 'COD_SEXO_TRABALHADOR',
    CASE 
        WHEN TRIM("Tamanho Estabelecimento") IS NULL OR TRIM("Tamanho Estabelecimento") = '' THEN -1
        ELSE CAST(TRIM("Tamanho Estabelecimento") AS INT)
    END AS 'COD_TAMANHO_ESTABELECIMENTO',
    CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT) AS 'TEMPO_EMPREGADO',
    CASE 
        WHEN TRIM("Tipo Admissão") IS NULL OR TRIM("Tipo Admissão") = '' THEN -1
        ELSE CAST(TRIM("Tipo Admissão") AS INT)
    END AS 'COD_TIPO_ADMISSAO',
    CASE 
        WHEN TRIM("Tipo Defic") IS NULL OR TRIM("Tipo Defic") = '' THEN -1
        ELSE CAST(TRIM("Tipo Defic") AS INT)
    END AS 'COD_TIPO_DEFICIENCIA',
    CASE 
        WHEN TRIM("Tipo Vínculo") IS NULL OR TRIM("Tipo Vínculo") = '' THEN -1
        ELSE CAST(TRIM("Tipo Vínculo") AS INT)
    END AS 'COD_TIPO_EMPREGATICIO',
    CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
    CASE 
        WHEN TRIM("Vl Remun Dezembro (SM)") IS NULL OR TRIM("Vl Remun Dezembro (SM)") = '' THEN -1
        ELSE CAST(TRIM("Vl Remun Dezembro (SM)") AS INT)
    END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
    CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT) AS 'VALOR_REMUNERACAO_DEZEMBRO',
    CASE 
        WHEN TRIM("Vl Remun Média (SM)") IS NULL OR TRIM("Vl Remun Média (SM)") = '' THEN -1
        ELSE CAST(TRIM("Vl Remun Média (SM)") AS INT)
    END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
    CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT) AS 'VALOR_REMUNERACAO_MEDIA',
    CAST(Idade AS INT) AS 'IDADE_TRABALHADOR',
    CASE 
        WHEN TRIM(Município) IS NULL OR TRIM(Município) = '' THEN -1
        ELSE CAST(TRIM(Município) AS INT)
    END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
    CASE 
        WHEN TRIM(Nacionalidade) IS NULL OR TRIM(Nacionalidade) = '' THEN -1
        ELSE CAST(TRIM(Nacionalidade) AS INT)
    END AS 'COD_NACIONALIDADE',
    CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
    CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2018_RAIS_VINC_PUB_SUL]
WHERE Município <> 'Município'
  AND substr(Município, 1, 2) = '43'
UNION ALL
SELECT
    CASE 
        WHEN TRIM("CBO Ocupação 2002") IS NULL OR TRIM("CBO Ocupação 2002") = '' THEN -1
        ELSE CAST(TRIM("CBO Ocupação 2002") AS INT)
    END AS 'COD_OCUPACAO',
    CASE 
        WHEN TRIM("CNAE 2.0 Subclasse") IS NULL OR TRIM("CNAE 2.0 Subclasse") = '' THEN -1
        ELSE CAST(TRIM("CNAE 2.0 Subclasse") AS INT)
    END AS 'COD_SUBCLASSE',
    CASE 
        WHEN TRIM("Escolaridade após 2005") IS NULL OR TRIM("Escolaridade após 2005") = '' THEN -1
        ELSE CAST(TRIM("Escolaridade após 2005") AS INT)
    END AS 'COD_GRAU_INSTRUCAO',
    CASE 
        WHEN TRIM("Faixa Etária") IS NULL OR TRIM("Faixa Etária") = '' THEN -1
        ELSE CAST(TRIM("Faixa Etária") AS INT)
    END AS 'COD_FAIXA_ETARIA',
    CASE 
        WHEN TRIM("Faixa Hora Contrat") IS NULL OR TRIM("Faixa Hora Contrat") = '' THEN -1
        ELSE CAST(TRIM("Faixa Hora Contrat") AS INT)
    END AS 'COD_FAIXA_HORA_CONTRATUAL',
    CASE 
        WHEN TRIM("Faixa Remun Dezem (SM)") IS NULL OR TRIM("Faixa Remun Dezem (SM)") = '' OR TRIM("Faixa Remun Dezem (SM)") = '99' THEN -1
        ELSE CAST(TRIM("Faixa Remun Dezem (SM)") AS INT)
    END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
    CASE 
        WHEN TRIM("Faixa Remun Média (SM)") IS NULL OR TRIM("Faixa Remun Média (SM)") = '' OR TRIM("Faixa Remun Média (SM)") = '99' THEN -1
        ELSE CAST(TRIM("Faixa Remun Média (SM)") AS INT)
    END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
    CASE 
        WHEN TRIM("Faixa Tempo Emprego") IS NULL OR TRIM("Faixa Tempo Emprego") = '' THEN -1
        ELSE CAST(TRIM("Faixa Tempo Emprego") AS INT)
    END AS 'COD_FAIXA_TEMPO_EMPREGO',
    CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
    CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
    2017 AS 'ANO_RAIS',
    CASE 
        WHEN "Mês Admissão" IS NULL OR "Mês Admissão" = 0 THEN DATE('1900-01-01')
        ELSE DATE(2017 || '-' || "Mês Admissão" || '-28')
    END AS 'DATA_ADMISSAO',               
    CASE 
        WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN DATE('1900-01-01')
        ELSE DATE(2017 || '-' || "Mês Desligamento" || '-28')
    END AS 'DATA_DEMISSAO',  
    CASE 
        WHEN TRIM("Motivo Desligamento") IS NULL OR TRIM("Motivo Desligamento") = '' THEN -1
        ELSE CAST(TRIM("Motivo Desligamento") AS INT)
    END AS 'COD_MOTIVO_DESLIGAMENTO',
    CASE 
        WHEN TRIM("Mun Trab") IS NULL OR TRIM("Mun Trab") = '' THEN -1
        ELSE CAST(TRIM("Mun Trab") AS INT)
    END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
    CASE 
        WHEN TRIM("Natureza Jurídica") IS NULL OR TRIM("Natureza Jurídica") = '' THEN -1
        ELSE CAST(TRIM("Natureza Jurídica") AS INT)
    END AS 'COD_NATUREZA_JURIDICA',
    CAST("Qtd Hora Contr" AS INT) AS 'QTD_HORAS_CONTRATUAIS',
    CASE 
        WHEN TRIM("Raça Cor") IS NULL OR TRIM("Raça Cor") = '' THEN -1
        ELSE CAST(TRIM("Raça Cor") AS INT)
    END AS 'COD_RACA_COR',
    CASE 
        WHEN TRIM("Sexo Trabalhador") IS NULL OR TRIM("Sexo Trabalhador") = '' THEN -1
        ELSE CAST(TRIM("Sexo Trabalhador") AS INT)
    END AS 'COD_SEXO_TRABALHADOR',
    CASE 
        WHEN TRIM("Tamanho Estabelecimento") IS NULL OR TRIM("Tamanho Estabelecimento") = '' THEN -1
        ELSE CAST(TRIM("Tamanho Estabelecimento") AS INT)
    END AS 'COD_TAMANHO_ESTABELECIMENTO',
    CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT) AS 'TEMPO_EMPREGADO',
    CASE 
        WHEN TRIM("Tipo Admissão") IS NULL OR TRIM("Tipo Admissão") = '' THEN -1
        ELSE CAST(TRIM("Tipo Admissão") AS INT)
    END AS 'COD_TIPO_ADMISSAO',
    CASE 
        WHEN TRIM("Tipo Defic") IS NULL OR TRIM("Tipo Defic") = '' THEN -1
        ELSE CAST(TRIM("Tipo Defic") AS INT)
    END AS 'COD_TIPO_DEFICIENCIA',
    CASE 
        WHEN TRIM("Tipo Vínculo") IS NULL OR TRIM("Tipo Vínculo") = '' THEN -1
        ELSE CAST(TRIM("Tipo Vínculo") AS INT)
    END AS 'COD_TIPO_EMPREGATICIO',
    CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
    CASE 
        WHEN TRIM("Vl Remun Dezembro (SM)") IS NULL OR TRIM("Vl Remun Dezembro (SM)") = '' THEN -1
        ELSE CAST(TRIM("Vl Remun Dezembro (SM)") AS INT)
    END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
    CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT) AS 'VALOR_REMUNERACAO_DEZEMBRO',
    CASE 
        WHEN TRIM("Vl Remun Média (SM)") IS NULL OR TRIM("Vl Remun Média (SM)") = '' THEN -1
        ELSE CAST(TRIM("Vl Remun Média (SM)") AS INT)
    END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
    CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT) AS 'VALOR_REMUNERACAO_MEDIA',
    CAST(Idade AS INT) AS 'IDADE_TRABALHADOR',
    CASE 
        WHEN TRIM(Município) IS NULL OR TRIM(Município) = '' THEN -1
        ELSE CAST(TRIM(Município) AS INT)
    END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
    CASE 
        WHEN TRIM(Nacionalidade) IS NULL OR TRIM(Nacionalidade) = '' THEN -1
        ELSE CAST(TRIM(Nacionalidade) AS INT)
    END AS 'COD_NACIONALIDADE',
    CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
    CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2017_RS2017]
WHERE Município <> 'Município'
  AND substr(Município, 1, 2) = '43'
UNION ALL
SELECT
    CASE 
        WHEN TRIM("CBO Ocupação 2002") IS NULL OR TRIM("CBO Ocupação 2002") = '' THEN -1
        ELSE CAST(TRIM("CBO Ocupação 2002") AS INT)
    END AS 'COD_OCUPACAO',
    CASE 
        WHEN TRIM("CNAE 2.0 Subclasse") IS NULL OR TRIM("CNAE 2.0 Subclasse") = '' THEN -1
        ELSE CAST(TRIM("CNAE 2.0 Subclasse") AS INT)
    END AS 'COD_SUBCLASSE',
    CASE 
        WHEN TRIM("Escolaridade após 2005") IS NULL OR TRIM("Escolaridade após 2005") = '' THEN -1
        ELSE CAST(TRIM("Escolaridade após 2005") AS INT)
    END AS 'COD_GRAU_INSTRUCAO',
    CASE 
        WHEN TRIM("Faixa Etária") IS NULL OR TRIM("Faixa Etária") = '' THEN -1
        ELSE CAST(TRIM("Faixa Etária") AS INT)
    END AS 'COD_FAIXA_ETARIA',
    CASE 
        WHEN TRIM("Faixa Hora Contrat") IS NULL OR TRIM("Faixa Hora Contrat") = '' THEN -1
        ELSE CAST(TRIM("Faixa Hora Contrat") AS INT)
    END AS 'COD_FAIXA_HORA_CONTRATUAL',
    CASE 
        WHEN TRIM("Faixa Remun Dezem (SM)") IS NULL OR TRIM("Faixa Remun Dezem (SM)") = '' OR TRIM("Faixa Remun Dezem (SM)") = '99' THEN -1
        ELSE CAST(TRIM("Faixa Remun Dezem (SM)") AS INT)
    END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
    CASE 
        WHEN TRIM("Faixa Remun Média (SM)") IS NULL OR TRIM("Faixa Remun Média (SM)") = '' OR TRIM("Faixa Remun Média (SM)") = '99' THEN -1
        ELSE CAST(TRIM("Faixa Remun Média (SM)") AS INT)
    END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
    CASE 
        WHEN TRIM("Faixa Tempo Emprego") IS NULL OR TRIM("Faixa Tempo Emprego") = '' THEN -1
        ELSE CAST(TRIM("Faixa Tempo Emprego") AS INT)
    END AS 'COD_FAIXA_TEMPO_EMPREGO',
    CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
    CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
    2016 AS 'ANO_RAIS',
    CASE 
        WHEN "Mês Admissão" IS NULL OR "Mês Admissão" = 0 THEN DATE('1900-01-01')
        ELSE DATE(2016 || '-' || "Mês Admissão" || '-28')
    END AS 'DATA_ADMISSAO',               
    CASE 
        WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN DATE('1900-01-01')
        ELSE DATE(2016 || '-' || "Mês Desligamento" || '-28')
    END AS 'DATA_DEMISSAO',  
    CASE 
        WHEN TRIM("Motivo Desligamento") IS NULL OR TRIM("Motivo Desligamento") = '' THEN -1
        ELSE CAST(TRIM("Motivo Desligamento") AS INT)
    END AS 'COD_MOTIVO_DESLIGAMENTO',
    CASE 
        WHEN TRIM("Mun Trab") IS NULL OR TRIM("Mun Trab") = '' THEN -1
        ELSE CAST(TRIM("Mun Trab") AS INT)
    END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
    CASE 
        WHEN TRIM("Natureza Jurídica") IS NULL OR TRIM("Natureza Jurídica") = '' THEN -1
        ELSE CAST(TRIM("Natureza Jurídica") AS INT)
    END AS 'COD_NATUREZA_JURIDICA',
    CAST("Qtd Hora Contr" AS INT) AS 'QTD_HORAS_CONTRATUAIS',
    CASE 
        WHEN TRIM("Raça Cor") IS NULL OR TRIM("Raça Cor") = '' THEN -1
        ELSE CAST(TRIM("Raça Cor") AS INT)
    END AS 'COD_RACA_COR',
    CASE 
        WHEN TRIM("Sexo Trabalhador") IS NULL OR TRIM("Sexo Trabalhador") = '' THEN -1
        ELSE CAST(TRIM("Sexo Trabalhador") AS INT)
    END AS 'COD_SEXO_TRABALHADOR',
    CASE 
        WHEN TRIM("Tamanho Estabelecimento") IS NULL OR TRIM("Tamanho Estabelecimento") = '' THEN -1
        ELSE CAST(TRIM("Tamanho Estabelecimento") AS INT)
    END AS 'COD_TAMANHO_ESTABELECIMENTO',
    CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT) AS 'TEMPO_EMPREGADO',
    CASE 
        WHEN TRIM("Tipo Admissão") IS NULL OR TRIM("Tipo Admissão") = '' THEN -1
        ELSE CAST(TRIM("Tipo Admissão") AS INT)
    END AS 'COD_TIPO_ADMISSAO',
    CASE 
        WHEN TRIM("Tipo Defic") IS NULL OR TRIM("Tipo Defic") = '' THEN -1
        ELSE CAST(TRIM("Tipo Defic") AS INT)
    END AS 'COD_TIPO_DEFICIENCIA',
    CASE 
        WHEN TRIM("Tipo Vínculo") IS NULL OR TRIM("Tipo Vínculo") = '' THEN -1
        ELSE CAST(TRIM("Tipo Vínculo") AS INT)
    END AS 'COD_TIPO_EMPREGATICIO',
    CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
    CASE 
        WHEN TRIM("Vl Remun Dezembro (SM)") IS NULL OR TRIM("Vl Remun Dezembro (SM)") = '' THEN -1
        ELSE CAST(TRIM("Vl Remun Dezembro (SM)") AS INT)
    END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
    CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT) AS 'VALOR_REMUNERACAO_DEZEMBRO',
    CASE 
        WHEN TRIM("Vl Remun Média (SM)") IS NULL OR TRIM("Vl Remun Média (SM)") = '' THEN -1
        ELSE CAST(TRIM("Vl Remun Média (SM)") AS INT)
    END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
    CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT) AS 'VALOR_REMUNERACAO_MEDIA',
    CAST(Idade AS INT) AS 'IDADE_TRABALHADOR',
    CASE 
        WHEN TRIM(Município) IS NULL OR TRIM(Município) = '' THEN -1
        ELSE CAST(TRIM(Município) AS INT)
    END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
    CASE 
        WHEN TRIM(Nacionalidade) IS NULL OR TRIM(Nacionalidade) = '' THEN -1
        ELSE CAST(TRIM(Nacionalidade) AS INT)
    END AS 'COD_NACIONALIDADE',
    CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
    CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2016_RS2016]
WHERE Município <> 'Município'
  AND substr(Município, 1, 2) = '43'
UNION ALL
SELECT
    CASE 
        WHEN TRIM("CBO Ocupação 2002") IS NULL OR TRIM("CBO Ocupação 2002") = '' THEN -1
        ELSE CAST(TRIM("CBO Ocupação 2002") AS INT)
    END AS 'COD_OCUPACAO',
    CASE 
        WHEN TRIM("CNAE 2.0 Subclasse") IS NULL OR TRIM("CNAE 2.0 Subclasse") = '' THEN -1
        ELSE CAST(TRIM("CNAE 2.0 Subclasse") AS INT)
    END AS 'COD_SUBCLASSE',
    CASE 
        WHEN TRIM("Escolaridade após 2005") IS NULL OR TRIM("Escolaridade após 2005") = '' THEN -1
        ELSE CAST(TRIM("Escolaridade após 2005") AS INT)
    END AS 'COD_GRAU_INSTRUCAO',
    CASE 
        WHEN TRIM("Faixa Etária") IS NULL OR TRIM("Faixa Etária") = '' THEN -1
        ELSE CAST(TRIM("Faixa Etária") AS INT)
    END AS 'COD_FAIXA_ETARIA',
    CASE 
        WHEN TRIM("Faixa Hora Contrat") IS NULL OR TRIM("Faixa Hora Contrat") = '' THEN -1
        ELSE CAST(TRIM("Faixa Hora Contrat") AS INT)
    END AS 'COD_FAIXA_HORA_CONTRATUAL',
    CASE 
        WHEN TRIM("Faixa Remun Dezem (SM)") IS NULL OR TRIM("Faixa Remun Dezem (SM)") = '' OR TRIM("Faixa Remun Dezem (SM)") = '99' THEN -1
        ELSE CAST(TRIM("Faixa Remun Dezem (SM)") AS INT)
    END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
    CASE 
        WHEN TRIM("Faixa Remun Média (SM)") IS NULL OR TRIM("Faixa Remun Média (SM)") = '' OR TRIM("Faixa Remun Média (SM)") = '99' THEN -1
        ELSE CAST(TRIM("Faixa Remun Média (SM)") AS INT)
    END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
    CASE 
        WHEN TRIM("Faixa Tempo Emprego") IS NULL OR TRIM("Faixa Tempo Emprego") = '' THEN -1
        ELSE CAST(TRIM("Faixa Tempo Emprego") AS INT)
    END AS 'COD_FAIXA_TEMPO_EMPREGO',
    CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
    CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
    2015 AS 'ANO_RAIS',
    CASE 
        WHEN "Mês Admissão" IS NULL OR "Mês Admissão" = 0 THEN DATE('1900-01-01')
        ELSE DATE(2015 || '-' || "Mês Admissão" || '-28')
    END AS 'DATA_ADMISSAO',               
    CASE 
        WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN DATE('1900-01-01')
        ELSE DATE(2015 || '-' || "Mês Desligamento" || '-28')
    END AS 'DATA_DEMISSAO',  
    CASE 
        WHEN TRIM("Motivo Desligamento") IS NULL OR TRIM("Motivo Desligamento") = '' THEN -1
        ELSE CAST(TRIM("Motivo Desligamento") AS INT)
    END AS 'COD_MOTIVO_DESLIGAMENTO',
    CASE 
        WHEN TRIM("Mun Trab") IS NULL OR TRIM("Mun Trab") = '' THEN -1
        ELSE CAST(TRIM("Mun Trab") AS INT)
    END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
    CASE 
        WHEN TRIM("Natureza Jurídica") IS NULL OR TRIM("Natureza Jurídica") = '' THEN -1
        ELSE CAST(TRIM("Natureza Jurídica") AS INT)
    END AS 'COD_NATUREZA_JURIDICA',
    CAST("Qtd Hora Contr" AS INT) AS 'QTD_HORAS_CONTRATUAIS',
    CASE 
        WHEN TRIM("Raça Cor") IS NULL OR TRIM("Raça Cor") = '' THEN -1
        ELSE CAST(TRIM("Raça Cor") AS INT)
    END AS 'COD_RACA_COR',
    CASE 
        WHEN TRIM("Sexo Trabalhador") IS NULL OR TRIM("Sexo Trabalhador") = '' THEN -1
        ELSE CAST(TRIM("Sexo Trabalhador") AS INT)
    END AS 'COD_SEXO_TRABALHADOR',
    CASE 
        WHEN TRIM("Tamanho Estabelecimento") IS NULL OR TRIM("Tamanho Estabelecimento") = '' THEN -1
        ELSE CAST(TRIM("Tamanho Estabelecimento") AS INT)
    END AS 'COD_TAMANHO_ESTABELECIMENTO',
    CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT) AS 'TEMPO_EMPREGADO',
    CASE 
        WHEN TRIM("Tipo Admissão") IS NULL OR TRIM("Tipo Admissão") = '' THEN -1
        ELSE CAST(TRIM("Tipo Admissão") AS INT)
    END AS 'COD_TIPO_ADMISSAO',
    CASE 
        WHEN TRIM("Tipo Defic") IS NULL OR TRIM("Tipo Defic") = '' THEN -1
        ELSE CAST(TRIM("Tipo Defic") AS INT)
    END AS 'COD_TIPO_DEFICIENCIA',
    CASE 
        WHEN TRIM("Tipo Vínculo") IS NULL OR TRIM("Tipo Vínculo") = '' THEN -1
        ELSE CAST(TRIM("Tipo Vínculo") AS INT)
    END AS 'COD_TIPO_EMPREGATICIO',
    CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
    CASE 
        WHEN TRIM("Vl Remun Dezembro (SM)") IS NULL OR TRIM("Vl Remun Dezembro (SM)") = '' THEN -1
        ELSE CAST(TRIM("Vl Remun Dezembro (SM)") AS INT)
    END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
    CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT) AS 'VALOR_REMUNERACAO_DEZEMBRO',
    CASE 
        WHEN TRIM("Vl Remun Média (SM)") IS NULL OR TRIM("Vl Remun Média (SM)") = '' THEN -1
        ELSE CAST(TRIM("Vl Remun Média (SM)") AS INT)
    END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
    CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT) AS 'VALOR_REMUNERACAO_MEDIA',
    CAST(Idade AS INT) AS 'IDADE_TRABALHADOR',
    CASE 
        WHEN TRIM(Município) IS NULL OR TRIM(Município) = '' THEN -1
        ELSE CAST(TRIM(Município) AS INT)
    END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
    CASE 
        WHEN TRIM(Nacionalidade) IS NULL OR TRIM(Nacionalidade) = '' THEN -1
        ELSE CAST(TRIM(Nacionalidade) AS INT)
    END AS 'COD_NACIONALIDADE',
    CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
    CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2015_RS2015]
WHERE Município <> 'Município'
  AND substr(Município, 1, 2) = '43'
UNION ALL
SELECT
    CASE 
        WHEN TRIM("CBO Ocupação 2002") IS NULL OR TRIM("CBO Ocupação 2002") = '' THEN -1
        ELSE CAST(TRIM("CBO Ocupação 2002") AS INT)
    END AS 'COD_OCUPACAO',
    CASE 
        WHEN TRIM("CNAE 2.0 Subclasse") IS NULL OR TRIM("CNAE 2.0 Subclasse") = '' THEN -1
        ELSE CAST(TRIM("CNAE 2.0 Subclasse") AS INT)
    END AS 'COD_SUBCLASSE',
    CASE 
        WHEN TRIM("Escolaridade após 2005") IS NULL OR TRIM("Escolaridade após 2005") = '' THEN -1
        ELSE CAST(TRIM("Escolaridade após 2005") AS INT)
    END AS 'COD_GRAU_INSTRUCAO',
    CASE 
        WHEN TRIM("Faixa Etária") IS NULL OR TRIM("Faixa Etária") = '' THEN -1
        ELSE CAST(TRIM("Faixa Etária") AS INT)
    END AS 'COD_FAIXA_ETARIA',
    CASE 
        WHEN TRIM("Faixa Hora Contrat") IS NULL OR TRIM("Faixa Hora Contrat") = '' THEN -1
        ELSE CAST(TRIM("Faixa Hora Contrat") AS INT)
    END AS 'COD_FAIXA_HORA_CONTRATUAL',
    CASE 
        WHEN TRIM("Faixa Remun Dezem (SM)") IS NULL OR TRIM("Faixa Remun Dezem (SM)") = '' OR TRIM("Faixa Remun Dezem (SM)") = '99' THEN -1
        ELSE CAST(TRIM("Faixa Remun Dezem (SM)") AS INT)
    END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
    CASE 
        WHEN TRIM("Faixa Remun Média (SM)") IS NULL OR TRIM("Faixa Remun Média (SM)") = '' OR TRIM("Faixa Remun Média (SM)") = '99' THEN -1
        ELSE CAST(TRIM("Faixa Remun Média (SM)") AS INT)
    END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
    CASE 
        WHEN TRIM("Faixa Tempo Emprego") IS NULL OR TRIM("Faixa Tempo Emprego") = '' THEN -1
        ELSE CAST(TRIM("Faixa Tempo Emprego") AS INT)
    END AS 'COD_FAIXA_TEMPO_EMPREGO',
    CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
    CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
    2014 AS 'ANO_RAIS',
    CASE 
        WHEN "Mês Admissão" IS NULL OR "Mês Admissão" = 0 THEN DATE('1900-01-01')
        ELSE DATE(2014 || '-' || "Mês Admissão" || '-28')
    END AS 'DATA_ADMISSAO',               
    CASE 
        WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN DATE('1900-01-01')
        ELSE DATE(2014 || '-' || "Mês Desligamento" || '-28')
    END AS 'DATA_DEMISSAO',  
    CASE 
        WHEN TRIM("Motivo Desligamento") IS NULL OR TRIM("Motivo Desligamento") = '' THEN -1
        ELSE CAST(TRIM("Motivo Desligamento") AS INT)
    END AS 'COD_MOTIVO_DESLIGAMENTO',
    CASE 
        WHEN TRIM("Mun Trab") IS NULL OR TRIM("Mun Trab") = '' THEN -1
        ELSE CAST(TRIM("Mun Trab") AS INT)
    END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
    CASE 
        WHEN TRIM("Natureza Jurídica") IS NULL OR TRIM("Natureza Jurídica") = '' THEN -1
        ELSE CAST(TRIM("Natureza Jurídica") AS INT)
    END AS 'COD_NATUREZA_JURIDICA',
    CAST("Qtd Hora Contr" AS INT) AS 'QTD_HORAS_CONTRATUAIS',
    CASE 
        WHEN TRIM("Raça Cor") IS NULL OR TRIM("Raça Cor") = '' THEN -1
        ELSE CAST(TRIM("Raça Cor") AS INT)
    END AS 'COD_RACA_COR',
    CASE 
        WHEN TRIM("Sexo Trabalhador") IS NULL OR TRIM("Sexo Trabalhador") = '' THEN -1
        ELSE CAST(TRIM("Sexo Trabalhador") AS INT)
    END AS 'COD_SEXO_TRABALHADOR',
    CASE 
        WHEN TRIM("Tamanho Estabelecimento") IS NULL OR TRIM("Tamanho Estabelecimento") = '' THEN -1
        ELSE CAST(TRIM("Tamanho Estabelecimento") AS INT)
    END AS 'COD_TAMANHO_ESTABELECIMENTO',
    CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT) AS 'TEMPO_EMPREGADO',
    CASE 
        WHEN TRIM("Tipo Admissão") IS NULL OR TRIM("Tipo Admissão") = '' THEN -1
        ELSE CAST(TRIM("Tipo Admissão") AS INT)
    END AS 'COD_TIPO_ADMISSAO',
    CASE 
        WHEN TRIM("Tipo Defic") IS NULL OR TRIM("Tipo Defic") = '' THEN -1
        ELSE CAST(TRIM("Tipo Defic") AS INT)
    END AS 'COD_TIPO_DEFICIENCIA',
    CASE 
        WHEN TRIM("Tipo Vínculo") IS NULL OR TRIM("Tipo Vínculo") = '' THEN -1
        ELSE CAST(TRIM("Tipo Vínculo") AS INT)
    END AS 'COD_TIPO_EMPREGATICIO',
    CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
    CASE 
        WHEN TRIM("Vl Remun Dezembro (SM)") IS NULL OR TRIM("Vl Remun Dezembro (SM)") = '' THEN -1
        ELSE CAST(TRIM("Vl Remun Dezembro (SM)") AS INT)
    END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
    CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT) AS 'VALOR_REMUNERACAO_DEZEMBRO',
    CASE 
        WHEN TRIM("Vl Remun Média (SM)") IS NULL OR TRIM("Vl Remun Média (SM)") = '' THEN -1
        ELSE CAST(TRIM("Vl Remun Média (SM)") AS INT)
    END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
    CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT) AS 'VALOR_REMUNERACAO_MEDIA',
    CAST(Idade AS INT) AS 'IDADE_TRABALHADOR',
    CASE 
        WHEN TRIM(Município) IS NULL OR TRIM(Município) = '' THEN -1
        ELSE CAST(TRIM(Município) AS INT)
    END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
    CASE 
        WHEN TRIM(Nacionalidade) IS NULL OR TRIM(Nacionalidade) = '' THEN -1
        ELSE CAST(TRIM(Nacionalidade) AS INT)
    END AS 'COD_NACIONALIDADE',
    CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
    CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2014_RS2014]
WHERE Município <> 'Município'
  AND substr(Município, 1, 2) = '43'
UNION ALL
SELECT
    CASE 
        WHEN TRIM("CBO Ocupação 2002") IS NULL OR TRIM("CBO Ocupação 2002") = '' THEN -1
        ELSE CAST(TRIM("CBO Ocupação 2002") AS INT)
    END AS 'COD_OCUPACAO',
    CASE 
        WHEN TRIM("CNAE 2.0 Subclasse") IS NULL OR TRIM("CNAE 2.0 Subclasse") = '' THEN -1
        ELSE CAST(TRIM("CNAE 2.0 Subclasse") AS INT)
    END AS 'COD_SUBCLASSE',
    CASE 
        WHEN TRIM("Escolaridade após 2005") IS NULL OR TRIM("Escolaridade após 2005") = '' THEN -1
        ELSE CAST(TRIM("Escolaridade após 2005") AS INT)
    END AS 'COD_GRAU_INSTRUCAO',
    CASE 
        WHEN TRIM("Faixa Etária") IS NULL OR TRIM("Faixa Etária") = '' THEN -1
        ELSE CAST(TRIM("Faixa Etária") AS INT)
    END AS 'COD_FAIXA_ETARIA',
    CASE 
        WHEN TRIM("Faixa Hora Contrat") IS NULL OR TRIM("Faixa Hora Contrat") = '' THEN -1
        ELSE CAST(TRIM("Faixa Hora Contrat") AS INT)
    END AS 'COD_FAIXA_HORA_CONTRATUAL',
    CASE 
        WHEN TRIM("Faixa Remun Dezem (SM)") IS NULL OR TRIM("Faixa Remun Dezem (SM)") = '' OR TRIM("Faixa Remun Dezem (SM)") = '99' THEN -1
        ELSE CAST(TRIM("Faixa Remun Dezem (SM)") AS INT)
    END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
    CASE 
        WHEN TRIM("Faixa Remun Média (SM)") IS NULL OR TRIM("Faixa Remun Média (SM)") = '' OR TRIM("Faixa Remun Média (SM)") = '99' THEN -1
        ELSE CAST(TRIM("Faixa Remun Média (SM)") AS INT)
    END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
    CASE 
        WHEN TRIM("Faixa Tempo Emprego") IS NULL OR TRIM("Faixa Tempo Emprego") = '' THEN -1
        ELSE CAST(TRIM("Faixa Tempo Emprego") AS INT)
    END AS 'COD_FAIXA_TEMPO_EMPREGO',
    CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
    CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
    2013 AS 'ANO_RAIS',
    CASE 
        WHEN "Mês Admissão" IS NULL OR "Mês Admissão" = 0 THEN DATE('1900-01-01')
        ELSE DATE(2013 || '-' || "Mês Admissão" || '-28')
    END AS 'DATA_ADMISSAO',               
    CASE 
        WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN DATE('1900-01-01')
        ELSE DATE(2013 || '-' || "Mês Desligamento" || '-28')
    END AS 'DATA_DEMISSAO',  
    CASE 
        WHEN TRIM("Motivo Desligamento") IS NULL OR TRIM("Motivo Desligamento") = '' THEN -1
        ELSE CAST(TRIM("Motivo Desligamento") AS INT)
    END AS 'COD_MOTIVO_DESLIGAMENTO',
    CASE 
        WHEN TRIM("Mun Trab") IS NULL OR TRIM("Mun Trab") = '' THEN -1
        ELSE CAST(TRIM("Mun Trab") AS INT)
    END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
    CASE 
        WHEN TRIM("Natureza Jurídica") IS NULL OR TRIM("Natureza Jurídica") = '' THEN -1
        ELSE CAST(TRIM("Natureza Jurídica") AS INT)
    END AS 'COD_NATUREZA_JURIDICA',
    CAST("Qtd Hora Contr" AS INT) AS 'QTD_HORAS_CONTRATUAIS',
    CASE 
        WHEN TRIM("Raça Cor") IS NULL OR TRIM("Raça Cor") = '' THEN -1
        ELSE CAST(TRIM("Raça Cor") AS INT)
    END AS 'COD_RACA_COR',
    CASE 
        WHEN TRIM("Sexo Trabalhador") IS NULL OR TRIM("Sexo Trabalhador") = '' THEN -1
        ELSE CAST(TRIM("Sexo Trabalhador") AS INT)
    END AS 'COD_SEXO_TRABALHADOR',
    CASE 
        WHEN TRIM("Tamanho Estabelecimento") IS NULL OR TRIM("Tamanho Estabelecimento") = '' THEN -1
        ELSE CAST(TRIM("Tamanho Estabelecimento") AS INT)
    END AS 'COD_TAMANHO_ESTABELECIMENTO',
    CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT) AS 'TEMPO_EMPREGADO',
    CASE 
        WHEN TRIM("Tipo Admissão") IS NULL OR TRIM("Tipo Admissão") = '' THEN -1
        ELSE CAST(TRIM("Tipo Admissão") AS INT)
    END AS 'COD_TIPO_ADMISSAO',
    CASE 
        WHEN TRIM("Tipo Defic") IS NULL OR TRIM("Tipo Defic") = '' THEN -1
        ELSE CAST(TRIM("Tipo Defic") AS INT)
    END AS 'COD_TIPO_DEFICIENCIA',
    CASE 
        WHEN TRIM("Tipo Vínculo") IS NULL OR TRIM("Tipo Vínculo") = '' THEN -1
        ELSE CAST(TRIM("Tipo Vínculo") AS INT)
    END AS 'COD_TIPO_EMPREGATICIO',
    CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
    CASE 
        WHEN TRIM("Vl Remun Dezembro (SM)") IS NULL OR TRIM("Vl Remun Dezembro (SM)") = '' THEN -1
        ELSE CAST(TRIM("Vl Remun Dezembro (SM)") AS INT)
    END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
    CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT) AS 'VALOR_REMUNERACAO_DEZEMBRO',
    CASE 
        WHEN TRIM("Vl Remun Média (SM)") IS NULL OR TRIM("Vl Remun Média (SM)") = '' THEN -1
        ELSE CAST(TRIM("Vl Remun Média (SM)") AS INT)
    END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
    CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT) AS 'VALOR_REMUNERACAO_MEDIA',
    CAST(Idade AS INT) AS 'IDADE_TRABALHADOR',
    CASE 
        WHEN TRIM(Município) IS NULL OR TRIM(Município) = '' THEN -1
        ELSE CAST(TRIM(Município) AS INT)
    END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
    CASE 
        WHEN TRIM(Nacionalidade) IS NULL OR TRIM(Nacionalidade) = '' THEN -1
        ELSE CAST(TRIM(Nacionalidade) AS INT)
    END AS 'COD_NACIONALIDADE',
    CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
    CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2013_RS2013]
WHERE Município <> 'Município'
  AND substr(Município, 1, 2) = '43'
UNION ALL
SELECT
    CASE 
        WHEN TRIM("CBO Ocupação 2002") IS NULL OR TRIM("CBO Ocupação 2002") = '' THEN -1
        ELSE CAST(TRIM("CBO Ocupação 2002") AS INT)
    END AS 'COD_OCUPACAO',
    CASE 
        WHEN TRIM("CNAE 2.0 Subclasse") IS NULL OR TRIM("CNAE 2.0 Subclasse") = '' THEN -1
        ELSE CAST(TRIM("CNAE 2.0 Subclasse") AS INT)
    END AS 'COD_SUBCLASSE',
    CASE 
        WHEN TRIM("Escolaridade após 2005") IS NULL OR TRIM("Escolaridade após 2005") = '' THEN -1
        ELSE CAST(TRIM("Escolaridade após 2005") AS INT)
    END AS 'COD_GRAU_INSTRUCAO',
    CASE 
        WHEN TRIM("Faixa Etária") IS NULL OR TRIM("Faixa Etária") = '' THEN -1
        ELSE CAST(TRIM("Faixa Etária") AS INT)
    END AS 'COD_FAIXA_ETARIA',
    CASE 
        WHEN TRIM("Faixa Hora Contrat") IS NULL OR TRIM("Faixa Hora Contrat") = '' THEN -1
        ELSE CAST(TRIM("Faixa Hora Contrat") AS INT)
    END AS 'COD_FAIXA_HORA_CONTRATUAL',
    CASE 
        WHEN TRIM("Faixa Remun Dezem (SM)") IS NULL OR TRIM("Faixa Remun Dezem (SM)") = '' OR TRIM("Faixa Remun Dezem (SM)") = '99' THEN -1
        ELSE CAST(TRIM("Faixa Remun Dezem (SM)") AS INT)
    END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
    CASE 
        WHEN TRIM("Faixa Remun Média (SM)") IS NULL OR TRIM("Faixa Remun Média (SM)") = '' OR TRIM("Faixa Remun Média (SM)") = '99' THEN -1
        ELSE CAST(TRIM("Faixa Remun Média (SM)") AS INT)
    END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
    CASE 
        WHEN TRIM("Faixa Tempo Emprego") IS NULL OR TRIM("Faixa Tempo Emprego") = '' THEN -1
        ELSE CAST(TRIM("Faixa Tempo Emprego") AS INT)
    END AS 'COD_FAIXA_TEMPO_EMPREGO',
    CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
    CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
    2012 AS 'ANO_RAIS',
    CASE 
        WHEN "Mês Admissão" IS NULL OR "Mês Admissão" = 0 THEN DATE('1900-01-01')
        ELSE DATE(2012 || '-' || "Mês Admissão" || '-28')
    END AS 'DATA_ADMISSAO',               
    CASE 
        WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN DATE('1900-01-01')
        ELSE DATE(2012 || '-' || "Mês Desligamento" || '-28')
    END AS 'DATA_DEMISSAO',  
    CASE 
        WHEN TRIM("Motivo Desligamento") IS NULL OR TRIM("Motivo Desligamento") = '' THEN -1
        ELSE CAST(TRIM("Motivo Desligamento") AS INT)
    END AS 'COD_MOTIVO_DESLIGAMENTO',
    CASE 
        WHEN TRIM("Mun Trab") IS NULL OR TRIM("Mun Trab") = '' THEN -1
        ELSE CAST(TRIM("Mun Trab") AS INT)
    END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
    CASE 
        WHEN TRIM("Natureza Jurídica") IS NULL OR TRIM("Natureza Jurídica") = '' THEN -1
        ELSE CAST(TRIM("Natureza Jurídica") AS INT)
    END AS 'COD_NATUREZA_JURIDICA',
    CAST("Qtd Hora Contr" AS INT) AS 'QTD_HORAS_CONTRATUAIS',
    CASE 
        WHEN TRIM("Raça Cor") IS NULL OR TRIM("Raça Cor") = '' THEN -1
        ELSE CAST(TRIM("Raça Cor") AS INT)
    END AS 'COD_RACA_COR',
    CASE 
        WHEN TRIM("Sexo Trabalhador") IS NULL OR TRIM("Sexo Trabalhador") = '' THEN -1
        ELSE CAST(TRIM("Sexo Trabalhador") AS INT)
    END AS 'COD_SEXO_TRABALHADOR',
    CASE 
        WHEN TRIM("Tamanho Estabelecimento") IS NULL OR TRIM("Tamanho Estabelecimento") = '' THEN -1
        ELSE CAST(TRIM("Tamanho Estabelecimento") AS INT)
    END AS 'COD_TAMANHO_ESTABELECIMENTO',
    CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT) AS 'TEMPO_EMPREGADO',
    CASE 
        WHEN TRIM("Tipo Admissão") IS NULL OR TRIM("Tipo Admissão") = '' THEN -1
        ELSE CAST(TRIM("Tipo Admissão") AS INT)
    END AS 'COD_TIPO_ADMISSAO',
    CASE 
        WHEN TRIM("Tipo Defic") IS NULL OR TRIM("Tipo Defic") = '' THEN -1
        ELSE CAST(TRIM("Tipo Defic") AS INT)
    END AS 'COD_TIPO_DEFICIENCIA',
    CASE 
        WHEN TRIM("Tipo Vínculo") IS NULL OR TRIM("Tipo Vínculo") = '' THEN -1
        ELSE CAST(TRIM("Tipo Vínculo") AS INT)
    END AS 'COD_TIPO_EMPREGATICIO',
    CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
    CASE 
        WHEN TRIM("Vl Remun Dezembro (SM)") IS NULL OR TRIM("Vl Remun Dezembro (SM)") = '' THEN -1
        ELSE CAST(TRIM("Vl Remun Dezembro (SM)") AS INT)
    END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
    CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT) AS 'VALOR_REMUNERACAO_DEZEMBRO',
    CASE 
        WHEN TRIM("Vl Remun Média (SM)") IS NULL OR TRIM("Vl Remun Média (SM)") = '' THEN -1
        ELSE CAST(TRIM("Vl Remun Média (SM)") AS INT)
    END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
    CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT) AS 'VALOR_REMUNERACAO_MEDIA',
    CAST(Idade AS INT) AS 'IDADE_TRABALHADOR',
    CASE 
        WHEN TRIM(Município) IS NULL OR TRIM(Município) = '' THEN -1
        ELSE CAST(TRIM(Município) AS INT)
    END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
    CASE 
        WHEN TRIM(Nacionalidade) IS NULL OR TRIM(Nacionalidade) = '' THEN -1
        ELSE CAST(TRIM(Nacionalidade) AS INT)
    END AS 'COD_NACIONALIDADE',
    CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
    CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2012_RS2012]
WHERE Município <> 'Município'
  AND substr(Município, 1, 2) = '43'
