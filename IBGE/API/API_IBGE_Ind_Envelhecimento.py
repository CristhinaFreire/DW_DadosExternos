import csv
import requests

link = "https://servicodados.ibge.gov.br/api/v3/agregados/9756/periodos/2010|2022/variaveis/9175?localidades=N6[N3[43]]&classificacao=86[95251]"

# Fazendo a requisição GET para a API
response = requests.get(link)

# Verificando se a requisição foi bem-sucedida (código 200)
if response.status_code == 200:
    data = response.json()  # Convertendo a resposta para JSON
    # Verificando se data é uma lista e pegando o primeiro elemento
    if isinstance(data, list) and len(data) > 0:
        data = data[0]  # Pegando o primeiro elemento da lista
    resultados = data.get('resultados', [])  # Acessando a lista de resultados
    # Abrindo o arquivo CSV para escrita
    with open('indice_envelhecimento_municipio.csv', 'w', newline='', encoding='utf-8') as csvfile:
        writer = csv.writer(csvfile)
        # Escrevendo cabeçalho
        writer.writerow(['Município ID', 'Município', 'Ano', 'Índice de Envelhecimento'])
        # Iterando pelos resultados
        for resultado in resultados:
            municipios = resultado.get('series', [])
            for municipio in municipios:
                nome_municipio = municipio['localidade']['nome']
                id_municipio = municipio['localidade']['id']
                series = municipio.get('serie', {})
                # Iterando sobre cada série de dados (cada período)
                for periodo, valor in series.items():
                    if periodo in ['2010', '2022']:  # Verificando se o período é 2010 ou 2022
                        # Escrevendo linha no arquivo CSV
                        writer.writerow([id_municipio, nome_municipio, periodo, valor])
    print("Dados de Índice de Envelhecimento com ID de Município extraídos com sucesso e salvos em indice_envelhecimento_municipio.csv.")
else:
    print(f"Erro ao acessar a API. Código de status: {response.status_code}")
