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
  3. `make install-requirements`

Toda vez que você for iniciar uma task e entrar no repositório, é importante ativar o ambiente com o comando 2.

Para desativar, bastar dar o comando `deactivate`

## Estrutura de Pastas

```txt
DeathStarLake
├── requirements.txt
├── README.md
├── .gitignore
├── applications
│   ├── power_bi
│       └── README.md
│   ├── tableau
│       └── README.md
├── resources
│   ├── inputs
│       └── raw_data.csv
│   ├── outputs
│       └── clean_data.parquet
├── jobs
│   └── ingest_data.py
│   └── transform_data.py
│   └── load_data.py
├── dev
│   ├── arthur
│   ├── dgeison
│   ├── guerra
│   ├── nassif
│   ├── renato
├── tests
│   └── test_clean_columns.py
└── transformations
    └── base.sql
    └── clean_data.sql
    └── pivot_data.sql
```
