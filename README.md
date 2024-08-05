Visão Geral do Projeto
Este repositório contém todos os dados, scripts e recursos utilizados para desenvolver um banco de dados relacional externo para o Senac RS. O banco de dados consolida dados socioeconômicos e demográficos coletados via APIs do IBGE e RAIS, fornecendo um perfil abrangente da população atendida pelo Senac RS. Este banco de dados visa apoiar a criação de programas educacionais e políticas direcionadas, melhorando a capacidade da instituição de atender sua comunidade de forma eficaz.

Estrutura do Repositório
RAIS/

dados_brutos/: Contém os arquivos de dados originais extraídos da API da RAIS.
dados_compilados/: Arquivos de banco de dados SQLite compilados a partir dos dados brutos da RAIS.
scripts_sql/: Scripts SQL usados para criar e popular as tabelas no banco de dados externo a partir dos dados compilados da RAIS.
IBGE/

dados_brutos/: Contém os arquivos de dados originais extraídos da API do IBGE.
dados_compilados/: Arquivos de banco de dados SQLite compilados a partir dos dados brutos do IBGE.
scripts_sql/: Scripts SQL usados para criar e popular as tabelas no banco de dados externo a partir dos dados compilados do IBGE.
documentação/

Contém a documentação detalhada do projeto, incluindo o modelo do banco de dados, instruções de instalação e uso, e quaisquer informações adicionais relevantes.
Como Utilizar
Extração de Dados:

Os dados foram extraídos usando APIs públicas do IBGE e RAIS. As pastas dados_brutos/ contêm os arquivos originais.
Compilação de Dados:

Os dados brutos foram processados e compilados em bancos de dados SQLite para facilitar a manipulação e análise. Estes arquivos estão disponíveis nas pastas dados_compilados/.
Criação e População do Banco de Dados:

Os scripts SQL na pasta scripts_sql/ são usados para criar as tabelas e inserir os dados no banco de dados relacional final.
Configuração do Banco de Dados Externo:

As instruções para configurar e utilizar o banco de dados externo estão detalhadas na documentação, que pode ser encontrada na pasta documentação/.
