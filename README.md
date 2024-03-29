# DeathStarLake

Projeto de desenvolvimento de um datalake com ingestão batch para startups usando o menor custo possível.

## Vídeos

[Playlist do Youtube](https://www.youtube.com/playlist?list=PLev38Fy3QTrdpy2pOLPnuGUE13PbcgCun)

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
  2. Linux/Mac: `source env/bin/activate` | Windows: `env\Scripts\activate.bat` ou `env\Scripts\Activate.ps1`
  3. Linux/Mac: `make install-requirements` | Windows: `python3 -m pip install -r requirements.txt`

Toda vez que você for iniciar uma task e entrar no repositório, é importante ativar o ambiente com o comando 2.
Para desativar, bastar dar o comando `deactivate`

## Estrutura de Pastas

```txt
DeathStarLake
├── requirements.txt
├── metabase_configs.md
├── README.md
├── makefile
├── .gitignore
├── jobs
│   └── lambda_extraction.zip
│   └── lambda_transformer.zip
├── dev
│   ├── alex
│   ├── arthur
│   ├── dgeison
│   ├── nassif
│   ├── renato
└── transformations
    └── padronizacao.md
    └── films.sql
    └── people.sql
    └── planets.sql
    └── species.sql
    └── starships.sql
    └── vehicles.sql
```
