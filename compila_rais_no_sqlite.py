import os
import sqlite3

# Função para criar tabela no banco de dados SQLite com base nos cabeçalhos dos arquivos TXT
def criar_tabela_com_colunas_automaticas(conn, tabela_nome, colunas):
    cursor = conn.cursor()
    print(f"Criando tabela '{tabela_nome}'...")
    # Remover nomes de colunas duplicados
    colunas_unicas = list(set(colunas))
    # Montar a string de criação da tabela com os nomes das colunas únicas
    create_table_query = f'''
        CREATE TABLE IF NOT EXISTS "{tabela_nome}" (
            id INTEGER PRIMARY KEY,
            {", ".join([f'"{coluna}" TEXT' for coluna in colunas_unicas])}
        )
    '''
    cursor.execute(create_table_query)
    conn.commit()

# Função para ler o conteúdo de um arquivo TXT e inseri-lo em uma tabela SQLite
def inserir_dados(conn, tabela_nome, arquivo, colunas):
    cursor = conn.cursor()
    with open(arquivo, 'r', encoding='latin-1') as file:
        linhas = file.readlines()
        for linha in linhas:
            valores = linha.strip().split(';')  # Separador alterado para ponto e vírgula
            # Verificar se o número de valores na linha corresponde ao número de colunas
            if len(valores) == len(colunas):
                # Construir a string de inserção de dados com aspas em torno dos valores
                insert_query = f'''
                    INSERT INTO "{tabela_nome}" ({", ".join([f'"{coluna}"' for coluna in colunas])})
                    VALUES ({", ".join(['?' for _ in range(len(colunas))])})
                '''
                cursor.execute(insert_query, valores)
        conn.commit()

# Nome do banco de dados SQLite
db_nome = 'stg_rais.db'

# Conexão com o banco de dados
conn = sqlite3.connect(db_nome)

# Loop pelas pastas de 2012 a 2022
for ano in range(2012, 2023):
    pasta = str(ano)
    if os.path.isdir(pasta):
        # Loop pelos arquivos TXT dentro da pasta
        for arquivo in os.listdir(pasta):
            if arquivo.endswith('.txt'):
                tabela_nome = f'{pasta}_{arquivo[:-4]}'.replace(" ", "_")
                arquivo_path = os.path.join(pasta, arquivo)
                # Analisar o cabeçalho do arquivo para obter os nomes das colunas
                with open(arquivo_path, 'r', encoding='latin-1') as file:
                    cabecalho = file.readline().strip().split(';')  # Supondo que o cabeçalho esteja na primeira linha
                # Criar tabela no banco de dados com colunas automáticas
                criar_tabela_com_colunas_automaticas(conn, tabela_nome, cabecalho)
                # Inserir dados na tabela
                inserir_dados(conn, tabela_nome, arquivo_path, cabecalho)

# Fechar conexão com o banco de dados
conn.close()

print("Tabelas criadas e dados inseridos com sucesso.")
