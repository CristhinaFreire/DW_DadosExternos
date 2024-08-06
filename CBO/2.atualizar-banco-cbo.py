import sqlite3
import pandas as pd
import os
import chardet
import fileinput
import csv

# Nome do banco de dados SQLite
db_filename = "cbo.db"

# Excluir o banco de dados SQLite se ele existir
if os.path.exists(db_filename):
    os.remove(db_filename)

# Conectar-se ao banco de dados SQLite
conn = sqlite3.connect(db_filename)

# Lista de arquivos CSV na pasta do script
csv_files = [file for file in os.listdir() if file.endswith(".csv")]

# Loop para importar cada arquivo CSV para o banco de dados
for csv_file in csv_files:
    # Extrair o nome da tabela sem o prefixo "CBO2002 - " e sem a extensão
    table_name = os.path.splitext(csv_file.replace("CBO2002 - ", ""))[0]
    
    # Caminho completo do arquivo CSV
    csv_path = os.path.join(os.getcwd(), csv_file)
    
    try:
        # Detectar automaticamente a codificação do arquivo
        with open(csv_path, 'rb') as f:
            result = chardet.detect(f.read())
            encoding = result['encoding']

        # Substituir ".;" por "," e "bags;conteineres" por "bags,conteineres" em todo o arquivo
        with fileinput.FileInput(csv_path, inplace=True, backup=".bak") as file:
            for line in file:
                line = line.replace(".;", ",")
                line = line.replace("bags;conteineres", "bags,conteineres")  # Adiciona a troca específica aqui
                print(line, end="")

        # Inicializar variável para armazenar a linha problemática
        problematic_line = None

        # Ler CSV para DataFrame usando pandas
        with open(csv_path, 'r', encoding=encoding) as f:
            # Usamos o csv.reader para lidar com linhas malformadas
            reader = csv.reader(f, delimiter=';')
            # Ler a primeira linha para obter os nomes das colunas
            header = next(reader)
            
            try:
                df = pd.DataFrame(list(reader), columns=header)
            except pd.errors.ParserError as pe:
                # Se ocorrer um erro de parsing, armazenar a linha problemática
                problematic_line = f"Linha com problema: {next(reader)}"

        if problematic_line:
            print(f"Erro ao importar tabela '{table_name}': {problematic_line}")
            
            # Se houver um erro de parsing, salvar as linhas com problemas em uma tabela paralela
            with open(csv_path, 'r', encoding=encoding) as f:
                # Usamos o csv.reader novamente
                reader = csv.reader(f, delimiter=';')
                df_error = pd.DataFrame(list(reader), columns=header)
                error_table_name = f"{table_name}_error"
                df_error.to_sql(error_table_name, conn, index=False, if_exists="replace")
                print(f"Linhas com problemas salvas em '{error_table_name}'.")
        else:
            # Salvar DataFrame no banco de dados SQLite
            df.to_sql(table_name, conn, index=False, if_exists="replace")
            print(f"Tabela '{table_name}' importada com sucesso.")

    except Exception as e:
        print(f"Erro ao importar tabela '{table_name}': {e}")

# Fechar a conexão com o banco de dados
conn.close()
