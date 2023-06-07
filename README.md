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