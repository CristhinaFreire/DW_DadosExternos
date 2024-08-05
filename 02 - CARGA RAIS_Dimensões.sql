-- Drop tables if they exist
IF OBJECT_ID('dbo.RAIS_DimTipoAdmissao', 'U') IS NOT NULL
    DROP TABLE dbo.RAIS_DimTipoAdmissao;

IF OBJECT_ID('dbo.RAIS_DimTamanhoEstabelecimento', 'U') IS NOT NULL
    DROP TABLE dbo.RAIS_DimTamanhoEstabelecimento;

IF OBJECT_ID('dbo.RAIS_DimSexoTrabalhador', 'U') IS NOT NULL
    DROP TABLE dbo.RAIS_DimSexoTrabalhador;

IF OBJECT_ID('dbo.RAIS_DimRacaCor', 'U') IS NOT NULL
    DROP TABLE dbo.RAIS_DimRacaCor;

IF OBJECT_ID('dbo.RAIS_DimMotivoDesligamento', 'U') IS NOT NULL
    DROP TABLE dbo.RAIS_DimMotivoDesligamento;

IF OBJECT_ID('dbo.RAIS_DimGrauInstrucao', 'U') IS NOT NULL
    DROP TABLE dbo.RAIS_DimGrauInstrucao;

IF OBJECT_ID('dbo.RAIS_DimTipoDeficiencia', 'U') IS NOT NULL
    DROP TABLE dbo.RAIS_DimTipoDeficiencia;

IF OBJECT_ID('dbo.RAIS_DimTipoEmpregaticio', 'U') IS NOT NULL
    DROP TABLE dbo.RAIS_DimTipoEmpregaticio;

IF OBJECT_ID('dbo.RAIS_DimNacionalidade', 'U') IS NOT NULL
    DROP TABLE dbo.RAIS_DimNacionalidade;

IF OBJECT_ID('dbo.RAIS_DimFaixaEtaria', 'U') IS NOT NULL
    DROP TABLE dbo.RAIS_DimFaixaEtaria;

IF OBJECT_ID('dbo.RAIS_DimFaixaSalarialMediaDezembro', 'U') IS NOT NULL
    DROP TABLE dbo.RAIS_DimFaixaSalarialMediaDezembro;

IF OBJECT_ID('dbo.RAIS_DimFaixaSalarialMediaAno', 'U') IS NOT NULL
    DROP TABLE dbo.RAIS_DimFaixaSalarialMediaAno;

IF OBJECT_ID('dbo.RAIS_DimFaixaHoraContratual', 'U') IS NOT NULL
    DROP TABLE dbo.RAIS_DimFaixaHoraContratual;

IF OBJECT_ID('dbo.RAIS_DimFaixaTempoEmprego', 'U') IS NOT NULL
    DROP TABLE dbo.RAIS_DimFaixaTempoEmprego;

IF OBJECT_ID('dbo.RAIS_DimVinculoAtivoDezembro', 'U') IS NOT NULL
    DROP TABLE dbo.RAIS_DimVinculoAtivoDezembro;




-- Create tables

CREATE TABLE RAIS_DimVinculoAtivoDezembro
(ID int,
VINCULO_ATIVO_DEZEMBRO varchar(3)
)
INSERT INTO RAIS_DimVinculoAtivoDezembro
 (ID, VINCULO_ATIVO_DEZEMBRO)
values
(1,'Sim'),
(2,'Não')


CREATE TABLE dbo.RAIS_DimTipoAdmissao (
    COD_TIPO_ADMISSAO INT PRIMARY KEY,
    TIPO_ADMISSAO NVARCHAR(MAX),
    DESCRICAO NVARCHAR(MAX)
);

