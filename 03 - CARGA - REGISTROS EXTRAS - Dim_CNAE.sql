/****** Script do comando SelectTopNRows de SSMS  ******/
INSERT INTO [dbo].[IBGE_DimCNAE]
           ([COD_SECAO]
           ,[COD_DIVISAO]
           ,[COD_GRUPO]
           ,[COD_CLASSE]
           ,[COD_SUBCLASSE]
           ,[SECAO]
           ,[DIVISAO]
           ,[GRUPO]
           ,[CLASSE]
           ,[SUBCLASSE]
           ,[GRANDE_AGRUPAMENTO])
VALUES
-- CNAE 3250708
('C', '32', '32.5', '32.50-7', '3250708', 'Indústrias de Transformação', 'Fabricação de Produtos Diversos', 'Fabricação de instrumentos e materiais para uso médico e odontológico e de artigos ópticos', 'Fabricação de instrumentos e materiais para uso médico e odontológico e de artigos ópticos', 'Fabricação de artefatos ópticos não especificados anteriormente', 'Indústrias de Transformação'),
 
-- CNAE 8630505
('Q', '86', '86.3', '86.30-5', '8630505', 'Atividades de Atenção à Saúde Humana e Serviços Sociais', 'Atividades de Atenção à Saúde Humana', 'Atividades de profissionais da área de saúde', 'Atividades de profissionais da área de saúde', 'Atividades de profissionais da área de saúde não especificadas anteriormente', 'Atividades de Atenção à Saúde Humana e Serviços Sociais'),
 
-- CNAE 9999997
('N/A', '99', '99.9', '99.99-9', '9999997', 'Outras Atividades', 'Outras Atividades', 'Outras Atividades', 'Outras Atividades', 'Atividades não especificadas em qualquer outra classe ou subclasse', 'Outras Atividades'),
 
-- CNAE 9999999
('N/A', '99', '99.9', '99.99-9', '9999999', 'Outras Atividades', 'Outras Atividades', 'Outras Atividades', 'Outras Atividades', 'Atividades não especificadas anteriormente em qualquer outra classe ou subclasse', 'Outras Atividades');