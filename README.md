# DeathStarLake

Projeto de desenvolvimento de um datalake com ingestão batch para startups usando o menor custo possível.

## Proposta

A ideia é quebrarmos o projeto de datalake em alguns pontos chaves:

* Storage
* Governança e Metadados
* ETL
* Data Quality
* Conexão com DataViz

Devemos usar as ferramentas básicas das clouds, para que devemos gastar o mínimo possível.

## Objetivo

* Criar um catálogo com informações tratadas disponibilizadas pela [API](https://swapi.dev/) do Star Wars;
* Enriquecer dados com informações do IMBD, por exemplo;
* Montar tabelas finais prontas para utilização no dashboard final.

## Clouds

* AWS
* GCP
* Azure

## APIs de Enriquecimento:

* [WatchMode](https://api.watchmode.com/docs/)
* [TasteDive](https://tastedive.com/read/api)
* [OMDb](https://www.omdbapi.com/)

## Ambiente local

Para iniciar o ambiente local, basta ter o python3 instalado e seguir os seguintes passos:

  1. `python3 -m venv env`
  2. `source env/bin/activate`
  3. `pip install -r requirements.txt`

## Estrutura de Pastas

```txt
DeathStarLake
├── requirements.txt
├── README.md
├── .gitignore
├── resources
│   ├── inputs
│       └── raw_data.csv
│   ├── outputs
│       └── clean_data.parquet
├── jobs
│   └── ingest_data.py
│   └── transform_data.py
│   └── load_data.py
├── notebooks
│   ├── run-save-cleaned-data.ipynb
│   └── run-tests.ipynb
├── tests
│   └── test_clean_columns.py
└── transformations
    └── base.sql
    └── clean_data.sql
    └── pivot_data.sql
```