INSERT INTO dbo.RAIS_DimTipoAdmissao (COD_TIPO_ADMISSAO, TIPO_ADMISSAO, DESCRICAO)
VALUES
(0, 'Não Admitido no Ano', 'Não Admitido no Ano'),
(1, 'Primeiro Emprego', 'Admissão de empregado no primeiro emprego ou nomeação de servidor em caráter efetivo ou em comissão, no primeiro emprego.'),
(2, 'Reemprego', 'Admissão de empregado com emprego anterior (reemprego) ou nomeação de servidor em caráter efetivo ou em comissão, com emprego anterior (reemprego).'),
(3, 'Transferência com Ônus', 'Transferência de empregado oriundo de estabelecimento da mesma empresa ou de outra empresa com ônus para a cedente.'),
(4, 'Transferência sem Ônus', 'Transferência de empregado oriundo de estabelecimento da mesma empresa ou de outra empresa sem ônus para a cedente.'),
(6, 'Reintegração', 'Reintegração (data relativa aos efeitos financeiros da reintegração)'),
(7, 'Recondução', 'Recondução (específico para servidor público).'),
(8, 'Reversão', 'Reversão, (específico para servidor público).'),
(9, 'Requisição', 'Requisição'),
(10, 'Exercício provisório ou exercício descentralizado de servidor oriundo do mesmo órgão/entidade ou de outro órgão/entidade', 'Exercício provisório de servidor oriundo do mesmo órgão/entidade ou de outro órgão/entidade.'),
(11, 'Readaptação (específico para servidor público)', 'Readaptação (específico para servidor público)'),
(12, 'Redistribuição (específico para servidor público)', 'Redistribuição (específico para servidor público).'),
(13, 'Exercício descentralizado de servidor oriundo do mesmo órgão/entidade ou de outro órgão/entidade', 'Exercício descentralizado de servidor oriundo do mesmo órgão/entidade ou de outro órgão/entidade.'),
(14, 'Remoção (específico para servidor público)', 'Remoção (específico para servidor público)'),
(-1, 'Não Informado', 'Não Informado');

CREATE TABLE dbo.RAIS_DimTamanhoEstabelecimento (
    COD_TAMANHO_ESTABELECIMENTO INT PRIMARY KEY,
    TAMANHO_ESTABELECIMENTO NVARCHAR(MAX)
);

INSERT INTO dbo.RAIS_DimTamanhoEstabelecimento (COD_TAMANHO_ESTABELECIMENTO, TAMANHO_ESTABELECIMENTO)
VALUES
(1, 'Zero'),
(2, 'Ate 4'),
(3, 'De 5 a 9'),
(4, 'De 10 a 19'),
(5, 'De 20 a 49'),
(6, 'De 50 a 99'),
(7, 'De 100 a 249'),
(8, 'De 250 a 499'),
(9, 'De 500 a 999'),
(10, '1000 ou mais'),
(-1, 'Não Informado');

-- RAIS_DimSexoTrabalhador
CREATE TABLE dbo.RAIS_DimSexoTrabalhador (
    COD_SEXO_TRABALHADOR INT PRIMARY KEY,
    SEXO_TRABALHADOR NVARCHAR(MAX)
);

INSERT INTO dbo.RAIS_DimSexoTrabalhador (COD_SEXO_TRABALHADOR, SEXO_TRABALHADOR)
VALUES
(1, 'Masculino'),
(2, 'Feminino'),
(-1, 'Não identificado');

-- RAIS_DimRacaCor
CREATE TABLE dbo.RAIS_DimRacaCor (
    COD_RACA_COR INT PRIMARY KEY,
    RACA_COR NVARCHAR(MAX)
);

INSERT INTO dbo.RAIS_DimRacaCor (COD_RACA_COR, RACA_COR)
VALUES
(1, 'Indígena'),
(2, 'Branca'),
(4, 'Preta'),
(6, 'Amarela'),
(8, 'Parda'),
(9, 'Não Identificado'),
(-1, 'Não Informado');

