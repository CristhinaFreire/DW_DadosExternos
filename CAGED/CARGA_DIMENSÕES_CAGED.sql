--###############################################################################################################################################--
--#								Layout dos Microdados Identificados do Novo CAGED - Base de Movimentações										#--
--###############################################################################################################################################--
--#Variável				#	Descrição																							#Código			#--
--###############################################################################################################################################--
--#competenciadec		#	Competência da declaração																			#<date>			#--
--#competenciamov		#	Competência da movimentação																			#<date>			#--
--#região				#	Região geográfica de acordo com o código do IBGE													#<99>			#--
--#uf					#	Unidade da federação de acordo com o código do IBGE													#<99>			#--
--#município			#	Código do Município																					#<999999>		#--
--#seção				#	Código da seção da classificação nacional de atividade econômica (CNAE 2.0)							#<N>			#--
--#subclasse			#	Código da subclasse da classificação nacional de atividade econômica (CNAE 2.0)						#<9999999>		#--
--#fonte				#	Fonte da movimentação																				#<9>			#--
--#categoria			#	Categoria de trabalhador																			#<999>			#--
--#cbo2002ocupação		#	Código da ocupação do trabalhador de acordo com a Classificação Brasileira de Ocupações (CBO 2002)	#<999999>		#--
--#graudeinstrução		#	Grau de instrução do trabalhador																	#<99>			#--
--#idade				#	Idade do trabalhador																				#<999>			#--
--#sexo					#	Sexo do trabalhador																					#<9>			#--
--#tipoempregador		#	Tipo de empregador																					#<9>			#--
--#tipoestabelecimento	#	Tipo de estabelecimento																				#<9>			#--
--#tipomovimentação		#	Tipo de movimentação																				#<99>			#--
--#indtrabparcial		#	Indicador de trabalhador parcial																	#<9>			#--
--#indtrabintermitente	#	Indicador de trabalhador intermitente																#<9>			#--
--#tamestabejan			#	Faixa de Emprego no início de Janeiro do Estabelecimento											#<99>			#----#salário				#	Salário mensal declarado																			#<999999999.99>	#--
--#horascontratuais		#	Horas contratuais																					#<99>			#--
--#tipodedeficiência	#	Tipo de deficiência do trabalhador																	#<9>			#--
--#raçacor				#	Raça ou cor do trabalhador																			#<9>			#--
--#indicadoraprendiz	#	Indicador de trabalhador aprendiz																	#<9>			#--
--#saldomovimentação	#	Valor da movimentação em termos de saldo															#<99>			#--
--###############################################################################################################################################--

-- ABAIXO SEGUE A CRIAÇÃO DAS DIMENSÕES DO CAGED

--CRIAÇÃO DA TABELA DE DIMENSÃO CAGED_DimFonteMovimentacao
IF OBJECT_ID('CAGED_DimFonteMovimentacao', 'U') IS NOT NULL
    DROP TABLE CAGED_DimFonteMovimentacao;

CREATE TABLE CAGED_DimFonteMovimentacao (
    ID INT ,
    FONTE_MOVIMENTACAO VARCHAR(50)
);

INSERT INTO CAGED_DimFonteMovimentacao (ID, FONTE_MOVIMENTACAO)
VALUES 
    (1, 'Dado Original/Sem Imputação'),
    (2, 'Desligamentos Imputados do CAGED'),
    (3, 'Desligamentos Imputados do EmpregadorWEB');


--CRIAÇÃO DA TABELA DE DIMENSÃO CAGED_DimCategoriaTrabalhador
IF OBJECT_ID('CAGED_DimCategoriaTrabalhador', 'U') IS NOT NULL
    DROP TABLE CAGED_DimCategoriaTrabalhador;

CREATE TABLE CAGED_DimCategoriaTrabalhador (
    ID INT ,
    CATEGORIA_TRABALHADOR VARCHAR(150)
);

