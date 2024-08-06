import pyodbc
import csv

# Configurações do SQL Server
SERVER = r'srv-bi\homologacao'
DATABASE = 'DadosExternos'
DRIVER = '{ODBC Driver 17 for SQL Server}'
CONNECTION_STRING = f'DRIVER={DRIVER};SERVER={SERVER};DATABASE={DATABASE};Trusted_Connection=yes;'

# Nome do arquivo CSV a ser importado
csv_file = 'indice_envelhecimento_municipio.csv'

# Nome da tabela no SQL Server
table_name = 'IBGE_CENSO_ENVELHECIMENTO'

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

# Função para excluir a tabela se ela já existir
def drop_table_if_exists(connection):
    try:
        cursor = connection.cursor()
        
        # Verificar se a tabela existe e, se sim, excluí-la
        cursor.execute(f'''
        IF OBJECT_ID('{table_name}', 'U') IS NOT NULL
        BEGIN
            DROP TABLE {table_name};
            PRINT 'Tabela {table_name} excluída.'
        END
        ''')
        connection.commit()
    except pyodbc.Error as ex:
        sqlstate = ex.args[1]
        print(f"Erro ao excluir tabela: {sqlstate}")
        raise

# Função para criar a tabela no SQL Server
def criar_tabela_sql_server(connection):
    try:
        cursor = connection.cursor()
        
        # Criar a nova tabela
        cursor.execute(f'''
        CREATE TABLE {table_name} (
            id INT PRIMARY KEY IDENTITY(1,1),
            municipio_id VARCHAR(50),
            municipio_nome VARCHAR(255),
            ano INT,
            indice_envelhecimento FLOAT
        );
        PRINT 'Tabela {table_name} criada.'
        ''')
        connection.commit()
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

        with open(csv_file, 'r', newline='', encoding='utf-8') as file:
            reader = csv.reader(file)
            next(reader)  # Pula o cabeçalho se existir
            for line in reader:
                total_linhas += 1
                try:
                    municipio_id, municipio_nome, ano, indice_envelhecimento = line
                    ano = int(ano.strip())
                    indice_envelhecimento = float(indice_envelhecimento.strip())
                    
                    # Inserir dados na tabela
                    cursor.execute(f'''
                    INSERT INTO {table_name} (municipio_id, municipio_nome, ano, indice_envelhecimento)
                    VALUES (?, ?, ?, ?)
                    ''', (municipio_id.strip(), municipio_nome.strip(), ano, indice_envelhecimento))
                
                except Exception as e:
                    linhas_com_aviso += 1
                    print(f"Aviso: Erro ao processar linha {total_linhas}: {str(e)}. Pulando esta linha.")
                    continue
        
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

# Excluir tabela existente (se houver)
drop_table_if_exists(connection)

# Criar nova tabela no SQL Server
criar_tabela_sql_server(connection)

# Importar dados do CSV para a nova tabela no SQL Server
importar_dados_csv(connection)

# Fechar a conexão
connection.close()