-- RAIS_DimMotivoDesligamento
CREATE TABLE dbo.RAIS_DimMotivoDesligamento (
    COD_MOTIVO_DESLIGAMENTO INT PRIMARY KEY,
    MOTIVO_DESLIGAMENTO NVARCHAR(MAX)
);

INSERT INTO dbo.RAIS_DimMotivoDesligamento (COD_MOTIVO_DESLIGAMENTO, MOTIVO_DESLIGAMENTO)
VALUES
(10, 'Rescisão com justa causa por iniciativa do empregador ou servidor demitido'),
(11, 'Rescisão sem justa causa por iniciativa do empregador.'),
(12, 'Término do contrato de trabalho.'),
(20, 'Rescisão com justa causa por iniciativa do empregado (rescisão indireta).'),
(21, 'Rescisão sem justa causa por iniciativa do empregado ou exoneração a pedido'),
(22, 'Posse em outro cargo inacumulável (específico para servidor público)'),
(30, 'Transferência de empregado entre estabelecimentos da mesma empresa ou para outra empresa, com ônus para a cedente'),
(31, 'Transferência de empregado entre estabelecimentos da mesma empresa ou para outra empresa, sem ônus para a cedente'),
(32, 'Readaptação ou redistribuição (específico para servidor publico)'),
(33, 'Cessão'),
(34, 'Redistribuição (específico para servidor publico)'),
(40, 'Mudança de regime trabalhista.'),
(50, 'Reforma de militar para a reserva remunerada.'),
(60, 'Falecimento.'),
(62, 'Falecimento decorrente de acidente do trabalho típico (que ocorre no exercício de atividades profissionais a serviço da empresa)'),
(63, 'Falecimento decorrente de acidente do trabalho de trajeto (ocorrido no trajeto residência-trabalho-residência)'),
(64, 'Falecimento decorrente de doença profissional.'),
(70, 'Aposentadoria por tempo de serviço, com rescisão contratual.'),
(71, 'Aposentadoria por tempo de serviço, sem rescisão contratual.'),
(72, 'Aposentadoria por idade, com rescisão contratual.'),
(73, 'Aposentadoria por invalidez, decorrente de acidente do trabalho.'),
(74, 'Aposentadoria por invalidez, decorrente de doença profissional.'),
(75, 'Aposentadoria compulsória.'),
(76, 'Aposentadoria por invalidez, exceto a decorrente de doença profissional ou acidente do trabalho.'),
(78, 'Aposentadoria por idade, sem rescisão contratual.'),
(79, 'Aposentadoria especial, com rescisão contratual.'),
(80, 'Aposentadoria especial, sem rescisão contratual.'),
(90, 'Desligamento por Acordo Empregado e Empregador'),
(0, 'Não desligado no ano'),
(-1, 'Não Informado');

-- RAIS_DimGrauInstrucao
CREATE TABLE dbo.RAIS_DimGrauInstrucao (
    COD_GRAU_INSTRUCAO INT PRIMARY KEY,
    GRAU_INSTRUCAO_ORIGINAL NVARCHAR(MAX),
    GRAU_INSTRUCAO NVARCHAR(MAX),
    DESCRICAO NVARCHAR(MAX)
);

