import sqlite3
import unicodedata

def extract_courses_and_cbos(text):
    lines = text.split('\n')
    course_cbos = {}
    current_course = None

    # Transformando a lista de linhas em um iterador
    lines_iter = iter(lines)

    for line in lines_iter:
        if 'CATÁLOGO' in line:
            continue  # Ignorar linhas com a palavra "CATÁLOGO"
        elif 'TÉCNICO' in line:
            current_course = line.strip()
            course_cbos[current_course] = []
        elif 'Ocupações CBO associadas' in line:
            if current_course is not None:
                # Adicionar todas as linhas entre "Ocupações CBO associadas" e "Infraestrutura mínima"
                while 'Infraestrutura mínima' not in line:
                    line = next(lines_iter, None)
                    if line:
                        line = line.strip()
                        if line and 'Infraestrutura mínima' not in line:
                            # Adicionar a linha ao curso, mantendo o line break
                            course_cbos[current_course].append(line)
                            print(f"Adicionado ao curso {current_course}: {line}")
                current_course = None  # Reiniciar para o próximo curso

    return course_cbos

# Leitura do arquivo de texto
with open('CatalogoCBO.txt', 'r', encoding='utf-8') as file:
    text_content = file.read()

# Chamada da função e obtenção dos resultados
result = extract_courses_and_cbos(text_content)

# Conectar ao banco de dados
conn = sqlite3.connect('cbo.db')
cursor = conn.cursor()

# Criar tabela se não existir
cursor.execute('''DROP TABLE IF EXISTS cursos_cbo;''')
cursor.execute('''CREATE TABLE IF NOT EXISTS cursos_cbo
                  (curso TEXT, curso_tratado TEXT, cbo TEXT)''')

# Inserir dados na tabela
for course, cbos in result.items():
    # Aplicar os replaces e criar a coluna curso_tratado
    course_tratado = (
        course.replace('TÉCNICO EM LABORATÓRIO DE CIÊNCIAS DA', 'TÉCNICO EM LABORATÓRIO DE CIÊNCIAS DA NATUREZA')
              .replace('TÉCNICO EM MANUTENÇÃO AERONÁUTICA EM', 'TÉCNICO EM MANUTENÇÃO AERONÁUTICA EM AVIÔNICOS')
              .replace('TÉCNICO EM PLANEJAMENTO E CONTROLE DA', 'TÉCNICO EM PLANEJAMENTO E CONTROLE DA PRODUÇÃO')
              .replace('TÉCNICO EM SERVIÇOS DE RESTAURANTE E', 'TÉCNICO EM SERVIÇOS DE RESTAURANTE E BAR')
              .replace('TÉCNICO EM TREINAMENTO E INSTRUÇÃO DE', 'TÉCNICO EM TREINAMENTO E INSTRUÇÃO DE CÃES-GUIA')
              .replace('TÉCNICO EM REGISTROS E INFORMAÇÕES EM', 'TÉCNICO EM REGISTROS E INFORMAÇÕES EM SAÚDE')
    )
    for cbo in cbos:
        cursor.execute("INSERT INTO cursos_cbo (curso, curso_tratado, cbo) VALUES (?, ?, ?)", (course, course_tratado, cbo))

print('Tabela curso_tratado criada com sucesso!')
# Commit
conn.commit()