INSERT INTO CAGED_DimCategoriaTrabalhador (ID, CATEGORIA_TRABALHADOR)
VALUES 
    (101, 'Empregado - Geral, inclusive o empregado público da administração direta ou indireta contratado pela CLT'),
    (102, 'Empregado - Trabalhador rural por pequeno prazo da Lei 11.718/2008'),
    (103, 'Empregado - Aprendiz'),
    (104, 'Empregado - Doméstico'),
    (105, 'Empregado - Contrato a termo firmado nos termos da Lei 9.601/1998'),
    (106, 'Trabalhador temporário - Contrato nos termos da Lei 6.019/1974'),
    (107, 'Empregado - Contrato de trabalho Verde e Amarelo - sem acordo para antecipação mensal da multa rescisória do FGTS'),
    (108, 'Empregado - Contrato de trabalho Verde e Amarelo - com acordo para antecipação mensal da multa rescisória do FGTS'),
    (111, 'Empregado - Contrato de trabalho intermitente'),
    (999, 'Não Identificado');


--CRIAÇÃO DA TABELA DE DIMENSÃO CAGED_DimGrauInstrucao
IF OBJECT_ID('CAGED_DimGrauInstrucao', 'U') IS NOT NULL
    DROP TABLE CAGED_DimGrauInstrucao;

CREATE TABLE CAGED_DimGrauInstrucao (
    ID INT ,
    GRAU_INSTRUCAO VARCHAR(50),
    NIVEL VARCHAR(50),
    ID_NIVEL INT
);

INSERT INTO CAGED_DimGrauInstrucao (ID, GRAU_INSTRUCAO, NIVEL, ID_NIVEL)
VALUES 
    (1, 'Analfabeto', 'Até Ensino fundamental', 1),
	(-1, 'Ignorado', 'Ignorado', -1),
    (2, 'Até 5ª Incompleto', 'Até Ensino fundamental', 1),
    (3, '5ª Completo Fundamental', 'Até Ensino fundamental', 1),
    (4, '6ª a 9ª Fundamental', 'Até Ensino fundamental', 1),
    (5, 'Fundamental Completo', 'Até Ensino fundamental', 1),
    (6, 'Médio Incompleto', 'Até Ensino médio', 2),
    (7, 'Médio Completo', 'Até Ensino médio', 2),
    (8, 'Superior Incompleto', 'Até Superior completo', 3),
    (9, 'Superior Completo', 'Até Superior completo', 3),
    (10, 'Mestrado', 'Pós-graduação completa', 4),
    (11, 'Doutorado', 'Pós-graduação completa', 4),
    (80, 'Pós Doutorado', 'Pós-graduação completa', 4),
    (99, 'Não Identificado', 'Não Identificado', 5);

--CRIAÇÃO DA TABELA DE DIMENSÃO CAGED_DimSexoTrabalhador
IF OBJECT_ID('CAGED_DimSexoTrabalhador', 'U') IS NOT NULL
    DROP TABLE CAGED_DimSexoTrabalhador;

CREATE TABLE CAGED_DimSexoTrabalhador (
    ID INT ,
    SEXO_TRABALHADOR VARCHAR(50)
);

INSERT INTO CAGED_DimSexoTrabalhador (ID, SEXO_TRABALHADOR)
VALUES 
    (1, 'Homem'),
    (3, 'Mulher'),
    (9, 'Não Identificado');

--CRIAÇÃO DA TABELA DE DIMENSÃO CAGED_DimTipoEmpregador
IF OBJECT_ID('CAGED_DimTipoEmpregador', 'U') IS NOT NULL
    DROP TABLE CAGED_DimTipoEmpregador;

CREATE TABLE CAGED_DimTipoEmpregador (
    ID INT ,
    TIPO_EMPREGADOR VARCHAR(50)
);

INSERT INTO CAGED_DimTipoEmpregador (ID, TIPO_EMPREGADOR)
VALUES 
    (0, 'CNPJ RAIZ'),
    (2, 'CPF'),
    (9, 'Não Identificado');