INSERT INTO dbo.RAIS_DimGrauInstrucao (COD_GRAU_INSTRUCAO, GRAU_INSTRUCAO_ORIGINAL, GRAU_INSTRUCAO, DESCRICAO)
VALUES
(1, 'ANALFABETO', 'Analfabeto', 'Analfabeto, inclusive o que, embora tenha recebido instrução, não se alfabetizou'),
(2, 'ATE 5.A INC', 'Até o 5º ano do fundamental', 'Até o 5º ano incompleto do Ensino Fundamental (antiga 4ª série) ou que se tenha alfabetizado sem ter frequentado escola regular'),
(3, '5.A CO FUND', '5º ano do fundamental completo', '5º ano completo do Ensino Fundamental'),
(4, '6. A 9. FUND', '6º a 9º ano do fundamental', 'Do 6º ao 9º ano do Ensino Fundamental incompleto (antiga 5ª à 8ª série)'),
(5, 'FUND COMPL', 'Fundamental completo', 'Ensino Fundamental completo'),
(6, 'MEDIO INCOMP', 'Médio incompleto', 'Ensino Médio incompleto'),
(7, 'MEDIO COMPL', 'Médio completo', 'Ensino Médio completo'),
(8, 'SUP. INCOMP', 'Superior incompleto', 'Educação Superior incompleta'),
(9, 'SUP. COMP', 'Superior completo', 'Educação Superior completa'),
(10, 'MESTRADO', 'Mestrado', 'Mestrado completo'),
(11, 'DOUTORADO', 'Doutorado', 'Doutorado completo'),
(-1, 'Não Informado', 'Não Informado', 'Não Informado');

-- RAIS_DimTipoDeficiencia
CREATE TABLE dbo.RAIS_DimTipoDeficiencia (
    COD_TIPO_DEFICIENCIA INT PRIMARY KEY,
    TIPO_DEFICIENCIA NVARCHAR(MAX)
);

INSERT INTO dbo.RAIS_DimTipoDeficiencia (COD_TIPO_DEFICIENCIA, TIPO_DEFICIENCIA)
VALUES
(1, 'Física'),
(2, 'Auditiva'),
(3, 'Visual'),
(4, 'Intelectual'),
(5, 'Multipla'),
(6, 'Reabilitado'),
(0, 'Não deficiente'),
(-1, 'Não Informado');

-- RAIS_DimTipoEmpregaticio
CREATE TABLE dbo.RAIS_DimTipoEmpregaticio (
    COD_TIPO_EMPREGATICIO INT PRIMARY KEY,
    TIPO_EMPREGATICIO NVARCHAR(MAX),
    DESCRICAO NVARCHAR(MAX),
	NOME_VINCULO NVARCHAR(MAX), 
	ROTATIVIDADE_ESTATUTARIO NVARCHAR(MAX), 
	CELESTISTA_ESTATUTARIO NVARCHAR(MAX), 
	VINCULO_PRIVADO_NAO_PRIVADO NVARCHAR(MAX), 
	TIPO_DE_VINCULO NVARCHAR(MAX)
);

