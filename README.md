Projeto de Banco de Dados Externo 
Este repositório contém todos os códigos, scripts de ETL, APIs, dados brutos e a documentação relacionados ao projeto de criação de um banco de dados externo. O projeto integra diversas fontes de dados como CAGED, RAIS, IBGE e MERCADOEDU, conectadas a tabelas de dimensões geográficas da base do IBGE.

Índice
Descrição do Projeto
Estrutura do Repositório
Como Executar
Documentação
Licença
Contato
Descrição do Projeto
O projeto foi desenvolvido para centralizar e disponibilizar dados externos confiáveis e atualizados, facilitando a visualização e análise dos mesmos pelas áreas de decisão do Senac RS. Este banco de dados externo consolida informações importantes, permitindo que a empresa extraia insights valiosos para a tomada de decisões estratégicas.

Estrutura do Repositório
A estrutura do repositório é organizada da seguinte forma:

objectivec
Copiar código
├── dados_brutos/
│   ├── CAGED/
│   ├── RAIS/
│   ├── IBGE/
│   └── MERCADOEDU/
├── scripts_etl/
│   ├── caged_etl.py
│   ├── rais_etl.py
│   ├── ibge_etl.py
│   └── mercadoedu_etl.py
├── api_scripts/
│   ├── caged_api.py
│   ├── rais_api.py
│   ├── ibge_api.py
│   └── mercadoedu_api.py
├── documentação/
└── README.md
Pastas:
dados_brutos/: Contém os dados brutos extraídos de cada uma das fontes.
scripts_etl/: Scripts de ETL para cada fonte de dados, responsáveis por extrair, transformar e carregar os dados no banco de dados externo.
api_scripts/: Scripts das APIs utilizadas para a coleta dos dados das fontes externas.
