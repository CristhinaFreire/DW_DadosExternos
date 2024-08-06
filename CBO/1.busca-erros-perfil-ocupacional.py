import csv

def print_lines_with_more_than_n_columns(file_path, n=9, delimiter=';', encoding='utf-8'):
    with open(file_path, 'r', encoding=encoding, errors='replace') as file:
        reader = csv.reader(file, delimiter=delimiter)
        
        # Ler a primeira linha para obter os nomes das colunas
        header = next(reader)
        
        # Iterar sobre as linhas e imprimir aquelas que têm mais de n colunas
        for line_number, row in enumerate(reader, start=2):  # começa da linha 2 (após o cabeçalho)
            if len(row) > n:
                print(f"Linha {line_number}: {row}")

# Exemplo de uso
file_path = 'CBO2002 - PerfilOcupacional.csv'
print_lines_with_more_than_n_columns(file_path, encoding='latin-1')  # Experimente usar 'latin-1' ou outra codificação que se aplique ao seu arquivo
