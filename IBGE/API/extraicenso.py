import requests
import csv

# URL da API do IBGE
url = "https://servicodados.ibge.gov.br/api/v3/agregados/9606/periodos/2022/variaveis/93|1000093?localidades=N6[N3[43]]&classificacao=86[95251]|2[4,5]|287[93070,93084,93085,93086,93087,93088,93089,93090,93091,93092,93093,93094,93095,93096,93097,93098,49108,49109,60040,60041,6653]"

# Função para fazer a requisição à API do IBGE
def get_data_from_ibge():
    response = requests.get(url)
    if response.status_code == 200:
        return response.json()
    else:
        print(f"Erro ao obter os dados da API. Código de erro: {response.status_code}")
        return None

# Função para processar e exportar os dados para um arquivo CSV
def process_data_to_csv():
    data = get_data_from_ibge()
    if data:
        with open('dados_ibge.csv', mode='w', newline='', encoding='utf-8') as file:
            writer = csv.writer(file)
            writer.writerow(['Município', 'População Residente'])
            
            try:
                if 'resultados' in data and isinstance(data['resultados'], list):
                    for resultado in data['resultados']:
                        if 'series' in resultado and isinstance(resultado['series'], list):
                            for serie in resultado['series']:
                                municipio = serie.get('localidade', {}).get('nome', 'Nome não encontrado')
                                pop_residente = serie.get('2022', 'Dado não encontrado')
                                writer.writerow([municipio, pop_residente])
                        else:
                            print(f"Dados incompletos para resultado: {resultado}")
                else:
                    print("Estrutura de dados incompleta ou vazia.")
            
            except KeyError as e:
                print(f"Erro ao processar os dados: {e}")

# Chamando a função para processar e exportar os dados para CSV
process_data_to_csv()
