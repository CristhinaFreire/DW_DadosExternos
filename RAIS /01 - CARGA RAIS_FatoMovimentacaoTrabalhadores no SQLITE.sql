--CARGA DA FATO RAIS_FatoMovimentacaoTrabalhadores, CADA SELECT É REFERENTE A UM ANO
--SÓ INCLUÍ A DESCRIÇÃO DE CADA COLUNA NO PRIMEIRO SELECT, POIS O RESTANTE DAS TABELAS OS MESMOS DADOS
--2022
DROP TABLE IF EXISTS RAIS_FatoMovimentacaoTrabalhadores;
CREATE TABLE RAIS_FatoMovimentacaoTrabalhadores AS 
SELECT
CASE  WHEN NULLIF(CAST(TRIM("CBO Ocupação 2002") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CBO Ocupação 2002" AS INT) END AS 'COD_OCUPACAO',															--Código da ocupação na CBO
CASE  WHEN NULLIF(CAST(TRIM("CNAE 2.0 Subclasse") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CNAE 2.0 Subclasse" AS INT) END AS 'COD_SUBCLASSE',                                                         --Código da subclasse da CNAE
CASE  WHEN NULLIF(CAST(TRIM("Escolaridade após 2005") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Escolaridade após 2005" AS INT) END AS 'COD_GRAU_INSTRUCAO',                                            --Grau de instrução
CASE  WHEN NULLIF(CAST(TRIM("Faixa Etária") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Etária" AS INT) END AS 'COD_FAIXA_ETARIA',                                                                  --Faixa Etaria do trabalhador
CASE  WHEN NULLIF(CAST(TRIM("Faixa Hora Contrat") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Hora Contrat" AS INT) END AS 'COD_FAIXA_HORA_CONTRATUAL',                                             --Faixa de horas contratuais
CASE  WHEN TRIM("Faixa Remun Dezem (SM)")  IS NULL OR TRIM("Faixa Remun Dezem (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Dezem (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',    --Faixa de remuneração media de dezembro do trabalhador em salarios minimos
CASE  WHEN TRIM("Faixa Remun Média (SM)")  IS NULL OR TRIM("Faixa Remun Média (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Média (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',         --Faixa de remuneração media do ano do trabalhador em salarios minimos
CASE  WHEN NULLIF(CAST(TRIM("Faixa Tempo Emprego") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Tempo Emprego" AS INT) END AS 'COD_FAIXA_TEMPO_EMPREGO',                                             --Faixa de tempo de emprego
CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',                                                                                                         --Indicador se o empregado/servidor de portador de deficiência habilitado ou beneficiário reabilitado
CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',                                                                                                        --Indicador de optante pelo SIMPLES - a partir de 2001
2022 AS 'ANO_RAIS',                                                                                                                                                                                     --Ano da RAIS
CASE WHEN "Mês Admissão" IS NULL OR "Mês Admissão"  = 0 THEN 01/01/1900 ELSE DATE(2022 || '-' || "Mês Admissão" || '-28')  END AS 'DATA_ADMISSAO',                                                            --Mês de admissão
CASE WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN 01/01/1900 ELSE DATE(2022 || '-' || "Mês Desligamento" || '-28')  END AS 'DATA_DEMISSAO',                                               	--Mês de desligamento
CASE  WHEN NULLIF(CAST(TRIM("Motivo Desligamento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Motivo Desligamento" AS INT) END AS 'COD_MOTIVO_DESLIGAMENTO',                                             --Motivo do desligamento
CASE  WHEN NULLIF(CAST(TRIM("Mun Trab") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Mun Trab" AS INT) END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',                                                            --Município onde o empregado esteja trabalhando ou prestando serviço - a partir de 2002
CASE  WHEN NULLIF(CAST(TRIM("Natureza Jurídica") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Natureza Jurídica" AS INT) END AS 'COD_NATUREZA_JURIDICA',                                                   --Natureza Jurídica (CONCLA/2002)
CAST("Qtd Hora Contr" AS INT)  AS 'QTD_HORAS_CONTRATUAIS',                                                                                                                                              --Quantidade de horas contratuais por semana
CASE  WHEN NULLIF(CAST(TRIM("Raça Cor") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Raça Cor" AS INT) END AS 'COD_RACA_COR',                                                                              --Raça e Cor do Trabalhador
CASE  WHEN NULLIF(CAST(TRIM("Sexo Trabalhador") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Sexo Trabalhador" AS INT) END AS 'COD_SEXO_TRABALHADOR',                                                      --Sexo do trabalhador
CASE  WHEN NULLIF(CAST(TRIM("Tamanho Estabelecimento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tamanho Estabelecimento" AS INT) END AS 'COD_TAMANHO_ESTABELECIMENTO',                                 --Tamanho do estabelecimento - empregados ativos em 31/12 (10 categorias)
CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT)  AS 'TEMPO_EMPREGADO',                                                                                                                                  --Tempo de emprego do trabalhador (quando acumulada representa a soma dos meses)
CASE  WHEN NULLIF(CAST(TRIM("Tipo Admissão") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Admissão" AS INT) END AS 'COD_TIPO_ADMISSAO',                                                               --Tipo de admissão
CASE  WHEN NULLIF(CAST(TRIM("Tipo Defic") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Defic" AS INT) END AS 'COD_TIPO_DEFICIENCIA',                                                                  --Tipo de deficiência/Beneficiário habilitado
CASE  WHEN NULLIF(CAST(TRIM("Tipo Vínculo") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Vínculo" AS INT) END AS 'COD_TIPO_EMPREGATICIO',                                                             --Tipo de vínculo empregatício
CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',                                                                                                 --Indicador de vínculo ativo em 31/12
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Dezembro (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Dezembro (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',                             --Faixa de remuneração media de dezembro do trabalhador em salarios minimos
CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_DEZEMBRO',                                                                                                               --Valor nominal do salário de dezembro do trabalhador
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Média (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Média (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',                                        --Faixa de remuneração media do ano do trabalhador em salarios minimos
CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_MEDIA',                                                                                                                     --Valor nominal do salário médio do trabalhador
CAST(Idade AS INT)  AS 'IDADE_TRABALHADOR',                                                                                                                                                             --Idade do trabalhador
CASE  WHEN NULLIF(CAST(TRIM(Município) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Município AS INT) END AS 'COD_MUNICIPIO_ESTABELECIMENTO',                                                               --Município de localização do estabelecimento
CASE  WHEN NULLIF(CAST(TRIM(Nacionalidade) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Nacionalidade AS INT) END AS 'COD_NACIONALIDADE',                                                                   --Nacionalidade do trabalhador
CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',                                                                                             --Indicador de movimentação referente a contrato intermitente (a partir de 2017)
CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'                                                                                                        --Indicador de movimentação referente a contrato parcial (a partir de 2017)
FROM [2022_RAIS_VINC_PUB_SUL]
WHERE Município <> 'Município' --ESTE FILTRO SE DÁ PELO MOTIVO DE O SCRIPT DE PYTHON CONSIDERAR O NOME DAS COLUNAS COMO A PRIMEIRA LINHA DOS TXT, ENTÃO É SÓ UM FILTRO PARA RETIRAR A PRIMEIRA LINHA DE CADA SELECT
UNION ALL

--2021
SELECT
CASE  WHEN NULLIF(CAST(TRIM("CBO Ocupação 2002") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CBO Ocupação 2002" AS INT) END AS 'COD_OCUPACAO',															
CASE  WHEN NULLIF(CAST(TRIM("CNAE 2.0 Subclasse") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CNAE 2.0 Subclasse" AS INT) END AS 'COD_SUBCLASSE',
CASE  WHEN NULLIF(CAST(TRIM("Escolaridade após 2005") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Escolaridade após 2005" AS INT) END AS 'COD_GRAU_INSTRUCAO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Etária") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Etária" AS INT) END AS 'COD_FAIXA_ETARIA',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Hora Contrat") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Hora Contrat" AS INT) END AS 'COD_FAIXA_HORA_CONTRATUAL',
CASE  WHEN TRIM("Faixa Remun Dezem (SM)")  IS NULL OR TRIM("Faixa Remun Dezem (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Dezem (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
CASE  WHEN TRIM("Faixa Remun Média (SM)")  IS NULL OR TRIM("Faixa Remun Média (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Média (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Tempo Emprego") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Tempo Emprego" AS INT) END AS 'COD_FAIXA_TEMPO_EMPREGO',
CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
2021 AS 'ANO_RAIS',
CASE WHEN "Mês Admissão" IS NULL OR "Mês Admissão"  = 0 THEN 01/01/1900 ELSE DATE(2021 || '-' || "Mês Admissão" || '-28')  END AS 'DATA_ADMISSAO',               
CASE WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN 01/01/1900 ELSE DATE(2021 || '-' || "Mês Desligamento" || '-28')  END AS 'DATA_DEMISSAO',  
CASE  WHEN NULLIF(CAST(TRIM("Motivo Desligamento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Motivo Desligamento" AS INT) END AS 'COD_MOTIVO_DESLIGAMENTO',
CASE  WHEN NULLIF(CAST(TRIM("Mun Trab") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Mun Trab" AS INT) END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
CASE  WHEN NULLIF(CAST(TRIM("Natureza Jurídica") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Natureza Jurídica" AS INT) END AS 'COD_NATUREZA_JURIDICA',
CAST("Qtd Hora Contr" AS INT)  AS 'QTD_HORAS_CONTRATUAIS',
CASE  WHEN NULLIF(CAST(TRIM("Raça Cor") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Raça Cor" AS INT) END AS 'COD_RACA_COR',
CASE  WHEN NULLIF(CAST(TRIM("Sexo Trabalhador") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Sexo Trabalhador" AS INT) END AS 'COD_SEXO_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM("Tamanho Estabelecimento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tamanho Estabelecimento" AS INT) END AS 'COD_TAMANHO_ESTABELECIMENTO',
CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT)  AS 'TEMPO_EMPREGADO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Admissão") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Admissão" AS INT) END AS 'COD_TIPO_ADMISSAO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Defic") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Defic" AS INT) END AS 'COD_TIPO_DEFICIENCIA',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Vínculo") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Vínculo" AS INT) END AS 'COD_TIPO_EMPREGATICIO',
CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Dezembro (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Dezembro (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Média (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Média (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_MEDIA',
CAST(Idade AS INT)  AS 'IDADE_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM(Município) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Município AS INT) END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
CASE  WHEN NULLIF(CAST(TRIM(Nacionalidade) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Nacionalidade AS INT) END AS 'COD_NACIONALIDADE',
CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2021_RAIS_VINC_PUB_SUL]
WHERE Município <> 'Município'
UNION ALL

--2020
SELECT
CASE  WHEN NULLIF(CAST(TRIM("CBO Ocupação 2002") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CBO Ocupação 2002" AS INT) END AS 'COD_OCUPACAO',
CASE  WHEN NULLIF(CAST(TRIM("CNAE 2.0 Subclasse") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CNAE 2.0 Subclasse" AS INT) END AS 'COD_SUBCLASSE',
CASE  WHEN NULLIF(CAST(TRIM("Escolaridade após 2005") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Escolaridade após 2005" AS INT) END AS 'COD_GRAU_INSTRUCAO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Etária") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Etária" AS INT) END AS 'COD_FAIXA_ETARIA',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Hora Contrat") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Hora Contrat" AS INT) END AS 'COD_FAIXA_HORA_CONTRATUAL',
CASE  WHEN TRIM("Faixa Remun Dezem (SM)")  IS NULL OR TRIM("Faixa Remun Dezem (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Dezem (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
CASE  WHEN TRIM("Faixa Remun Média (SM)")  IS NULL OR TRIM("Faixa Remun Média (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Média (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Tempo Emprego") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Tempo Emprego" AS INT) END AS 'COD_FAIXA_TEMPO_EMPREGO',
CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
2020 AS 'ANO_RAIS',
CASE WHEN "Mês Admissão" IS NULL OR "Mês Admissão"  = 0 THEN 01/01/1900 ELSE DATE(2020 || '-' || "Mês Admissão" || '-28')  END AS 'DATA_ADMISSAO',               
CASE WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN 01/01/1900 ELSE DATE(2020 || '-' || "Mês Desligamento" || '-28')  END AS 'DATA_DEMISSAO',  
CASE  WHEN NULLIF(CAST(TRIM("Motivo Desligamento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Motivo Desligamento" AS INT) END AS 'COD_MOTIVO_DESLIGAMENTO',
CASE  WHEN NULLIF(CAST(TRIM("Mun Trab") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Mun Trab" AS INT) END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
CASE  WHEN NULLIF(CAST(TRIM("Natureza Jurídica") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Natureza Jurídica" AS INT) END AS 'COD_NATUREZA_JURIDICA',
CAST("Qtd Hora Contr" AS INT)  AS 'QTD_HORAS_CONTRATUAIS',
CASE  WHEN NULLIF(CAST(TRIM("Raça Cor") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Raça Cor" AS INT) END AS 'COD_RACA_COR',
CASE  WHEN NULLIF(CAST(TRIM("Sexo Trabalhador") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Sexo Trabalhador" AS INT) END AS 'COD_SEXO_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM("Tamanho Estabelecimento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tamanho Estabelecimento" AS INT) END AS 'COD_TAMANHO_ESTABELECIMENTO',
CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT)  AS 'TEMPO_EMPREGADO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Admissão") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Admissão" AS INT) END AS 'COD_TIPO_ADMISSAO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Defic") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Defic" AS INT) END AS 'COD_TIPO_DEFICIENCIA',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Vínculo") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Vínculo" AS INT) END AS 'COD_TIPO_EMPREGATICIO',
CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Dezembro (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Dezembro (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Média (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Média (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_MEDIA',
CAST(Idade AS INT)  AS 'IDADE_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM(Município) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Município AS INT) END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
CASE  WHEN NULLIF(CAST(TRIM(Nacionalidade) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Nacionalidade AS INT) END AS 'COD_NACIONALIDADE',
CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2020_RAIS_VINC_PUB_SUL]
WHERE Município <> 'Município'
UNION ALL

--2019
SELECT
CASE  WHEN NULLIF(CAST(TRIM("CBO Ocupação 2002") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CBO Ocupação 2002" AS INT) END AS 'COD_OCUPACAO',
CASE  WHEN NULLIF(CAST(TRIM("CNAE 2.0 Subclasse") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CNAE 2.0 Subclasse" AS INT) END AS 'COD_SUBCLASSE',
CASE  WHEN NULLIF(CAST(TRIM("Escolaridade após 2005") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Escolaridade após 2005" AS INT) END AS 'COD_GRAU_INSTRUCAO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Etária") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Etária" AS INT) END AS 'COD_FAIXA_ETARIA',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Hora Contrat") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Hora Contrat" AS INT) END AS 'COD_FAIXA_HORA_CONTRATUAL',
CASE  WHEN TRIM("Faixa Remun Dezem (SM)")  IS NULL OR TRIM("Faixa Remun Dezem (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Dezem (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
CASE  WHEN TRIM("Faixa Remun Média (SM)")  IS NULL OR TRIM("Faixa Remun Média (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Média (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Tempo Emprego") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Tempo Emprego" AS INT) END AS 'COD_FAIXA_TEMPO_EMPREGO',
CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
2019 AS 'ANO_RAIS',
CASE WHEN "Mês Admissão" IS NULL OR "Mês Admissão"  = 0 THEN 01/01/1900 ELSE DATE(2019 || '-' || "Mês Admissão" || '-28')  END AS 'DATA_ADMISSAO',               
CASE WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN 01/01/1900 ELSE DATE(2019 || '-' || "Mês Desligamento" || '-28')  END AS 'DATA_DEMISSAO',  
CASE  WHEN NULLIF(CAST(TRIM("Motivo Desligamento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Motivo Desligamento" AS INT) END AS 'COD_MOTIVO_DESLIGAMENTO',
CASE  WHEN NULLIF(CAST(TRIM("Mun Trab") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Mun Trab" AS INT) END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
CASE  WHEN NULLIF(CAST(TRIM("Natureza Jurídica") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Natureza Jurídica" AS INT) END AS 'COD_NATUREZA_JURIDICA',
CAST("Qtd Hora Contr" AS INT)  AS 'QTD_HORAS_CONTRATUAIS',
CASE  WHEN NULLIF(CAST(TRIM("Raça Cor") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Raça Cor" AS INT) END AS 'COD_RACA_COR',
CASE  WHEN NULLIF(CAST(TRIM("Sexo Trabalhador") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Sexo Trabalhador" AS INT) END AS 'COD_SEXO_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM("Tamanho Estabelecimento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tamanho Estabelecimento" AS INT) END AS 'COD_TAMANHO_ESTABELECIMENTO',
CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT)  AS 'TEMPO_EMPREGADO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Admissão") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Admissão" AS INT) END AS 'COD_TIPO_ADMISSAO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Defic") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Defic" AS INT) END AS 'COD_TIPO_DEFICIENCIA',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Vínculo") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Vínculo" AS INT) END AS 'COD_TIPO_EMPREGATICIO',
CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Dezembro (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Dezembro (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Média (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Média (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_MEDIA',
CAST(Idade AS INT)  AS 'IDADE_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM(Município) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Município AS INT) END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
CASE  WHEN NULLIF(CAST(TRIM(Nacionalidade) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Nacionalidade AS INT) END AS 'COD_NACIONALIDADE',
CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2019_RAIS_VINC_PUB_SUL]
WHERE Município <> 'Município'
UNION ALL

--2018
SELECT
CASE  WHEN NULLIF(CAST(TRIM("CBO Ocupação 2002") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CBO Ocupação 2002" AS INT) END AS 'COD_OCUPACAO',
CASE  WHEN NULLIF(CAST(TRIM("CNAE 2.0 Subclasse") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CNAE 2.0 Subclasse" AS INT) END AS 'COD_SUBCLASSE',
CASE  WHEN NULLIF(CAST(TRIM("Escolaridade após 2005") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Escolaridade após 2005" AS INT) END AS 'COD_GRAU_INSTRUCAO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Etária") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Etária" AS INT) END AS 'COD_FAIXA_ETARIA',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Hora Contrat") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Hora Contrat" AS INT) END AS 'COD_FAIXA_HORA_CONTRATUAL',
CASE  WHEN TRIM("Faixa Remun Dezem (SM)")  IS NULL OR TRIM("Faixa Remun Dezem (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Dezem (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
CASE  WHEN TRIM("Faixa Remun Média (SM)")  IS NULL OR TRIM("Faixa Remun Média (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Média (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Tempo Emprego") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Tempo Emprego" AS INT) END AS 'COD_FAIXA_TEMPO_EMPREGO',
CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
2018 AS 'ANO_RAIS',
CASE WHEN "Mês Admissão" IS NULL OR "Mês Admissão"  = 0 THEN 01/01/1900 ELSE DATE(2018 || '-' || "Mês Admissão" || '-28')  END AS 'DATA_ADMISSAO',               
CASE WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN 01/01/1900 ELSE DATE(2018 || '-' || "Mês Desligamento" || '-28')  END AS 'DATA_DEMISSAO',  
CASE  WHEN NULLIF(CAST(TRIM("Motivo Desligamento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Motivo Desligamento" AS INT) END AS 'COD_MOTIVO_DESLIGAMENTO',
CASE  WHEN NULLIF(CAST(TRIM("Mun Trab") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Mun Trab" AS INT) END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
CASE  WHEN NULLIF(CAST(TRIM("Natureza Jurídica") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Natureza Jurídica" AS INT) END AS 'COD_NATUREZA_JURIDICA',
CAST("Qtd Hora Contr" AS INT)  AS 'QTD_HORAS_CONTRATUAIS',
CASE  WHEN NULLIF(CAST(TRIM("Raça Cor") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Raça Cor" AS INT) END AS 'COD_RACA_COR',
CASE  WHEN NULLIF(CAST(TRIM("Sexo Trabalhador") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Sexo Trabalhador" AS INT) END AS 'COD_SEXO_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM("Tamanho Estabelecimento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tamanho Estabelecimento" AS INT) END AS 'COD_TAMANHO_ESTABELECIMENTO',
CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT)  AS 'TEMPO_EMPREGADO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Admissão") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Admissão" AS INT) END AS 'COD_TIPO_ADMISSAO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Defic") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Defic" AS INT) END AS 'COD_TIPO_DEFICIENCIA',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Vínculo") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Vínculo" AS INT) END AS 'COD_TIPO_EMPREGATICIO',
CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Dezembro (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Dezembro (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Média (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Média (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_MEDIA',
CAST(Idade AS INT)  AS 'IDADE_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM(Município) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Município AS INT) END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
CASE  WHEN NULLIF(CAST(TRIM(Nacionalidade) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Nacionalidade AS INT) END AS 'COD_NACIONALIDADE',
CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2018_RAIS_VINC_PUB_SUL]
WHERE Município <> 'Município'
UNION ALL

--2017 PARANÁ,RIO GRANDE DO SUL, SANTA CATARINA
SELECT
CASE  WHEN NULLIF(CAST(TRIM("CBO Ocupação 2002") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CBO Ocupação 2002" AS INT) END AS 'COD_OCUPACAO',
CASE  WHEN NULLIF(CAST(TRIM("CNAE 2.0 Subclasse") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CNAE 2.0 Subclasse" AS INT) END AS 'COD_SUBCLASSE',
CASE  WHEN NULLIF(CAST(TRIM("Escolaridade após 2005") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Escolaridade após 2005" AS INT) END AS 'COD_GRAU_INSTRUCAO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Etária") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Etária" AS INT) END AS 'COD_FAIXA_ETARIA',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Hora Contrat") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Hora Contrat" AS INT) END AS 'COD_FAIXA_HORA_CONTRATUAL',
CASE  WHEN TRIM("Faixa Remun Dezem (SM)")  IS NULL OR TRIM("Faixa Remun Dezem (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Dezem (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
CASE  WHEN TRIM("Faixa Remun Média (SM)")  IS NULL OR TRIM("Faixa Remun Média (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Média (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Tempo Emprego") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Tempo Emprego" AS INT) END AS 'COD_FAIXA_TEMPO_EMPREGO',
CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
2017 AS 'ANO_RAIS',
CASE WHEN "Mês Admissão" IS NULL OR "Mês Admissão"  = 0 THEN 01/01/1900 ELSE DATE(2017 || '-' || "Mês Admissão" || '-28')  END AS 'DATA_ADMISSAO',               
CASE WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN 01/01/1900 ELSE DATE(2017 || '-' || "Mês Desligamento" || '-28')  END AS 'DATA_DEMISSAO',  
CASE  WHEN NULLIF(CAST(TRIM("Motivo Desligamento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Motivo Desligamento" AS INT) END AS 'COD_MOTIVO_DESLIGAMENTO',
CASE  WHEN NULLIF(CAST(TRIM("Mun Trab") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Mun Trab" AS INT) END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
CASE  WHEN NULLIF(CAST(TRIM("Natureza Jurídica") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Natureza Jurídica" AS INT) END AS 'COD_NATUREZA_JURIDICA',
CAST("Qtd Hora Contr" AS INT)  AS 'QTD_HORAS_CONTRATUAIS',
CASE  WHEN NULLIF(CAST(TRIM("Raça Cor") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Raça Cor" AS INT) END AS 'COD_RACA_COR',
CASE  WHEN NULLIF(CAST(TRIM("Sexo Trabalhador") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Sexo Trabalhador" AS INT) END AS 'COD_SEXO_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM("Tamanho Estabelecimento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tamanho Estabelecimento" AS INT) END AS 'COD_TAMANHO_ESTABELECIMENTO',
CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT)  AS 'TEMPO_EMPREGADO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Admissão") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Admissão" AS INT) END AS 'COD_TIPO_ADMISSAO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Defic") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Defic" AS INT) END AS 'COD_TIPO_DEFICIENCIA',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Vínculo") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Vínculo" AS INT) END AS 'COD_TIPO_EMPREGATICIO',
CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Dezembro (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Dezembro (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Média (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Média (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_MEDIA',
CAST(Idade AS INT)  AS 'IDADE_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM(Município) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Município AS INT) END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
CASE  WHEN NULLIF(CAST(TRIM(Nacionalidade) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Nacionalidade AS INT) END AS 'COD_NACIONALIDADE',
CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2017_PR2017]
WHERE Município <> 'Município'
UNION ALL
--###########
SELECT
CASE  WHEN NULLIF(CAST(TRIM("CBO Ocupação 2002") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CBO Ocupação 2002" AS INT) END AS 'COD_OCUPACAO',
CASE  WHEN NULLIF(CAST(TRIM("CNAE 2.0 Subclasse") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CNAE 2.0 Subclasse" AS INT) END AS 'COD_SUBCLASSE',
CASE  WHEN NULLIF(CAST(TRIM("Escolaridade após 2005") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Escolaridade após 2005" AS INT) END AS 'COD_GRAU_INSTRUCAO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Etária") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Etária" AS INT) END AS 'COD_FAIXA_ETARIA',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Hora Contrat") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Hora Contrat" AS INT) END AS 'COD_FAIXA_HORA_CONTRATUAL',
CASE  WHEN TRIM("Faixa Remun Dezem (SM)")  IS NULL OR TRIM("Faixa Remun Dezem (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Dezem (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
CASE  WHEN TRIM("Faixa Remun Média (SM)")  IS NULL OR TRIM("Faixa Remun Média (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Média (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Tempo Emprego") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Tempo Emprego" AS INT) END AS 'COD_FAIXA_TEMPO_EMPREGO',
CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
2017 AS 'ANO_RAIS',
CASE WHEN "Mês Admissão" IS NULL OR "Mês Admissão"  = 0 THEN 01/01/1900 ELSE DATE(2017 || '-' || "Mês Admissão" || '-28')  END AS 'DATA_ADMISSAO',               
CASE WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN 01/01/1900 ELSE DATE(2017 || '-' || "Mês Desligamento" || '-28')  END AS 'DATA_DEMISSAO',  
CASE  WHEN NULLIF(CAST(TRIM("Motivo Desligamento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Motivo Desligamento" AS INT) END AS 'COD_MOTIVO_DESLIGAMENTO',
CASE  WHEN NULLIF(CAST(TRIM("Mun Trab") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Mun Trab" AS INT) END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
CASE  WHEN NULLIF(CAST(TRIM("Natureza Jurídica") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Natureza Jurídica" AS INT) END AS 'COD_NATUREZA_JURIDICA',
CAST("Qtd Hora Contr" AS INT)  AS 'QTD_HORAS_CONTRATUAIS',
CASE  WHEN NULLIF(CAST(TRIM("Raça Cor") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Raça Cor" AS INT) END AS 'COD_RACA_COR',
CASE  WHEN NULLIF(CAST(TRIM("Sexo Trabalhador") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Sexo Trabalhador" AS INT) END AS 'COD_SEXO_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM("Tamanho Estabelecimento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tamanho Estabelecimento" AS INT) END AS 'COD_TAMANHO_ESTABELECIMENTO',
CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT)  AS 'TEMPO_EMPREGADO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Admissão") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Admissão" AS INT) END AS 'COD_TIPO_ADMISSAO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Defic") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Defic" AS INT) END AS 'COD_TIPO_DEFICIENCIA',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Vínculo") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Vínculo" AS INT) END AS 'COD_TIPO_EMPREGATICIO',
CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Dezembro (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Dezembro (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Média (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Média (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_MEDIA',
CAST(Idade AS INT)  AS 'IDADE_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM(Município) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Município AS INT) END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
CASE  WHEN NULLIF(CAST(TRIM(Nacionalidade) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Nacionalidade AS INT) END AS 'COD_NACIONALIDADE',
CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2017_RS2017]
WHERE Município <> 'Município'
UNION ALL
--##############
SELECT
CASE  WHEN NULLIF(CAST(TRIM("CBO Ocupação 2002") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CBO Ocupação 2002" AS INT) END AS 'COD_OCUPACAO',
CASE  WHEN NULLIF(CAST(TRIM("CNAE 2.0 Subclasse") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CNAE 2.0 Subclasse" AS INT) END AS 'COD_SUBCLASSE',
CASE  WHEN NULLIF(CAST(TRIM("Escolaridade após 2005") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Escolaridade após 2005" AS INT) END AS 'COD_GRAU_INSTRUCAO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Etária") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Etária" AS INT) END AS 'COD_FAIXA_ETARIA',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Hora Contrat") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Hora Contrat" AS INT) END AS 'COD_FAIXA_HORA_CONTRATUAL',
CASE  WHEN TRIM("Faixa Remun Dezem (SM)")  IS NULL OR TRIM("Faixa Remun Dezem (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Dezem (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
CASE  WHEN TRIM("Faixa Remun Média (SM)")  IS NULL OR TRIM("Faixa Remun Média (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Média (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Tempo Emprego") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Tempo Emprego" AS INT) END AS 'COD_FAIXA_TEMPO_EMPREGO',
CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
2017 AS 'ANO_RAIS',
CASE WHEN "Mês Admissão" IS NULL OR "Mês Admissão"  = 0 THEN 01/01/1900 ELSE DATE(2017 || '-' || "Mês Admissão" || '-28')  END AS 'DATA_ADMISSAO',               
CASE WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN 01/01/1900 ELSE DATE(2017 || '-' || "Mês Desligamento" || '-28')  END AS 'DATA_DEMISSAO',  
CASE  WHEN NULLIF(CAST(TRIM("Motivo Desligamento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Motivo Desligamento" AS INT) END AS 'COD_MOTIVO_DESLIGAMENTO',
CASE  WHEN NULLIF(CAST(TRIM("Mun Trab") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Mun Trab" AS INT) END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
CASE  WHEN NULLIF(CAST(TRIM("Natureza Jurídica") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Natureza Jurídica" AS INT) END AS 'COD_NATUREZA_JURIDICA',
CAST("Qtd Hora Contr" AS INT)  AS 'QTD_HORAS_CONTRATUAIS',
CASE  WHEN NULLIF(CAST(TRIM("Raça Cor") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Raça Cor" AS INT) END AS 'COD_RACA_COR',
CASE  WHEN NULLIF(CAST(TRIM("Sexo Trabalhador") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Sexo Trabalhador" AS INT) END AS 'COD_SEXO_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM("Tamanho Estabelecimento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tamanho Estabelecimento" AS INT) END AS 'COD_TAMANHO_ESTABELECIMENTO',
CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT)  AS 'TEMPO_EMPREGADO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Admissão") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Admissão" AS INT) END AS 'COD_TIPO_ADMISSAO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Defic") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Defic" AS INT) END AS 'COD_TIPO_DEFICIENCIA',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Vínculo") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Vínculo" AS INT) END AS 'COD_TIPO_EMPREGATICIO',
CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Dezembro (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Dezembro (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Média (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Média (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_MEDIA',
CAST(Idade AS INT)  AS 'IDADE_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM(Município) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Município AS INT) END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
CASE  WHEN NULLIF(CAST(TRIM(Nacionalidade) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Nacionalidade AS INT) END AS 'COD_NACIONALIDADE',
CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2017_SC2017]
WHERE Município <> 'Município'
UNION ALL

--2016 PARANÁ,RIO GRANDE DO SUL, SANTA CATARINA
SELECT
CASE  WHEN NULLIF(CAST(TRIM("CBO Ocupação 2002") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CBO Ocupação 2002" AS INT) END AS 'COD_OCUPACAO',
CASE  WHEN NULLIF(CAST(TRIM("CNAE 2.0 Subclasse") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CNAE 2.0 Subclasse" AS INT) END AS 'COD_SUBCLASSE',
CASE  WHEN NULLIF(CAST(TRIM("Escolaridade após 2005") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Escolaridade após 2005" AS INT) END AS 'COD_GRAU_INSTRUCAO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Etária") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Etária" AS INT) END AS 'COD_FAIXA_ETARIA',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Hora Contrat") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Hora Contrat" AS INT) END AS 'COD_FAIXA_HORA_CONTRATUAL',
CASE  WHEN TRIM("Faixa Remun Dezem (SM)")  IS NULL OR TRIM("Faixa Remun Dezem (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Dezem (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
CASE  WHEN TRIM("Faixa Remun Média (SM)")  IS NULL OR TRIM("Faixa Remun Média (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Média (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Tempo Emprego") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Tempo Emprego" AS INT) END AS 'COD_FAIXA_TEMPO_EMPREGO',
CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
2016 AS 'ANO_RAIS',
CASE WHEN "Mês Admissão" IS NULL OR "Mês Admissão"  = 0 THEN 01/01/1900 ELSE DATE(2016 || '-' || "Mês Admissão" || '-28')  END AS 'DATA_ADMISSAO',               
CASE WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN 01/01/1900 ELSE DATE(2016 || '-' || "Mês Desligamento" || '-28')  END AS 'DATA_DEMISSAO',  
CASE  WHEN NULLIF(CAST(TRIM("Motivo Desligamento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Motivo Desligamento" AS INT) END AS 'COD_MOTIVO_DESLIGAMENTO',
CASE  WHEN NULLIF(CAST(TRIM("Mun Trab") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Mun Trab" AS INT) END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
CASE  WHEN NULLIF(CAST(TRIM("Natureza Jurídica") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Natureza Jurídica" AS INT) END AS 'COD_NATUREZA_JURIDICA',
CAST("Qtd Hora Contr" AS INT)  AS 'QTD_HORAS_CONTRATUAIS',
CASE  WHEN NULLIF(CAST(TRIM("Raça Cor") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Raça Cor" AS INT) END AS 'COD_RACA_COR',
CASE  WHEN NULLIF(CAST(TRIM("Sexo Trabalhador") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Sexo Trabalhador" AS INT) END AS 'COD_SEXO_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM("Tamanho Estabelecimento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tamanho Estabelecimento" AS INT) END AS 'COD_TAMANHO_ESTABELECIMENTO',
CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT)  AS 'TEMPO_EMPREGADO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Admissão") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Admissão" AS INT) END AS 'COD_TIPO_ADMISSAO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Defic") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Defic" AS INT) END AS 'COD_TIPO_DEFICIENCIA',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Vínculo") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Vínculo" AS INT) END AS 'COD_TIPO_EMPREGATICIO',
CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Dezembro (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Dezembro (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Média (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Média (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_MEDIA',
CAST(Idade AS INT)  AS 'IDADE_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM(Município) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Município AS INT) END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
CASE  WHEN NULLIF(CAST(TRIM(Nacionalidade) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Nacionalidade AS INT) END AS 'COD_NACIONALIDADE',
CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2016_PR2016]
WHERE Município <> 'Município'
UNION ALL
--##########
SELECT
CASE  WHEN NULLIF(CAST(TRIM("CBO Ocupação 2002") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CBO Ocupação 2002" AS INT) END AS 'COD_OCUPACAO',
CASE  WHEN NULLIF(CAST(TRIM("CNAE 2.0 Subclasse") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CNAE 2.0 Subclasse" AS INT) END AS 'COD_SUBCLASSE',
CASE  WHEN NULLIF(CAST(TRIM("Escolaridade após 2005") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Escolaridade após 2005" AS INT) END AS 'COD_GRAU_INSTRUCAO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Etária") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Etária" AS INT) END AS 'COD_FAIXA_ETARIA',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Hora Contrat") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Hora Contrat" AS INT) END AS 'COD_FAIXA_HORA_CONTRATUAL',
CASE  WHEN TRIM("Faixa Remun Dezem (SM)")  IS NULL OR TRIM("Faixa Remun Dezem (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Dezem (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
CASE  WHEN TRIM("Faixa Remun Média (SM)")  IS NULL OR TRIM("Faixa Remun Média (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Média (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Tempo Emprego") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Tempo Emprego" AS INT) END AS 'COD_FAIXA_TEMPO_EMPREGO',
CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
2016 AS 'ANO_RAIS',
CASE WHEN "Mês Admissão" IS NULL OR "Mês Admissão"  = 0 THEN 01/01/1900 ELSE DATE(2016 || '-' || "Mês Admissão" || '-28')  END AS 'DATA_ADMISSAO',               
CASE WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN 01/01/1900 ELSE DATE(2016 || '-' || "Mês Desligamento" || '-28')  END AS 'DATA_DEMISSAO',  
CASE  WHEN NULLIF(CAST(TRIM("Motivo Desligamento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Motivo Desligamento" AS INT) END AS 'COD_MOTIVO_DESLIGAMENTO',
CASE  WHEN NULLIF(CAST(TRIM("Mun Trab") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Mun Trab" AS INT) END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
CASE  WHEN NULLIF(CAST(TRIM("Natureza Jurídica") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Natureza Jurídica" AS INT) END AS 'COD_NATUREZA_JURIDICA',
CAST("Qtd Hora Contr" AS INT)  AS 'QTD_HORAS_CONTRATUAIS',
CASE  WHEN NULLIF(CAST(TRIM("Raça Cor") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Raça Cor" AS INT) END AS 'COD_RACA_COR',
CASE  WHEN NULLIF(CAST(TRIM("Sexo Trabalhador") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Sexo Trabalhador" AS INT) END AS 'COD_SEXO_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM("Tamanho Estabelecimento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tamanho Estabelecimento" AS INT) END AS 'COD_TAMANHO_ESTABELECIMENTO',
CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT)  AS 'TEMPO_EMPREGADO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Admissão") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Admissão" AS INT) END AS 'COD_TIPO_ADMISSAO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Defic") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Defic" AS INT) END AS 'COD_TIPO_DEFICIENCIA',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Vínculo") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Vínculo" AS INT) END AS 'COD_TIPO_EMPREGATICIO',
CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Dezembro (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Dezembro (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Média (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Média (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_MEDIA',
CAST(Idade AS INT)  AS 'IDADE_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM(Município) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Município AS INT) END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
CASE  WHEN NULLIF(CAST(TRIM(Nacionalidade) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Nacionalidade AS INT) END AS 'COD_NACIONALIDADE',
CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2016_RS2016]
WHERE Município <> 'Município'
UNION ALL
--########
SELECT
CASE  WHEN NULLIF(CAST(TRIM("CBO Ocupação 2002") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CBO Ocupação 2002" AS INT) END AS 'COD_OCUPACAO',
CASE  WHEN NULLIF(CAST(TRIM("CNAE 2.0 Subclasse") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CNAE 2.0 Subclasse" AS INT) END AS 'COD_SUBCLASSE',
CASE  WHEN NULLIF(CAST(TRIM("Escolaridade após 2005") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Escolaridade após 2005" AS INT) END AS 'COD_GRAU_INSTRUCAO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Etária") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Etária" AS INT) END AS 'COD_FAIXA_ETARIA',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Hora Contrat") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Hora Contrat" AS INT) END AS 'COD_FAIXA_HORA_CONTRATUAL',
CASE  WHEN TRIM("Faixa Remun Dezem (SM)")  IS NULL OR TRIM("Faixa Remun Dezem (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Dezem (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
CASE  WHEN TRIM("Faixa Remun Média (SM)")  IS NULL OR TRIM("Faixa Remun Média (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Média (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Tempo Emprego") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Tempo Emprego" AS INT) END AS 'COD_FAIXA_TEMPO_EMPREGO',
CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
2016 AS 'ANO_RAIS',
CASE WHEN "Mês Admissão" IS NULL OR "Mês Admissão"  = 0 THEN 01/01/1900 ELSE DATE(2016 || '-' || "Mês Admissão" || '-28')  END AS 'DATA_ADMISSAO',               
CASE WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN 01/01/1900 ELSE DATE(2016 || '-' || "Mês Desligamento" || '-28')  END AS 'DATA_DEMISSAO',  
CASE  WHEN NULLIF(CAST(TRIM("Motivo Desligamento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Motivo Desligamento" AS INT) END AS 'COD_MOTIVO_DESLIGAMENTO',
CASE  WHEN NULLIF(CAST(TRIM("Mun Trab") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Mun Trab" AS INT) END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
CASE  WHEN NULLIF(CAST(TRIM("Natureza Jurídica") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Natureza Jurídica" AS INT) END AS 'COD_NATUREZA_JURIDICA',
CAST("Qtd Hora Contr" AS INT)  AS 'QTD_HORAS_CONTRATUAIS',
CASE  WHEN NULLIF(CAST(TRIM("Raça Cor") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Raça Cor" AS INT) END AS 'COD_RACA_COR',
CASE  WHEN NULLIF(CAST(TRIM("Sexo Trabalhador") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Sexo Trabalhador" AS INT) END AS 'COD_SEXO_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM("Tamanho Estabelecimento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tamanho Estabelecimento" AS INT) END AS 'COD_TAMANHO_ESTABELECIMENTO',
CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT)  AS 'TEMPO_EMPREGADO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Admissão") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Admissão" AS INT) END AS 'COD_TIPO_ADMISSAO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Defic") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Defic" AS INT) END AS 'COD_TIPO_DEFICIENCIA',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Vínculo") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Vínculo" AS INT) END AS 'COD_TIPO_EMPREGATICIO',
CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Dezembro (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Dezembro (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Média (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Média (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_MEDIA',
CAST(Idade AS INT)  AS 'IDADE_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM(Município) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Município AS INT) END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
CASE  WHEN NULLIF(CAST(TRIM(Nacionalidade) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Nacionalidade AS INT) END AS 'COD_NACIONALIDADE',
CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2016_SC2016]
WHERE Município <> 'Município'
UNION ALL

--2015 PARANÁ,RIO GRANDE DO SUL, SANTA CATARINA
SELECT
CASE  WHEN NULLIF(CAST(TRIM("CBO Ocupação 2002") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CBO Ocupação 2002" AS INT) END AS 'COD_OCUPACAO',
CASE  WHEN NULLIF(CAST(TRIM("CNAE 2.0 Subclasse") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CNAE 2.0 Subclasse" AS INT) END AS 'COD_SUBCLASSE',
CASE  WHEN NULLIF(CAST(TRIM("Escolaridade após 2005") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Escolaridade após 2005" AS INT) END AS 'COD_GRAU_INSTRUCAO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Etária") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Etária" AS INT) END AS 'COD_FAIXA_ETARIA',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Hora Contrat") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Hora Contrat" AS INT) END AS 'COD_FAIXA_HORA_CONTRATUAL',
CASE  WHEN TRIM("Faixa Remun Dezem (SM)")  IS NULL OR TRIM("Faixa Remun Dezem (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Dezem (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
CASE  WHEN TRIM("Faixa Remun Média (SM)")  IS NULL OR TRIM("Faixa Remun Média (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Média (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Tempo Emprego") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Tempo Emprego" AS INT) END AS 'COD_FAIXA_TEMPO_EMPREGO',
CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
2015 AS 'ANO_RAIS',
CASE WHEN "Mês Admissão" IS NULL OR "Mês Admissão"  = 0 THEN 01/01/1900 ELSE DATE(2015 || '-' || "Mês Admissão" || '-28')  END AS 'DATA_ADMISSAO',               
CASE WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN 01/01/1900 ELSE DATE(2015 || '-' || "Mês Desligamento" || '-28')  END AS 'DATA_DEMISSAO',  
CASE  WHEN NULLIF(CAST(TRIM("Motivo Desligamento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Motivo Desligamento" AS INT) END AS 'COD_MOTIVO_DESLIGAMENTO',
CASE  WHEN NULLIF(CAST(TRIM("Mun Trab") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Mun Trab" AS INT) END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
CASE  WHEN NULLIF(CAST(TRIM("Natureza Jurídica") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Natureza Jurídica" AS INT) END AS 'COD_NATUREZA_JURIDICA',
CAST("Qtd Hora Contr" AS INT)  AS 'QTD_HORAS_CONTRATUAIS',
CASE  WHEN NULLIF(CAST(TRIM("Raça Cor") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Raça Cor" AS INT) END AS 'COD_RACA_COR',
CASE  WHEN NULLIF(CAST(TRIM("Sexo Trabalhador") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Sexo Trabalhador" AS INT) END AS 'COD_SEXO_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM("Tamanho Estabelecimento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tamanho Estabelecimento" AS INT) END AS 'COD_TAMANHO_ESTABELECIMENTO',
CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT)  AS 'TEMPO_EMPREGADO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Admissão") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Admissão" AS INT) END AS 'COD_TIPO_ADMISSAO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Defic") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Defic" AS INT) END AS 'COD_TIPO_DEFICIENCIA',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Vínculo") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Vínculo" AS INT) END AS 'COD_TIPO_EMPREGATICIO',
CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Dezembro (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Dezembro (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Média (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Média (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_MEDIA',
CAST(Idade AS INT)  AS 'IDADE_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM(Município) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Município AS INT) END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
CASE  WHEN NULLIF(CAST(TRIM(Nacionalidade) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Nacionalidade AS INT) END AS 'COD_NACIONALIDADE',
CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2015_PR2015]
WHERE Município <> 'Município'
UNION ALL
--#########
SELECT
CASE  WHEN NULLIF(CAST(TRIM("CBO Ocupação 2002") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CBO Ocupação 2002" AS INT) END AS 'COD_OCUPACAO',
CASE  WHEN NULLIF(CAST(TRIM("CNAE 2.0 Subclasse") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CNAE 2.0 Subclasse" AS INT) END AS 'COD_SUBCLASSE',
CASE  WHEN NULLIF(CAST(TRIM("Escolaridade após 2005") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Escolaridade após 2005" AS INT) END AS 'COD_GRAU_INSTRUCAO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Etária") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Etária" AS INT) END AS 'COD_FAIXA_ETARIA',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Hora Contrat") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Hora Contrat" AS INT) END AS 'COD_FAIXA_HORA_CONTRATUAL',
CASE  WHEN TRIM("Faixa Remun Dezem (SM)")  IS NULL OR TRIM("Faixa Remun Dezem (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Dezem (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
CASE  WHEN TRIM("Faixa Remun Média (SM)")  IS NULL OR TRIM("Faixa Remun Média (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Média (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Tempo Emprego") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Tempo Emprego" AS INT) END AS 'COD_FAIXA_TEMPO_EMPREGO',
CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
2015 AS 'ANO_RAIS',
CASE WHEN "Mês Admissão" IS NULL OR "Mês Admissão"  = 0 THEN 01/01/1900 ELSE DATE(2015 || '-' || "Mês Admissão" || '-28')  END AS 'DATA_ADMISSAO',               
CASE WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN 01/01/1900 ELSE DATE(2015 || '-' || "Mês Desligamento" || '-28')  END AS 'DATA_DEMISSAO',  
CASE  WHEN NULLIF(CAST(TRIM("Motivo Desligamento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Motivo Desligamento" AS INT) END AS 'COD_MOTIVO_DESLIGAMENTO',
CASE  WHEN NULLIF(CAST(TRIM("Mun Trab") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Mun Trab" AS INT) END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
CASE  WHEN NULLIF(CAST(TRIM("Natureza Jurídica") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Natureza Jurídica" AS INT) END AS 'COD_NATUREZA_JURIDICA',
CAST("Qtd Hora Contr" AS INT)  AS 'QTD_HORAS_CONTRATUAIS',
CASE  WHEN NULLIF(CAST(TRIM("Raça Cor") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Raça Cor" AS INT) END AS 'COD_RACA_COR',
CASE  WHEN NULLIF(CAST(TRIM("Sexo Trabalhador") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Sexo Trabalhador" AS INT) END AS 'COD_SEXO_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM("Tamanho Estabelecimento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tamanho Estabelecimento" AS INT) END AS 'COD_TAMANHO_ESTABELECIMENTO',
CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT)  AS 'TEMPO_EMPREGADO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Admissão") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Admissão" AS INT) END AS 'COD_TIPO_ADMISSAO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Defic") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Defic" AS INT) END AS 'COD_TIPO_DEFICIENCIA',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Vínculo") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Vínculo" AS INT) END AS 'COD_TIPO_EMPREGATICIO',
CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Dezembro (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Dezembro (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Média (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Média (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_MEDIA',
CAST(Idade AS INT)  AS 'IDADE_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM(Município) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Município AS INT) END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
CASE  WHEN NULLIF(CAST(TRIM(Nacionalidade) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Nacionalidade AS INT) END AS 'COD_NACIONALIDADE',
CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2015_RS2015]
WHERE Município <> 'Município'
UNION ALL
--#########
SELECT
CASE  WHEN NULLIF(CAST(TRIM("CBO Ocupação 2002") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CBO Ocupação 2002" AS INT) END AS 'COD_OCUPACAO',
CASE  WHEN NULLIF(CAST(TRIM("CNAE 2.0 Subclasse") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CNAE 2.0 Subclasse" AS INT) END AS 'COD_SUBCLASSE',
CASE  WHEN NULLIF(CAST(TRIM("Escolaridade após 2005") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Escolaridade após 2005" AS INT) END AS 'COD_GRAU_INSTRUCAO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Etária") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Etária" AS INT) END AS 'COD_FAIXA_ETARIA',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Hora Contrat") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Hora Contrat" AS INT) END AS 'COD_FAIXA_HORA_CONTRATUAL',
CASE  WHEN TRIM("Faixa Remun Dezem (SM)")  IS NULL OR TRIM("Faixa Remun Dezem (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Dezem (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
CASE  WHEN TRIM("Faixa Remun Média (SM)")  IS NULL OR TRIM("Faixa Remun Média (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Média (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Tempo Emprego") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Tempo Emprego" AS INT) END AS 'COD_FAIXA_TEMPO_EMPREGO',
CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
2015 AS 'ANO_RAIS',
CASE WHEN "Mês Admissão" IS NULL OR "Mês Admissão"  = 0 THEN 01/01/1900 ELSE DATE(2015 || '-' || "Mês Admissão" || '-28')  END AS 'DATA_ADMISSAO',               
CASE WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN 01/01/1900 ELSE DATE(2015 || '-' || "Mês Desligamento" || '-28')  END AS 'DATA_DEMISSAO',  
CASE  WHEN NULLIF(CAST(TRIM("Motivo Desligamento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Motivo Desligamento" AS INT) END AS 'COD_MOTIVO_DESLIGAMENTO',
CASE  WHEN NULLIF(CAST(TRIM("Mun Trab") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Mun Trab" AS INT) END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
CASE  WHEN NULLIF(CAST(TRIM("Natureza Jurídica") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Natureza Jurídica" AS INT) END AS 'COD_NATUREZA_JURIDICA',
CAST("Qtd Hora Contr" AS INT)  AS 'QTD_HORAS_CONTRATUAIS',
CASE  WHEN NULLIF(CAST(TRIM("Raça Cor") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Raça Cor" AS INT) END AS 'COD_RACA_COR',
CASE  WHEN NULLIF(CAST(TRIM("Sexo Trabalhador") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Sexo Trabalhador" AS INT) END AS 'COD_SEXO_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM("Tamanho Estabelecimento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tamanho Estabelecimento" AS INT) END AS 'COD_TAMANHO_ESTABELECIMENTO',
CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT)  AS 'TEMPO_EMPREGADO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Admissão") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Admissão" AS INT) END AS 'COD_TIPO_ADMISSAO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Defic") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Defic" AS INT) END AS 'COD_TIPO_DEFICIENCIA',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Vínculo") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Vínculo" AS INT) END AS 'COD_TIPO_EMPREGATICIO',
CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Dezembro (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Dezembro (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Média (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Média (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_MEDIA',
CAST(Idade AS INT)  AS 'IDADE_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM(Município) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Município AS INT) END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
CASE  WHEN NULLIF(CAST(TRIM(Nacionalidade) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Nacionalidade AS INT) END AS 'COD_NACIONALIDADE',
CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2015_SC2015]
WHERE Município <> 'Município'
UNION ALL

--2014 PARANÁ,RIO GRANDE DO SUL, SANTA CATARINA
SELECT
CASE  WHEN NULLIF(CAST(TRIM("CBO Ocupação 2002") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CBO Ocupação 2002" AS INT) END AS 'COD_OCUPACAO',
CASE  WHEN NULLIF(CAST(TRIM("CNAE 2.0 Subclasse") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CNAE 2.0 Subclasse" AS INT) END AS 'COD_SUBCLASSE',
CASE  WHEN NULLIF(CAST(TRIM("Escolaridade após 2005") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Escolaridade após 2005" AS INT) END AS 'COD_GRAU_INSTRUCAO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Etária") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Etária" AS INT) END AS 'COD_FAIXA_ETARIA',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Hora Contrat") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Hora Contrat" AS INT) END AS 'COD_FAIXA_HORA_CONTRATUAL',
CASE  WHEN TRIM("Faixa Remun Dezem (SM)")  IS NULL OR TRIM("Faixa Remun Dezem (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Dezem (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
CASE  WHEN TRIM("Faixa Remun Média (SM)")  IS NULL OR TRIM("Faixa Remun Média (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Média (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Tempo Emprego") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Tempo Emprego" AS INT) END AS 'COD_FAIXA_TEMPO_EMPREGO',
CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
2014 AS 'ANO_RAIS',
CASE WHEN "Mês Admissão" IS NULL OR "Mês Admissão"  = 0 THEN 01/01/1900 ELSE DATE(2014 || '-' || "Mês Admissão" || '-28')  END AS 'DATA_ADMISSAO',               
CASE WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN 01/01/1900 ELSE DATE(2014 || '-' || "Mês Desligamento" || '-28')  END AS 'DATA_DEMISSAO',  
CASE  WHEN NULLIF(CAST(TRIM("Motivo Desligamento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Motivo Desligamento" AS INT) END AS 'COD_MOTIVO_DESLIGAMENTO',
CASE  WHEN NULLIF(CAST(TRIM("Mun Trab") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Mun Trab" AS INT) END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
CASE  WHEN NULLIF(CAST(TRIM("Natureza Jurídica") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Natureza Jurídica" AS INT) END AS 'COD_NATUREZA_JURIDICA',
CAST("Qtd Hora Contr" AS INT)  AS 'QTD_HORAS_CONTRATUAIS',
CASE  WHEN NULLIF(CAST(TRIM("Raça Cor") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Raça Cor" AS INT) END AS 'COD_RACA_COR',
CASE  WHEN NULLIF(CAST(TRIM("Sexo Trabalhador") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Sexo Trabalhador" AS INT) END AS 'COD_SEXO_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM("Tamanho Estabelecimento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tamanho Estabelecimento" AS INT) END AS 'COD_TAMANHO_ESTABELECIMENTO',
CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT)  AS 'TEMPO_EMPREGADO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Admissão") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Admissão" AS INT) END AS 'COD_TIPO_ADMISSAO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Defic") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Defic" AS INT) END AS 'COD_TIPO_DEFICIENCIA',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Vínculo") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Vínculo" AS INT) END AS 'COD_TIPO_EMPREGATICIO',
CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Dezembro (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Dezembro (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Média (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Média (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_MEDIA',
CAST(Idade AS INT)  AS 'IDADE_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM(Município) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Município AS INT) END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
CASE  WHEN NULLIF(CAST(TRIM(Nacionalidade) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Nacionalidade AS INT) END AS 'COD_NACIONALIDADE',
CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2014_PR2014]
WHERE Município <> 'Município'
UNION ALL
--#########
SELECT
CASE  WHEN NULLIF(CAST(TRIM("CBO Ocupação 2002") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CBO Ocupação 2002" AS INT) END AS 'COD_OCUPACAO',
CASE  WHEN NULLIF(CAST(TRIM("CNAE 2.0 Subclasse") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CNAE 2.0 Subclasse" AS INT) END AS 'COD_SUBCLASSE',
CASE  WHEN NULLIF(CAST(TRIM("Escolaridade após 2005") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Escolaridade após 2005" AS INT) END AS 'COD_GRAU_INSTRUCAO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Etária") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Etária" AS INT) END AS 'COD_FAIXA_ETARIA',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Hora Contrat") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Hora Contrat" AS INT) END AS 'COD_FAIXA_HORA_CONTRATUAL',
CASE  WHEN TRIM("Faixa Remun Dezem (SM)")  IS NULL OR TRIM("Faixa Remun Dezem (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Dezem (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
CASE  WHEN TRIM("Faixa Remun Média (SM)")  IS NULL OR TRIM("Faixa Remun Média (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Média (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Tempo Emprego") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Tempo Emprego" AS INT) END AS 'COD_FAIXA_TEMPO_EMPREGO',
CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
2014 AS 'ANO_RAIS',
CASE WHEN "Mês Admissão" IS NULL OR "Mês Admissão"  = 0 THEN 01/01/1900 ELSE DATE(2014 || '-' || "Mês Admissão" || '-28')  END AS 'DATA_ADMISSAO',               
CASE WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN 01/01/1900 ELSE DATE(2014 || '-' || "Mês Desligamento" || '-28')  END AS 'DATA_DEMISSAO',  
CASE  WHEN NULLIF(CAST(TRIM("Motivo Desligamento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Motivo Desligamento" AS INT) END AS 'COD_MOTIVO_DESLIGAMENTO',
CASE  WHEN NULLIF(CAST(TRIM("Mun Trab") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Mun Trab" AS INT) END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
CASE  WHEN NULLIF(CAST(TRIM("Natureza Jurídica") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Natureza Jurídica" AS INT) END AS 'COD_NATUREZA_JURIDICA',
CAST("Qtd Hora Contr" AS INT)  AS 'QTD_HORAS_CONTRATUAIS',
CASE  WHEN NULLIF(CAST(TRIM("Raça Cor") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Raça Cor" AS INT) END AS 'COD_RACA_COR',
CASE  WHEN NULLIF(CAST(TRIM("Sexo Trabalhador") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Sexo Trabalhador" AS INT) END AS 'COD_SEXO_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM("Tamanho Estabelecimento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tamanho Estabelecimento" AS INT) END AS 'COD_TAMANHO_ESTABELECIMENTO',
CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT)  AS 'TEMPO_EMPREGADO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Admissão") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Admissão" AS INT) END AS 'COD_TIPO_ADMISSAO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Defic") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Defic" AS INT) END AS 'COD_TIPO_DEFICIENCIA',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Vínculo") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Vínculo" AS INT) END AS 'COD_TIPO_EMPREGATICIO',
CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Dezembro (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Dezembro (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Média (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Média (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_MEDIA',
CAST(Idade AS INT)  AS 'IDADE_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM(Município) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Município AS INT) END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
CASE  WHEN NULLIF(CAST(TRIM(Nacionalidade) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Nacionalidade AS INT) END AS 'COD_NACIONALIDADE',
CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2014_RS2014]
WHERE Município <> 'Município'
UNION ALL
--#########
SELECT
CASE  WHEN NULLIF(CAST(TRIM("CBO Ocupação 2002") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CBO Ocupação 2002" AS INT) END AS 'COD_OCUPACAO',
CASE  WHEN NULLIF(CAST(TRIM("CNAE 2.0 Subclasse") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CNAE 2.0 Subclasse" AS INT) END AS 'COD_SUBCLASSE',
CASE  WHEN NULLIF(CAST(TRIM("Escolaridade após 2005") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Escolaridade após 2005" AS INT) END AS 'COD_GRAU_INSTRUCAO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Etária") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Etária" AS INT) END AS 'COD_FAIXA_ETARIA',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Hora Contrat") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Hora Contrat" AS INT) END AS 'COD_FAIXA_HORA_CONTRATUAL',
CASE  WHEN TRIM("Faixa Remun Dezem (SM)")  IS NULL OR TRIM("Faixa Remun Dezem (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Dezem (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
CASE  WHEN TRIM("Faixa Remun Média (SM)")  IS NULL OR TRIM("Faixa Remun Média (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Média (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Tempo Emprego") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Tempo Emprego" AS INT) END AS 'COD_FAIXA_TEMPO_EMPREGO',
CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
2014 AS 'ANO_RAIS',
CASE WHEN "Mês Admissão" IS NULL OR "Mês Admissão"  = 0 THEN 01/01/1900 ELSE DATE(2014 || '-' || "Mês Admissão" || '-28')  END AS 'DATA_ADMISSAO',               
CASE WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN 01/01/1900 ELSE DATE(2014 || '-' || "Mês Desligamento" || '-28')  END AS 'DATA_DEMISSAO',  
CASE  WHEN NULLIF(CAST(TRIM("Motivo Desligamento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Motivo Desligamento" AS INT) END AS 'COD_MOTIVO_DESLIGAMENTO',
CASE  WHEN NULLIF(CAST(TRIM("Mun Trab") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Mun Trab" AS INT) END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
CASE  WHEN NULLIF(CAST(TRIM("Natureza Jurídica") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Natureza Jurídica" AS INT) END AS 'COD_NATUREZA_JURIDICA',
CAST("Qtd Hora Contr" AS INT)  AS 'QTD_HORAS_CONTRATUAIS',
CASE  WHEN NULLIF(CAST(TRIM("Raça Cor") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Raça Cor" AS INT) END AS 'COD_RACA_COR',
CASE  WHEN NULLIF(CAST(TRIM("Sexo Trabalhador") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Sexo Trabalhador" AS INT) END AS 'COD_SEXO_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM("Tamanho Estabelecimento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tamanho Estabelecimento" AS INT) END AS 'COD_TAMANHO_ESTABELECIMENTO',
CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT)  AS 'TEMPO_EMPREGADO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Admissão") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Admissão" AS INT) END AS 'COD_TIPO_ADMISSAO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Defic") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Defic" AS INT) END AS 'COD_TIPO_DEFICIENCIA',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Vínculo") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Vínculo" AS INT) END AS 'COD_TIPO_EMPREGATICIO',
CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Dezembro (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Dezembro (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Média (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Média (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_MEDIA',
CAST(Idade AS INT)  AS 'IDADE_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM(Município) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Município AS INT) END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
CASE  WHEN NULLIF(CAST(TRIM(Nacionalidade) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Nacionalidade AS INT) END AS 'COD_NACIONALIDADE',
CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2014_SC2014]
WHERE Município <> 'Município'
UNION ALL

--2013 PARANÁ,RIO GRANDE DO SUL, SANTA CATARINA
SELECT
CASE  WHEN NULLIF(CAST(TRIM("CBO Ocupação 2002") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CBO Ocupação 2002" AS INT) END AS 'COD_OCUPACAO',
CASE  WHEN NULLIF(CAST(TRIM("CNAE 2.0 Subclasse") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CNAE 2.0 Subclasse" AS INT) END AS 'COD_SUBCLASSE',
CASE  WHEN NULLIF(CAST(TRIM("Escolaridade após 2005") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Escolaridade após 2005" AS INT) END AS 'COD_GRAU_INSTRUCAO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Etária") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Etária" AS INT) END AS 'COD_FAIXA_ETARIA',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Hora Contrat") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Hora Contrat" AS INT) END AS 'COD_FAIXA_HORA_CONTRATUAL',
CASE  WHEN TRIM("Faixa Remun Dezem (SM)")  IS NULL OR TRIM("Faixa Remun Dezem (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Dezem (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
CASE  WHEN TRIM("Faixa Remun Média (SM)")  IS NULL OR TRIM("Faixa Remun Média (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Média (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Tempo Emprego") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Tempo Emprego" AS INT) END AS 'COD_FAIXA_TEMPO_EMPREGO',
CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
2013 AS 'ANO_RAIS',
CASE WHEN "Mês Admissão" IS NULL OR "Mês Admissão"  = 0 THEN 01/01/1900 ELSE DATE(2013 || '-' || "Mês Admissão" || '-28')  END AS 'DATA_ADMISSAO',               
CASE WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN 01/01/1900 ELSE DATE(2013 || '-' || "Mês Desligamento" || '-28')  END AS 'DATA_DEMISSAO',  
CASE  WHEN NULLIF(CAST(TRIM("Motivo Desligamento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Motivo Desligamento" AS INT) END AS 'COD_MOTIVO_DESLIGAMENTO',
CASE  WHEN NULLIF(CAST(TRIM("Mun Trab") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Mun Trab" AS INT) END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
CASE  WHEN NULLIF(CAST(TRIM("Natureza Jurídica") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Natureza Jurídica" AS INT) END AS 'COD_NATUREZA_JURIDICA',
CAST("Qtd Hora Contr" AS INT)  AS 'QTD_HORAS_CONTRATUAIS',
CASE  WHEN NULLIF(CAST(TRIM("Raça Cor") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Raça Cor" AS INT) END AS 'COD_RACA_COR',
CASE  WHEN NULLIF(CAST(TRIM("Sexo Trabalhador") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Sexo Trabalhador" AS INT) END AS 'COD_SEXO_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM("Tamanho Estabelecimento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tamanho Estabelecimento" AS INT) END AS 'COD_TAMANHO_ESTABELECIMENTO',
CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT)  AS 'TEMPO_EMPREGADO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Admissão") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Admissão" AS INT) END AS 'COD_TIPO_ADMISSAO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Defic") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Defic" AS INT) END AS 'COD_TIPO_DEFICIENCIA',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Vínculo") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Vínculo" AS INT) END AS 'COD_TIPO_EMPREGATICIO',
CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Dezembro (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Dezembro (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Média (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Média (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_MEDIA',
CAST(Idade AS INT)  AS 'IDADE_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM(Município) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Município AS INT) END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
CASE  WHEN NULLIF(CAST(TRIM(Nacionalidade) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Nacionalidade AS INT) END AS 'COD_NACIONALIDADE',
CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2013_PR2013]
WHERE Município <> 'Município'
UNION ALL
--#########
SELECT
CASE  WHEN NULLIF(CAST(TRIM("CBO Ocupação 2002") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CBO Ocupação 2002" AS INT) END AS 'COD_OCUPACAO',
CASE  WHEN NULLIF(CAST(TRIM("CNAE 2.0 Subclasse") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CNAE 2.0 Subclasse" AS INT) END AS 'COD_SUBCLASSE',
CASE  WHEN NULLIF(CAST(TRIM("Escolaridade após 2005") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Escolaridade após 2005" AS INT) END AS 'COD_GRAU_INSTRUCAO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Etária") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Etária" AS INT) END AS 'COD_FAIXA_ETARIA',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Hora Contrat") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Hora Contrat" AS INT) END AS 'COD_FAIXA_HORA_CONTRATUAL',
CASE  WHEN TRIM("Faixa Remun Dezem (SM)")  IS NULL OR TRIM("Faixa Remun Dezem (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Dezem (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
CASE  WHEN TRIM("Faixa Remun Média (SM)")  IS NULL OR TRIM("Faixa Remun Média (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Média (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Tempo Emprego") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Tempo Emprego" AS INT) END AS 'COD_FAIXA_TEMPO_EMPREGO',
CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
2013 AS 'ANO_RAIS',
CASE WHEN "Mês Admissão" IS NULL OR "Mês Admissão"  = 0 THEN 01/01/1900 ELSE DATE(2013 || '-' || "Mês Admissão" || '-28')  END AS 'DATA_ADMISSAO',               
CASE WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN 01/01/1900 ELSE DATE(2013 || '-' || "Mês Desligamento" || '-28')  END AS 'DATA_DEMISSAO',  
CASE  WHEN NULLIF(CAST(TRIM("Motivo Desligamento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Motivo Desligamento" AS INT) END AS 'COD_MOTIVO_DESLIGAMENTO',
CASE  WHEN NULLIF(CAST(TRIM("Mun Trab") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Mun Trab" AS INT) END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
CASE  WHEN NULLIF(CAST(TRIM("Natureza Jurídica") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Natureza Jurídica" AS INT) END AS 'COD_NATUREZA_JURIDICA',
CAST("Qtd Hora Contr" AS INT)  AS 'QTD_HORAS_CONTRATUAIS',
CASE  WHEN NULLIF(CAST(TRIM("Raça Cor") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Raça Cor" AS INT) END AS 'COD_RACA_COR',
CASE  WHEN NULLIF(CAST(TRIM("Sexo Trabalhador") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Sexo Trabalhador" AS INT) END AS 'COD_SEXO_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM("Tamanho Estabelecimento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tamanho Estabelecimento" AS INT) END AS 'COD_TAMANHO_ESTABELECIMENTO',
CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT)  AS 'TEMPO_EMPREGADO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Admissão") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Admissão" AS INT) END AS 'COD_TIPO_ADMISSAO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Defic") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Defic" AS INT) END AS 'COD_TIPO_DEFICIENCIA',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Vínculo") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Vínculo" AS INT) END AS 'COD_TIPO_EMPREGATICIO',
CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Dezembro (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Dezembro (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Média (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Média (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_MEDIA',
CAST(Idade AS INT)  AS 'IDADE_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM(Município) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Município AS INT) END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
CASE  WHEN NULLIF(CAST(TRIM(Nacionalidade) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Nacionalidade AS INT) END AS 'COD_NACIONALIDADE',
CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2013_RS2013]
WHERE Município <> 'Município'
UNION ALL
--#########
SELECT
CASE  WHEN NULLIF(CAST(TRIM("CBO Ocupação 2002") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CBO Ocupação 2002" AS INT) END AS 'COD_OCUPACAO',
CASE  WHEN NULLIF(CAST(TRIM("CNAE 2.0 Subclasse") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CNAE 2.0 Subclasse" AS INT) END AS 'COD_SUBCLASSE',
CASE  WHEN NULLIF(CAST(TRIM("Escolaridade após 2005") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Escolaridade após 2005" AS INT) END AS 'COD_GRAU_INSTRUCAO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Etária") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Etária" AS INT) END AS 'COD_FAIXA_ETARIA',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Hora Contrat") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Hora Contrat" AS INT) END AS 'COD_FAIXA_HORA_CONTRATUAL',
CASE  WHEN TRIM("Faixa Remun Dezem (SM)")  IS NULL OR TRIM("Faixa Remun Dezem (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Dezem (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
CASE  WHEN TRIM("Faixa Remun Média (SM)")  IS NULL OR TRIM("Faixa Remun Média (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Média (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Tempo Emprego") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Tempo Emprego" AS INT) END AS 'COD_FAIXA_TEMPO_EMPREGO',
CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
2013 AS 'ANO_RAIS',
CASE WHEN "Mês Admissão" IS NULL OR "Mês Admissão"  = 0 THEN 01/01/1900 ELSE DATE(2013 || '-' || "Mês Admissão" || '-28')  END AS 'DATA_ADMISSAO',               
CASE WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN 01/01/1900 ELSE DATE(2013 || '-' || "Mês Desligamento" || '-28')  END AS 'DATA_DEMISSAO',  
CASE  WHEN NULLIF(CAST(TRIM("Motivo Desligamento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Motivo Desligamento" AS INT) END AS 'COD_MOTIVO_DESLIGAMENTO',
CASE  WHEN NULLIF(CAST(TRIM("Mun Trab") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Mun Trab" AS INT) END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
CASE  WHEN NULLIF(CAST(TRIM("Natureza Jurídica") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Natureza Jurídica" AS INT) END AS 'COD_NATUREZA_JURIDICA',
CAST("Qtd Hora Contr" AS INT)  AS 'QTD_HORAS_CONTRATUAIS',
CASE  WHEN NULLIF(CAST(TRIM("Raça Cor") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Raça Cor" AS INT) END AS 'COD_RACA_COR',
CASE  WHEN NULLIF(CAST(TRIM("Sexo Trabalhador") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Sexo Trabalhador" AS INT) END AS 'COD_SEXO_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM("Tamanho Estabelecimento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tamanho Estabelecimento" AS INT) END AS 'COD_TAMANHO_ESTABELECIMENTO',
CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT)  AS 'TEMPO_EMPREGADO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Admissão") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Admissão" AS INT) END AS 'COD_TIPO_ADMISSAO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Defic") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Defic" AS INT) END AS 'COD_TIPO_DEFICIENCIA',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Vínculo") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Vínculo" AS INT) END AS 'COD_TIPO_EMPREGATICIO',
CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Dezembro (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Dezembro (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Média (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Média (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_MEDIA',
CAST(Idade AS INT)  AS 'IDADE_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM(Município) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Município AS INT) END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
CASE  WHEN NULLIF(CAST(TRIM(Nacionalidade) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Nacionalidade AS INT) END AS 'COD_NACIONALIDADE',
CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2013_SC2013]
WHERE Município <> 'Município'
UNION ALL

--2012 PARANÁ,RIO GRANDE DO SUL, SANTA CATARINA
SELECT
CASE  WHEN NULLIF(CAST(TRIM("CBO Ocupação 2002") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CBO Ocupação 2002" AS INT) END AS 'COD_OCUPACAO',
CASE  WHEN NULLIF(CAST(TRIM("CNAE 2.0 Subclasse") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CNAE 2.0 Subclasse" AS INT) END AS 'COD_SUBCLASSE',
CASE  WHEN NULLIF(CAST(TRIM("Escolaridade após 2005") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Escolaridade após 2005" AS INT) END AS 'COD_GRAU_INSTRUCAO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Etária") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Etária" AS INT) END AS 'COD_FAIXA_ETARIA',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Hora Contrat") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Hora Contrat" AS INT) END AS 'COD_FAIXA_HORA_CONTRATUAL',
CASE  WHEN TRIM("Faixa Remun Dezem (SM)")  IS NULL OR TRIM("Faixa Remun Dezem (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Dezem (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
CASE  WHEN TRIM("Faixa Remun Média (SM)")  IS NULL OR TRIM("Faixa Remun Média (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Média (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Tempo Emprego") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Tempo Emprego" AS INT) END AS 'COD_FAIXA_TEMPO_EMPREGO',
CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
2012 AS 'ANO_RAIS',
CASE WHEN "Mês Admissão" IS NULL OR "Mês Admissão"  = 0 THEN 01/01/1900 ELSE DATE(2012 || '-' || "Mês Admissão" || '-28')  END AS 'DATA_ADMISSAO',               
CASE WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN 01/01/1900 ELSE DATE(2012 || '-' || "Mês Desligamento" || '-28')  END AS 'DATA_DEMISSAO',  
CASE  WHEN NULLIF(CAST(TRIM("Motivo Desligamento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Motivo Desligamento" AS INT) END AS 'COD_MOTIVO_DESLIGAMENTO',
CASE  WHEN NULLIF(CAST(TRIM("Mun Trab") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Mun Trab" AS INT) END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
CASE  WHEN NULLIF(CAST(TRIM("Natureza Jurídica") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Natureza Jurídica" AS INT) END AS 'COD_NATUREZA_JURIDICA',
CAST("Qtd Hora Contr" AS INT)  AS 'QTD_HORAS_CONTRATUAIS',
CASE  WHEN NULLIF(CAST(TRIM("Raça Cor") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Raça Cor" AS INT) END AS 'COD_RACA_COR',
CASE  WHEN NULLIF(CAST(TRIM("Sexo Trabalhador") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Sexo Trabalhador" AS INT) END AS 'COD_SEXO_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM("Tamanho Estabelecimento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tamanho Estabelecimento" AS INT) END AS 'COD_TAMANHO_ESTABELECIMENTO',
CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT)  AS 'TEMPO_EMPREGADO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Admissão") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Admissão" AS INT) END AS 'COD_TIPO_ADMISSAO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Defic") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Defic" AS INT) END AS 'COD_TIPO_DEFICIENCIA',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Vínculo") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Vínculo" AS INT) END AS 'COD_TIPO_EMPREGATICIO',
CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Dezembro (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Dezembro (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Média (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Média (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_MEDIA',
CAST(Idade AS INT)  AS 'IDADE_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM(Município) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Município AS INT) END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
CASE  WHEN NULLIF(CAST(TRIM(Nacionalidade) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Nacionalidade AS INT) END AS 'COD_NACIONALIDADE',
CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2012_PR2012]
WHERE Município <> 'Município'
UNION ALL
--#########
SELECT
CASE  WHEN NULLIF(CAST(TRIM("CBO Ocupação 2002") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CBO Ocupação 2002" AS INT) END AS 'COD_OCUPACAO',
CASE  WHEN NULLIF(CAST(TRIM("CNAE 2.0 Subclasse") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CNAE 2.0 Subclasse" AS INT) END AS 'COD_SUBCLASSE',
CASE  WHEN NULLIF(CAST(TRIM("Escolaridade após 2005") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Escolaridade após 2005" AS INT) END AS 'COD_GRAU_INSTRUCAO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Etária") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Etária" AS INT) END AS 'COD_FAIXA_ETARIA',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Hora Contrat") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Hora Contrat" AS INT) END AS 'COD_FAIXA_HORA_CONTRATUAL',
CASE  WHEN TRIM("Faixa Remun Dezem (SM)")  IS NULL OR TRIM("Faixa Remun Dezem (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Dezem (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
CASE  WHEN TRIM("Faixa Remun Média (SM)")  IS NULL OR TRIM("Faixa Remun Média (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Média (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Tempo Emprego") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Tempo Emprego" AS INT) END AS 'COD_FAIXA_TEMPO_EMPREGO',
CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
2012 AS 'ANO_RAIS',
CASE WHEN "Mês Admissão" IS NULL OR "Mês Admissão"  = 0 THEN 01/01/1900 ELSE DATE(2012 || '-' || "Mês Admissão" || '-28')  END AS 'DATA_ADMISSAO',               
CASE WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN 01/01/1900 ELSE DATE(2012 || '-' || "Mês Desligamento" || '-28')  END AS 'DATA_DEMISSAO',  
CASE  WHEN NULLIF(CAST(TRIM("Motivo Desligamento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Motivo Desligamento" AS INT) END AS 'COD_MOTIVO_DESLIGAMENTO',
CASE  WHEN NULLIF(CAST(TRIM("Mun Trab") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Mun Trab" AS INT) END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
CASE  WHEN NULLIF(CAST(TRIM("Natureza Jurídica") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Natureza Jurídica" AS INT) END AS 'COD_NATUREZA_JURIDICA',
CAST("Qtd Hora Contr" AS INT)  AS 'QTD_HORAS_CONTRATUAIS',
CASE  WHEN NULLIF(CAST(TRIM("Raça Cor") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Raça Cor" AS INT) END AS 'COD_RACA_COR',
CASE  WHEN NULLIF(CAST(TRIM("Sexo Trabalhador") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Sexo Trabalhador" AS INT) END AS 'COD_SEXO_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM("Tamanho Estabelecimento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tamanho Estabelecimento" AS INT) END AS 'COD_TAMANHO_ESTABELECIMENTO',
CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT)  AS 'TEMPO_EMPREGADO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Admissão") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Admissão" AS INT) END AS 'COD_TIPO_ADMISSAO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Defic") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Defic" AS INT) END AS 'COD_TIPO_DEFICIENCIA',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Vínculo") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Vínculo" AS INT) END AS 'COD_TIPO_EMPREGATICIO',
CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Dezembro (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Dezembro (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Média (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Média (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_MEDIA',
CAST(Idade AS INT)  AS 'IDADE_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM(Município) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Município AS INT) END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
CASE  WHEN NULLIF(CAST(TRIM(Nacionalidade) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Nacionalidade AS INT) END AS 'COD_NACIONALIDADE',
CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2012_RS2012]
WHERE Município <> 'Município'
UNION ALL
--#########
SELECT
CASE  WHEN NULLIF(CAST(TRIM("CBO Ocupação 2002") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CBO Ocupação 2002" AS INT) END AS 'COD_OCUPACAO',
CASE  WHEN NULLIF(CAST(TRIM("CNAE 2.0 Subclasse") AS INT), 0) IS NULL THEN -1   ELSE  CAST("CNAE 2.0 Subclasse" AS INT) END AS 'COD_SUBCLASSE',
CASE  WHEN NULLIF(CAST(TRIM("Escolaridade após 2005") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Escolaridade após 2005" AS INT) END AS 'COD_GRAU_INSTRUCAO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Etária") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Etária" AS INT) END AS 'COD_FAIXA_ETARIA',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Hora Contrat") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Hora Contrat" AS INT) END AS 'COD_FAIXA_HORA_CONTRATUAL',
CASE  WHEN TRIM("Faixa Remun Dezem (SM)")  IS NULL OR TRIM("Faixa Remun Dezem (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Dezem (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_DEZEMBRO',
CASE  WHEN TRIM("Faixa Remun Média (SM)")  IS NULL OR TRIM("Faixa Remun Média (SM)") LIKE '99'  THEN -1   ELSE  CAST("Faixa Remun Média (SM)" AS INT) END AS 'COD_FAIXA_REMUNERACAO_MEDIA_ANO',
CASE  WHEN NULLIF(CAST(TRIM("Faixa Tempo Emprego") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Faixa Tempo Emprego" AS INT) END AS 'COD_FAIXA_TEMPO_EMPREGO',
CASE WHEN CAST("Ind Portador Defic" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PCD',
CASE WHEN CAST("Ind Simples" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'EMPRESA_OPTANTE_SIMPLES',
2012 AS 'ANO_RAIS',
CASE WHEN "Mês Admissão" IS NULL OR "Mês Admissão"  = 0 THEN 01/01/1900 ELSE DATE(2012 || '-' || "Mês Admissão" || '-28')  END AS 'DATA_ADMISSAO',               
CASE WHEN "Mês Desligamento" IS NULL OR "Mês Desligamento" = 0 THEN 01/01/1900 ELSE DATE(2012 || '-' || "Mês Desligamento" || '-28')  END AS 'DATA_DEMISSAO',  
CASE  WHEN NULLIF(CAST(TRIM("Motivo Desligamento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Motivo Desligamento" AS INT) END AS 'COD_MOTIVO_DESLIGAMENTO',
CASE  WHEN NULLIF(CAST(TRIM("Mun Trab") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Mun Trab" AS INT) END AS 'COD_MUNICIPIO_SERVICO_PRESTADO',
CASE  WHEN NULLIF(CAST(TRIM("Natureza Jurídica") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Natureza Jurídica" AS INT) END AS 'COD_NATUREZA_JURIDICA',
CAST("Qtd Hora Contr" AS INT)  AS 'QTD_HORAS_CONTRATUAIS',
CASE  WHEN NULLIF(CAST(TRIM("Raça Cor") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Raça Cor" AS INT) END AS 'COD_RACA_COR',
CASE  WHEN NULLIF(CAST(TRIM("Sexo Trabalhador") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Sexo Trabalhador" AS INT) END AS 'COD_SEXO_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM("Tamanho Estabelecimento") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tamanho Estabelecimento" AS INT) END AS 'COD_TAMANHO_ESTABELECIMENTO',
CAST(REPLACE("Tempo Emprego",',','.') AS FLOAT)  AS 'TEMPO_EMPREGADO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Admissão") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Admissão" AS INT) END AS 'COD_TIPO_ADMISSAO',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Defic") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Defic" AS INT) END AS 'COD_TIPO_DEFICIENCIA',
CASE  WHEN NULLIF(CAST(TRIM("Tipo Vínculo") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Tipo Vínculo" AS INT) END AS 'COD_TIPO_EMPREGATICIO',
CASE WHEN CAST("Vínculo Ativo 31/12" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'VINCULO_ATIVO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Dezembro (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Dezembro (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO',
CAST(REPLACE("Vl Remun Dezembro Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_DEZEMBRO',
CASE  WHEN NULLIF(CAST(TRIM("Vl Remun Média (SM)") AS INT), 0) IS NULL THEN -1   ELSE  CAST("Vl Remun Média (SM)" AS INT) END AS 'COD_FAIXA_SALARIAL_MEDIA_ANO',
CAST(REPLACE("Vl Remun Média Nom",',','.') AS FLOAT)  AS 'VALOR_REMUNERACAO_MEDIA',
CAST(Idade AS INT)  AS 'IDADE_TRABALHADOR',
CASE  WHEN NULLIF(CAST(TRIM(Município) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Município AS INT) END AS 'COD_MUNICIPIO_ESTABELECIMENTO',
CASE  WHEN NULLIF(CAST(TRIM(Nacionalidade) AS INT), 0) IS NULL THEN -1   ELSE  CAST(Nacionalidade AS INT) END AS 'COD_NACIONALIDADE',
CASE WHEN CAST("Ind Trab Intermitente" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_INTERMITENTE',
CASE WHEN CAST("Ind Trab Parcial" AS INT) = 1 THEN 'Sim' ELSE 'Não' END AS 'TRABALHADOR_PARCIAL'
FROM [2012_SC2012]
WHERE Município <> 'Município'