--CRIAÇÃO DA TABELA DE DIMENSÃO CAGED_DimTipoEstabelecimento
IF OBJECT_ID('CAGED_DimTipoEstabelecimento', 'U') IS NOT NULL
    DROP TABLE CAGED_DimTipoEstabelecimento;

CREATE TABLE CAGED_DimTipoEstabelecimento (
    ID INT ,
    TIPO_ESTABELECIMENTO VARCHAR(255)
);

INSERT INTO CAGED_DimTipoEstabelecimento (ID, TIPO_ESTABELECIMENTO)
VALUES 
    (1, 'CNPJ'),
    (3, 'CAEPF(Cadastro de Atividade Econômica de Pessoa Física)'),
    (4, 'CNO(Cadastro Nacional de Obra)'),
    (5, 'CEI(CAGED)'),
	(30,'CEI(CAGED)'),
    (9, 'Não Identificado');


-- CRIAÇÃO DA TABELA DE DIMENSÃO CAGED_DimIndicadorTrabalhadorParcial
IF OBJECT_ID('CAGED_DimIndTrabalhadorParcial', 'U') IS NOT NULL
    DROP TABLE CAGED_DimIndTrabalhadorParcial;

CREATE TABLE CAGED_DimIndTrabalhadorParcial (
    ID INT ,
    IND_TRABALHADOR_PARCIAL VARCHAR(50)
);

INSERT INTO CAGED_DimIndTrabalhadorParcial (ID, IND_TRABALHADOR_PARCIAL)
VALUES 
    (0, 'Não'),
    (1, 'Sim'),
    (9, 'Não Identificado');

-- CRIAÇÃO DA TABELA DE DIMENSÃO CAGED_DimIndTrabalhadorIntermitente
IF OBJECT_ID('CAGED_DimIndTrabalhadorIntermitente', 'U') IS NOT NULL
    DROP TABLE CAGED_DimIndTrabalhadorIntermitente;

CREATE TABLE CAGED_DimIndTrabalhadorIntermitente (
    ID INT ,
    IND_TRABALHADOR_INTERMITENTE VARCHAR(50)
);

INSERT INTO CAGED_DimIndTrabalhadorIntermitente (ID, IND_TRABALHADOR_INTERMITENTE)
VALUES 
    (0, 'Não'),
    (1, 'Sim'),
    (9, 'Não Identificado');

-- CRIAÇÃO DA TABELA DE DIMENSÃO CAGED_DimTipoDeficiencia
IF OBJECT_ID('CAGED_DimTipoDeficiencia', 'U') IS NOT NULL
    DROP TABLE CAGED_DimTipoDeficiencia;

CREATE TABLE CAGED_DimTipoDeficiencia (
    ID INT ,
    TIPO_DEFICIENCIA VARCHAR(50)
);

INSERT INTO CAGED_DimTipoDeficiencia (ID, TIPO_DEFICIENCIA)
VALUES 
    (0, 'Não Deficiente'),
	(-1,'Ignorado'),
    (1, 'Física'),
    (2, 'Auditiva'),
    (3, 'Visual'),
    (4, 'Intelectual (Mental)'),
    (5, 'Múltipla'),
    (6, 'Reabilitado'),
    (9, 'Não Identificado');

--CRIAÇÃO DA TABELA DE DIMENSÃO CAGED_DimTipoMovimentacao
IF OBJECT_ID('CAGED_DimTipoMovimentacao', 'U') IS NOT NULL
    DROP TABLE CAGED_DimTipoMovimentacao;

CREATE TABLE CAGED_DimTipoMovimentacao (
    ID INT ,
    TIPO_MOVIMENTACAO VARCHAR(255)
);

