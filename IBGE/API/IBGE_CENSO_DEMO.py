import pyodbc
import csv
import json

# Configurações do SQL Server
SERVER = 
DATABASE = 'DadosExternos'
DRIVER = '{ODBC Driver 17 for SQL Server}'
CONNECTION_STRING = f'DRIVER={DRIVER};SERVER={SERVER};DATABASE={DATABASE};Trusted_Connection=yes;'

# Nome do arquivo CSV a ser importado
csv_file = 'dados_brutos_ibge.csv'

# Nome da tabela no SQL Server
table_name = 'IBGE_CENSO_DEMO'

# Função para conectar ao SQL Server
def connect_to_sql_server(connection_string):
    try:
        connection = pyodbc.connect(connection_string)
        print("Conexão com SQL Server estabelecida com sucesso.")
        return connection
    except pyodbc.InterfaceError as e:
        print(f"Erro de conexão: {e}")
        raise
    except pyodbc.Error as ex:
        sqlstate = ex.args[1]
        print(f"Erro SQL: {sqlstate}")
        raise

# Função para criar a tabela no SQL Server
def criar_tabela_sql_server(connection):
    try:
        cursor = connection.cursor()

        # Verificar se a tabela já existe e, se existir, dropar
        cursor.execute(f'''
        IF OBJECT_ID('{table_name}', 'U') IS NOT NULL
        BEGIN
            DROP TABLE {table_name}
        END
        ''')

        # Criar a tabela com a estrutura atualizada
        cursor.execute(f'''
        CREATE TABLE {table_name} (
            id INT PRIMARY KEY IDENTITY(1,1),
            variavel VARCHAR(255),
            unidade VARCHAR(50),
            cor_ou_raca VARCHAR(255),
            sexo VARCHAR(50),
            idade VARCHAR(50),
            municipio_id VARCHAR(50),
            municipio_nome VARCHAR(255),
            populacao INT,
            percentual FLOAT  -- Única coluna para armazenar percentual (populacional ou total geral)
        );
        ''')
        connection.commit()
        print(f"Tabela '{table_name}' criada no SQL Server com a estrutura atualizada.")
    except pyodbc.Error as ex:
        sqlstate = ex.args[1]
        print(f"Erro ao criar tabela: {sqlstate}")
        raise


# Função para importar dados do CSV para o SQL Server
def importar_dados_csv(connection):
    try:
        cursor = connection.cursor()

        # Ajuste o tamanho máximo do campo para evitar o erro _csv.Error
        csv.field_size_limit(10000000)  # Defina um tamanho adequado para o seu caso

        total_linhas = 0
        linhas_com_aviso = 0

        dados_para_inserir = []

        with open(csv_file, 'r', newline='', encoding='utf-8') as file:
            reader = csv.reader(file)
            for line in reader:
                total_linhas += 1
                try:
                    # Converter a linha de string JSON para um dicionário Python
                    row = eval(line[0])  # A primeira coluna contém a string JSON

                    # Verificar se 'resultados' está presente no dicionário
                    if 'resultados' not in row:
                        linhas_com_aviso += 1
                        print(f"Aviso: 'resultados' não encontrados na linha {total_linhas}. Pulando esta linha.")
                        continue

                    resultados = row['resultados']

                    # Preparar variáveis comuns para todas as inserções nesta linha
                    variavel = row.get('variavel')
                    unidade = row.get('unidade')

                    # Iterar sobre os resultados para obter as informações necessárias
                    for resultado in resultados:
                        classificacoes = resultado.get('classificacoes', [])

                        cor_ou_raca = None
                        sexo = None
                        idade = None

                        for classificacao in classificacoes:
                            nome = classificacao.get('nome')
                            categoria = classificacao.get('categoria', {})

                            if nome == 'Cor ou raça':
                                cor_ou_raca = next(iter(categoria.values()), None)  # Pegando o primeiro valor da categoria
                            elif nome == 'Sexo':
                                sexo = next(iter(categoria.values()), None)  # Pegando o primeiro valor da categoria
                            elif nome == 'Idade':
                                idade = next(iter(categoria.values()), None)  # Pegando o primeiro valor da categoria

                        # Iterar sobre as séries para obter os dados por município
                        series = resultado.get('series', [])
                        for serie in series:
                            municipio_id = serie['localidade']['id']
                            municipio_nome = serie['localidade']['nome']
                            
                            # Tratamento para populacao
                            populacao_raw = next(iter(serie['serie'].values()))
                            if populacao_raw == '-':
                                populacao = None  # ou outro valor padrão apropriado
                            else:
                                populacao = int(float(populacao_raw))  # Convertendo para float antes de int
                            
                            percentual_populacional = None  # Ajuste conforme a estrutura do seu CSV
                            
                            # Tratamento para percentual_total_geral
                            percentual_total_geral_raw = next(iter(serie['serie'].values()))
                            if percentual_total_geral_raw == '-':
                                percentual_total_geral = None  # ou outro valor padrão apropriado
                            else:
                                percentual_total_geral = float(percentual_total_geral_raw)  # Convertendo para float
                            
                            # Adicionar os dados na lista de inserção
                            dados_para_inserir.append((
                                variavel, unidade, cor_ou_raca, sexo, idade,
                                municipio_id, municipio_nome, populacao, percentual_populacional,
                                percentual_total_geral
                            ))

                except Exception as e:
                    linhas_com_aviso += 1
                    print(f"Aviso: Erro ao processar linha {total_linhas}: {str(e)}. Pulando esta linha.")
                    continue

        # Realizar bulk insert dos dados acumulados
        if dados_para_inserir:
            cursor.executemany(f'''
            INSERT INTO {table_name} (variavel, unidade, cor_ou_raca, sexo, idade, municipio_id, municipio_nome, populacao, percentual_populacional, percentual_total_geral)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            ''', dados_para_inserir)

        connection.commit()
        print(f'Dados importados com sucesso para a tabela {table_name} no SQL Server.')
        print(f'Total de linhas processadas: {total_linhas}')
        print(f'Linhas com aviso: {linhas_com_aviso}')

    except pyodbc.Error as ex:
        sqlstate = ex.args[1]
        print(f"Erro SQL ao importar dados: {sqlstate}")
        raise
    except csv.Error as csv_err:
        print(f"Erro no arquivo CSV: {csv_err}")
        raise


# Conectar ao SQL Server
connection = connect_to_sql_server(CONNECTION_STRING)

# Criar tabela no SQL Server
criar_tabela_sql_server(connection)

# Importar dados do CSV para o SQL Server
importar_dados_csv(connection)

# Fechar a conexão
connection.close()