INSERT INTO dbo.RAIS_DimTipoEmpregaticio (COD_TIPO_EMPREGATICIO, TIPO_EMPREGATICIO, DESCRICAO, NOME_VINCULO, ROTATIVIDADE_ESTATUTARIO, CELESTISTA_ESTATUTARIO, VINCULO_PRIVADO_NAO_PRIVADO, TIPO_DE_VINCULO)
VALUES
(10, 'CLT U/PJ IND', 'Trabalhador urbano vinculado a empregador pessoa jurídica por contrato de trabalho regido pela CLT, por prazo indeterminado','CLT U/ PJ Ind', 'Não estatutário', 'Celestista', 'Privado', 'Celestista Prazo Indeterminado'),
(15, 'CLT U/PF IND', 'Trabalhador urbano vinculado a empregador pessoa física por contrato de trabalho regido pela CLT, por prazo indeterminado','CLT U/ PF Ind', 'Não estatutário', 'Celestista', 'Privado', 'Celestista Prazo Indeterminado'),
(20, 'CLT R/PJ IND', 'Trabalhador rural vinculado a empregador pessoa jurídica por contrato de trabalho regido pela Lei nº 5.889/1973, por prazo indeterminado', 'CLT R/ PJ Ind', 'Não estatutário', 'Celestista', 'Privado', 'Celestista Prazo Indeterminado'),
(25, 'CLT R/PF IND', 'Trabalhador rural vinculado a empregador pessoa física por contrato de trabalho regido pela Lei nº 5.889/1973, por prazo indeterminado','CLT R/ PF Ind', 'Não estatutário', 'Celestista', 'Privado', 'Celestista Prazo Indeterminado'),
(30, 'ESTATUTARIO', 'Servidor regido pelo Regime Jurídico Único (federal, estadual e municipal) e militar, vinculado a Regime Próprio de Previdência','Estatutário', 'Estatutário', 'Estatutário', 'Estat./Diretor/Público', 'Estatutário'),
(31, 'ESTAT RGPS', 'Servidor regido pelo Regime Jurídico Único (federal, estadual e municipal) e militar, vinculado ao Regime Geral de Previdência Social','Estatutário RGPS', 'Estatutário', 'Estatutário', 'Estat./Diretor/Público', 'Estatutário'),
(35, 'ESTAT N/EFET', 'Servidor público não efetivo (demissível ad nutum ou admitido por meio de legislação especial, não-regido pela CLT)','Estatutário não Efetivo', 'Estatutário', 'Estatutário', 'Estat./Diretor/Público', 'Estatutário'),
(40, 'AVULSO', 'Trabalhador avulso (trabalho administrado pelo sindicato da categoria ou pelo órgão gestor de mão-de-obra) para o qual é devido depósito de FGTS (CF/1988), art. 7º, inciso III','Avulso', 'Não estatutário', 'Outros', 'Privado', 'Avulso'),
(50, 'TEMPORARIO', 'Trabalhador temporário, regido pela Lei nº 6.019, de 3 de janeiro de 1974','Temporário', 'Não estatutário', 'Outros', 'Privado', 'Temporário'),
(55, 'APREND CONTR', 'Aprendiz contratado nos termos do art. 428 da CLT, regulamentado pelo Decreto nº 5.598, de 1º de dezembro de 2005','Aprendiz', 'Não estatutário', 'Outros', 'Privado', 'Aprendiz'),
(60, 'CLT U/PJ DET', 'Trabalhador urbano vinculado a empregador pessoa jurídica por contrato de trabalho regido pela CLT, por tempo determinado ou obra certa','CLT U/ PJ Determinado', 'Não estatutário', 'Celestista', 'Privado', 'Celestista Prazo Determinado'),
(65, 'CLT U/PF DET', 'Trabalhador urbano vinculado a empregador pessoa física por contrato de trabalho regido pela CLT, por tempo determinado ou obra certa','CLT U/ PF Determinado', 'Não estatutário', 'Celestista', 'Privado', 'Celestista Prazo Determinado'),
(70, 'CLT R/PJ DET', 'Trabalhador rural vinculado a empregador pessoa jurídica por contrato de trabalho regido pela Lei nº 5.889/1973, por prazo determinado','CLT R/ PJ Determinado', 'Não estatutário', 'Celestista', 'Privado', 'Celestista Prazo Determinado'),
(75, 'CLT R/PF DET', 'Trabalhador rural vinculado a empregador pessoa física por contrato de trabalho regido pela Lei nº 5.889/1973, por prazo determinado','CLT R/ PF Determinado', 'Não estatutário', 'Celestista', 'Privado', 'Celestista Prazo Determinado'),
(80, 'DIRETOR', 'Diretor sem vínculo empregatício para o qual a empresa/entidade tenha optado por recolhimento ao FGTS ou Dirigente Sindical','Diretor', 'Não estatutário', 'Outros', 'Estat./Diretor/Público', 'Diretor'),
(90, 'CONT PRZ DET', 'Contrato de Trabalho por Prazo Determinado, regido pela Lei nº 9.601, de 21 de janeiro de 1998', 'Contrat Prazo Determinado', 'Não estatutário', 'Outros', 'Privado', 'Contrat. Prazo Determinado'),
(95, 'CONT TMP DET', 'Contrato de Trabalho por Tempo Determinado, regido pela Lei nº 8.745, de 9 de dezembro de 1993, com a redação dada pela Lei nº 9.849, de 26 de outubro de 1999','Contrat TMP Determinado', 'Não estatutário', 'Outros', 'Privado', 'Contrat. TMP Determinado'),
(96, 'CONT LEI EST', 'Contrato de Trabalho por Prazo Determinado, regido por Lei Estadual','Contrat Lei Estadual', 'Não estatutário', 'Outros', 'Estat./Diretor/Público', 'Contrato Lei Estadual/Municipal'),
(97, 'CONT LEI MUN', 'Contrato de Trabalho por Prazo Determinado, regido por Lei Municipal','Contrat Lei Municipal', 'Não estatutário', 'Outros', 'Estat./Diretor/Público', 'Contrato Lei Estadual/Municipal'),
(-1, 'Não Informado', 'Não Informado','Não Informado', 'Não Informado', 'Não Informado', 'Não Informado','Não Informado');