INSERT INTO CAGED_DimTipoMovimentacao (ID, TIPO_MOVIMENTACAO)
VALUES 
    (10,  'Admissão por primeiro emprego'),
	(1,   'Admissão por primeiro emprego'),
    (20,  'Admissão por reemprego'),
	(2,   'Admissão por reemprego'),
    (25,  'Admissão por contrato trabalho prazo determinado'),
    (31,  'Desligamento por demissão sem justa causa'),
    (32,  'Desligamento por demissão com justa causa'),
	(4,   'Desligamento por demissão sem justa causa'),
    (5,   'Desligamento por demissão com justa causa'),
    (33,  'Culpa Recíproca'),
    (35,  'Admissão por reintegração'),
	(100, 'Admissão por reintegração'),
    (40,  'Desligamento a pedido'),
	(6,   'Desligamento a pedido'),
    (43,  'Término contrato trabalho prazo determinado'),
    (45,  'Desligamento por Término de contrato'),
	(11,  'Desligamento por Término de contrato'),
    (50,  'Desligamento por aposentadoria'),
	(7,   'Desligamento por aposentadoria'),
    (60,  'Desligamento por morte'),
	(8,   'Desligamento por morte'),
    (70,  'Admissão por transferência'),
    (80,  'Desligamento por transferência'),
	(3,   'Admissão por transferência'),
    (9,   'Desligamento por transferência'),
    (90,  'Desligamento por Acordo entre empregado e empregador'),
    (98,  'Desligamento de Tipo Ignorado'),
	(-1,  'Ignorado'),
    (99,  'Não Identificado');

-- CRIAÇÃO DA TABELA DE DIMENSÃO CAGED_DimRacaCor
IF OBJECT_ID('CAGED_DimRacaCor', 'U') IS NOT NULL
    DROP TABLE CAGED_DimRacaCor;

CREATE TABLE CAGED_DimRacaCor (
    ID INT ,
    RACA_COR VARCHAR(50)
);

INSERT INTO CAGED_DimRacaCor (ID, RACA_COR)
VALUES 
    (1, 'Branca'),
    (2, 'Preta'),
    (3, 'Parda'),
    (4, 'Amarela'),
    (5, 'Indígena'),
    (6, 'Não informada'),
    (9, 'Não Identificado');

-- CRIAÇÃO DA TABELA DE DIMENSÃO CAGED_DimIndAprendiz
IF OBJECT_ID('CAGED_DimIndAprendiz', 'U') IS NOT NULL
    DROP TABLE CAGED_DimIndAprendiz;

CREATE TABLE CAGED_DimIndAprendiz (
    ID INT ,
    IND_APRENDIZ VARCHAR(50)
);

INSERT INTO CAGED_DimIndAprendiz (ID, IND_APRENDIZ)
VALUES 
    (0, 'Não'),
    (1, 'Sim'),
    (9, 'Não Identificado');

-- CRIAÇÃO DA TABELA DE DIMENSÃO CAGED_DimFaixaEmpregoInicioJaneiro
IF OBJECT_ID('CAGED_DimTamanhoEmpresaJaneiro', 'U') IS NOT NULL
    DROP TABLE CAGED_DimTamanhoEmpresaJaneiro;

CREATE TABLE CAGED_DimTamanhoEmpresaJaneiro (
    ID INT ,
    TAM_EMPRESA_JANEIRO
 VARCHAR(50)
);

INSERT INTO CAGED_DimTamanhoEmpresaJaneiro (ID, TAM_EMPRESA_JANEIRO)
VALUES 
    (1, '1 colaborador'),
    (2, 'De 1 a 4 colaboradores'),
    (3, 'De 5 a 9 colaboradores'),
    (4, 'De 10 a 19 colaboradores'),
    (5, 'De 20 a 49 colaboradores'),
    (6, 'De 50 a 99 colaboradores'),
    (7, 'De 100 a 249 colaboradores'),
    (8, 'De 250 a 499 colaboradores'),
    (9, 'De 500 a 999 colaboradores'),
    (10, '1000 ou mais colaboradores'),
	(-1, 'Ignorado'),
    (99, 'Nao Identificado');