# Criar a tabela StgCBOTecnicos
cursor.execute('''DROP TABLE IF EXISTS Stg_CBOTecnicos;''')
cursor.execute('''
                CREATE TABLE IF NOT EXISTS Stg_CBOTecnicos AS
                SELECT DISTINCT
                    TRIM(SUBSTR(curso_tratado, 1, 
                               CASE
                                   WHEN INSTR(curso_tratado, '1') > 0 THEN INSTR(curso_tratado, '1') - 1
                                   WHEN INSTR(curso_tratado, '8') > 0 THEN INSTR(curso_tratado, '8') - 1
                                   ELSE LENGTH(curso_tratado)
                               END)) AS curso,
                    REPLACE(TRIM(SUBSTR(cbo, 1, 7)), '-', '') AS cbo,
 REPLACE(
           REPLACE(
               REPLACE(
                   REPLACE(
                       REPLACE(
                           REPLACE(
                               REPLACE(
                                   REPLACE(
                                       REPLACE(
                                           REPLACE(
                                               REPLACE(
                                                   REPLACE(
                                                       REPLACE(
                                                           REPLACE(
                                                               REPLACE(
                                                                   REPLACE(
                                                                       REPLACE(
                                                                           REPLACE(
                                                                               TRIM(SUBSTR(curso_tratado, 1, 
                               CASE
                                   WHEN INSTR(curso_tratado, '1') > 0 THEN INSTR(curso_tratado, '1') - 1
                                   WHEN INSTR(curso_tratado, '8') > 0 THEN INSTR(curso_tratado, '8') - 1
                                   ELSE LENGTH(curso_tratado)
                               END)),
                                                                               'Á', 'A'),
                                                                           'É', 'E'),
                                                                       'Í', 'I'),
                                                                   'Ó', 'O'),
                                                               'Ú', 'U'),
                                                           'Â', 'A'),
                                                       'Ê', 'E'),
                                                   'Î', 'I'),
                                               'Ô', 'O'),
                                           'Û', 'U'),
                                       'Ã', 'A'),
                                   'Õ', 'O'),
                               'Ä', 'A'),
                           'Ë', 'E'),
                       'Ï', 'I'),
                   'Ö', 'O'),
               'Ü', 'U'),
           'Ç', 'C') AS CHAVE_CURSO_TECNICO
                FROM cursos_cbo
                WHERE cbo LIKE '%-%'
                    AND cbo <> 'Instrumentos Médico-Hospitalares'
                ORDER BY curso
                ''')

print('Tabela Stg_CBOTecnicos criada com sucesso!')

cursor.execute('''DROP TABLE IF EXISTS cursos_cbo;''')

print('Tabela curso_tratado deletada com sucesso!')

# Criar a tabela MEC_DimCBO
cursor.execute('''DROP TABLE IF EXISTS MEC_DimCBO;''')
cursor.execute('''
                CREATE TABLE IF NOT EXISTS MEC_DimCBO AS
                SELECT distinct COD_GRANDE_GRUPO,
                COD_SUBGRUPO_PRINCIPAL,
                COD_SUBGRUPO,
                COD_OCUPACAO,
                GRANDE_GRUPO,
                SUBGRUPO_PRINCIPAL,
                SUBGRUPO,
                OCUPACAO
                    FROM Stg_CBO c
                ''')

print('Tabela MEC_DimCBO criada com sucesso!')

# Criar a tabela MEC_StgCBO
cursor.execute('''DROP TABLE IF EXISTS MEC_StgCBO;''')
cursor.execute('''
CREATE TABLE MEC_StgCBO AS 
SELECT DISTINCT
       COD_GRANDE_GRUPO,
       COD_SUBGRUPO_PRINCIPAL,
       COD_SUBGRUPO,
       COD_FAMILIA,
       COD_OCUPACAO,
       SGL_GRANDE_AREA,
       NOME_GRANDE_AREA,
       COD_ATIVIDADE,
       NOME_ATIVIDADE,
       GRANDE_GRUPO,
       SUBGRUPO_PRINCIPAL,
       SUBGRUPO,
       SINONIMO,
       OCUPACAO,
       FAMILIA,
       t.curso AS CURSO_TECNICO,
       REPLACE(
           REPLACE(
               REPLACE(
                   REPLACE(
                       REPLACE(
                           REPLACE(
                               REPLACE(
                                   REPLACE(
                                       REPLACE(
                                           REPLACE(
                                               REPLACE(
                                                   REPLACE(
                                                       REPLACE(
                                                           REPLACE(
                                                               REPLACE(
                                                                   REPLACE(
                                                                       REPLACE(
                                                                           REPLACE(
                                                                               t.curso,
                                                                               'Á', 'A'),
                                                                           'É', 'E'),
                                                                       'Í', 'I'),
                                                                   'Ó', 'O'),
                                                               'Ú', 'U'),
                                                           'Â', 'A'),
                                                       'Ê', 'E'),
                                                   'Î', 'I'),
                                               'Ô', 'O'),
                                           'Û', 'U'),
                                       'Ã', 'A'),
                                   'Õ', 'O'),
                               'Ä', 'A'),
                           'Ë', 'E'),
                       'Ï', 'I'),
                   'Ö', 'O'),
               'Ü', 'U'),
           'Ç', 'C') AS CHAVE_CURSO_TECNICO
FROM Stg_CBO c
LEFT JOIN STG_CBOTECNICOS t ON c.COD_OCUPACAO = t.cbo
ORDER BY OCUPACAO;
                    ''')

print('Tabela MEC_StgCBO criada com sucesso!')

# Commit e fechar conexão
conn.commit()
conn.close()