-- RAIS_DimNacionalidade
CREATE TABLE dbo.RAIS_DimNacionalidade (
    COD_NACIONALIDADE INT PRIMARY KEY,
    NACIONALIDADE NVARCHAR(MAX)
);

INSERT INTO dbo.RAIS_DimNacionalidade (COD_NACIONALIDADE, NACIONALIDADE)
VALUES
(10, 'Brasileira'),
(20, 'Naturalidade Brasileira'),
(21, 'Argentina'),
(22, 'Boliviana'),
(23, 'Chilena'),
(24, 'Paraguaia'),
(25, 'Uruguaia'),
(26, 'Venezuelano'),
(27, 'Colombiano'),
(28, 'Peruano'),
(29, 'Equatoriano'),
(30, 'Alemã'),
(31, 'Belga'),
(32, 'Britânica'),
(34, 'Canadense'),
(35, 'Espanhola'),
(36, 'Norte-Americana'),
(37, 'Francesa'),
(38, 'Suíça'),
(39, 'Italiana'),
(40, 'Haitiano'),
(41, 'Japonesa'),
(42, 'Chinesa'),
(43, 'Coreana'),
(44, 'Russo'),
(45, 'Portuguesa'),
(46, 'Paquistanês'),
(47, 'Indiano'),
(48, 'Outras Latino-Americanas'),
(49, 'Outras Asiáticas'),
(50, 'Outras Nacionalidades'),
(51, 'Outros Europeus'),
(52, 'Guine Bissau (Guineense)'),
(53, 'Marroquino'),
(54, 'Cubano'),
(55, 'Sirio'),
(56, 'Sul-Coreano'),
(59, 'Bengalesa'),
(60, 'Angolano'),
(61, 'Congolês'),
(62, 'Sul-Africano'),
(63, 'Ganesa'),
(64, 'Senegalesa'),
(65, 'Norte-Coreana'),
(70, 'Outros Africanos'),
(80, 'Outros'),
(-1, 'Não Informado');

-- RAIS_DimFaixaEtaria
CREATE TABLE dbo.RAIS_DimFaixaEtaria (
    COD_FAIXA_ETARIA INT PRIMARY KEY,
    FAIXA_ETARIA NVARCHAR(MAX)
);

INSERT INTO dbo.RAIS_DimFaixaEtaria (COD_FAIXA_ETARIA, FAIXA_ETARIA)
VALUES
(1, '10 A 14 anos'),
(2, '15 A 17 anos'),
(3, '18 A 24 anos'),
(4, '25 A 29 anos'),
(5, '30 A 39 anos'),
(6, '40 A 49 anos'),
(7, '50 A 64 anos'),
(8, '65 anos ou mais'),
(-1, 'Não Informado');

-- RAIS_DimFaixaSalarialMediaDezembro
CREATE TABLE dbo.RAIS_DimFaixaSalarialMediaDezembro (
    COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO INT PRIMARY KEY,
    FAIXA_SALARIAL_MEDIA_DEZEMBRO NVARCHAR(MAX)
);

