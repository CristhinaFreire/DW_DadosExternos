import requests
import csv

# URL da API do IBGE
url = "https://servicodados.ibge.gov.br/api/v3/agregados/4709/periodos/2022/variaveis/5936|10605?localidades=N6[N3[43]]"

# Função para fazer a requisição à API do IBGE
def get_data_from_ibge():
    try:
        response = requests.get(url)
        response.raise_for_status()  # Lança uma exceção para erros de status HTTP
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Erro ao obter os dados da API. Detalhes: {e}")
        return None

# Função para processar e exportar os dados para um arquivo CSV
def process_data_to_csv(data):
    if data and 'resultados' in data:
        try:
            with open('dados_ibge_pop_var.csv', mode='w', newline='', encoding='utf-8') as file:
                writer = csv.writer(file)
                writer.writerow(['Município', 'Variação absoluta da população residente 2010 compatibilizada', 'Taxa de crescimento geométrico'])

                for resultado in data['resultados']:
                    for serie in resultado.get('series', []):
                        municipio = serie.get('localidade', {}).get('nome', 'Nome não encontrado')
                        var_pop_residente = serie.get('serie', {}).get('2022', 'Dado não encontrado')
                        writer.writerow([municipio, var_pop_residente])

                print("Dados exportados com sucesso para dados_ibge_pop_var.csv")

        except KeyError as e:
            print(f"Erro ao processar os dados: {e}")

# Chamando a função para obter os dados da API
data = get_data_from_ibge()

# Chamando a função para processar e exportar os dados para CSV
if data:
    process_data_to_csv(data)
else:
    print("Não foi possível obter os dados da API.")
