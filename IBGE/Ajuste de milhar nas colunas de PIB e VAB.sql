/****** Script do comando SelectTopNRows de SSMS  ******/
UPDATE [DadosExternos].[dbo].[IBGE_FatoEconomiaMunicipios]
SET
    [VAB_AGROPECUARIA] = [VAB_AGROPECUARIA] * 1000,
    [VAB_INDUSTRIA] = [VAB_INDUSTRIA] * 1000,
    [VAB_SERVICOS] = [VAB_SERVICOS] * 1000,
    [VAB_ADM_PUBLICA] = [VAB_ADM_PUBLICA] * 1000,
    [VAB_TOTAL] = [VAB_TOTAL] * 1000,
    [IMPOSTOS_SOBRE_PRODUTOS] = [IMPOSTOS_SOBRE_PRODUTOS] * 1000,
    [PIB] = [PIB] * 1000,
    [PIB_PER_CAPTA] = [PIB_PER_CAPTA] * 1000