INSERT INTO dbo.RAIS_DimFaixaSalarialMediaDezembro (COD_FAIXA_SALARIAL_MEDIA_DEZEMBRO, FAIXA_SALARIAL_MEDIA_DEZEMBRO)
VALUES
(00, 'Inativo em dezembro'),
(01, 'Até 0,50 salários mínimos'),
(02, '0,51 a 1,00 salários mínimos'),
(03, '1,01 a 1,50 salários mínimos'),
(04, '1,51 a 2,00 salários mínimos'),
(05, '2,01 a 3,00 salários mínimos'),
(06, '3,01 a 4,00 salários mínimos'),
(07, '4,01 a 5,00 salários mínimos'),
(08, '5,01 a 7,00 salários mínimos'),
(09, '7,01 a 10,00 salários mínimos'),
(10, '10,01 a 15,00 salários mínimos'),
(11, '15,01 a 20,00 salários mínimos'),
(12, 'Mais de 20,00 salários mínimos'),
(-1, 'Não Informado');

-- RAIS_DimFaixaSalarialMediaAno
CREATE TABLE dbo.RAIS_DimFaixaSalarialMediaAno (
    COD_FAIXA_SALARIAL_MEDIA_ANO INT PRIMARY KEY,
    FAIXA_SALARIAL_MEDIA_ANO NVARCHAR(MAX)
);

INSERT INTO dbo.RAIS_DimFaixaSalarialMediaAno (COD_FAIXA_SALARIAL_MEDIA_ANO, FAIXA_SALARIAL_MEDIA_ANO)
VALUES
(00, 'Até 0,50 salários mínimos'),
(01, '0,51 a 1,00 salários mínimos'),
(02, '1,01 a 1,50 salários mínimos'),
(03, '1,51 a 2,00 salários mínimos'),
(04, '2,01 a 3,00 salários mínimos'),
(05, '3,01 a 4,00 salários mínimos'),
(06, '4,01 a 5,00 salários mínimos'),
(07, '5,01 a 7,00 salários mínimos'),
(08, '7,01 a 10,00 salários mínimos'),
(09, '10,01 a 15,00 salários mínimos'),
(10, '15,01 a 20,00 salários mínimos'),
(11, 'Mais de 20,00 salários mínimos'),
(-1, 'Não Informado');

-- RAIS_DimFaixaHoraContratual
CREATE TABLE dbo.RAIS_DimFaixaHoraContratual (
    COD_FAIXA_HORA_CONTRATUAL INT PRIMARY KEY,
    FAIXA_HORA_CONTRATUAL NVARCHAR(MAX)
);

INSERT INTO dbo.RAIS_DimFaixaHoraContratual (COD_FAIXA_HORA_CONTRATUAL, FAIXA_HORA_CONTRATUAL)
VALUES
(01, 'Até 24 horas'),
(02, '25 a 30 horas'),
(03, '31 a 40 horas'),
(04, '41 a 44 horas'),
(05, '45 horas ou mais'),
(-1, 'Não Informado');

-- RAIS_DimFaixaTempoEmprego
CREATE TABLE dbo.RAIS_DimFaixaTempoEmprego (
    COD_FAIXA_TEMPO_EMPREGO INT PRIMARY KEY,
    FAIXA_TEMPO_EMPREGO NVARCHAR(MAX)
);

INSERT INTO dbo.RAIS_DimFaixaTempoEmprego (COD_FAIXA_TEMPO_EMPREGO, FAIXA_TEMPO_EMPREGO)
VALUES
(1, 'Ate 2,9 meses'),
(2, '3,0 a 5,9 meses'),
(3, '6,0 a 11,9 meses'),
(4, '12,0 a 23,9 meses'),
(5, '24,0 a 35,9 meses'),
(6, '36,0 a 59,9 meses'),
(7, '60,0 a 119,9 meses'),
(8, '120,0 meses ou mais'),
(-1, 'Não Informado');


