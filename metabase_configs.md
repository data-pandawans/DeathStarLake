# Configurações do metabase no AWS LightSail

[Referência](https://github.com/VaMusaka/anecdotes/blob/gh-pages/articles/metabase/index.md)

## Instalação do Docker

```bash
$ sudo apt-get update
$ sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

$ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

$ sudo apt-get update
$ sudo apt-get install -y docker-ce docker-ce-cli containerd.io
$ sudo docker run hello-world
```

## Instalação do Postgres

```bash
$ sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
$ wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
$ sudo apt update
$ sudo apt install -y postgresql postgresql-contrib
```

## Configuração do Banco de Dados

```bash
$ sudo -u postgres psql -c "CREATE USER $username WITH PASSWORD '$password'"
$ sudo -u postgres psql -c "ALTER USER $username WITH SUPERUSER"
$ sudo -u postgres psql -c "SELECT 1 FROM pg_database WHERE datname = 'metabase'" | grep -q 1 || -u postgres psql -c "CREATE DATABASE metabase WITH OWNER $username"
```

## Configuração do container do metabase

```bash
$ sudo docker run -d -p 80:3000 \
      --add-host host.docker.internal:host-gateway \
      -e "MB_DB_TYPE=postgres" \
      -e "MB_DB_DBNAME=metabase" \
      -e "MB_DB_PORT=5432" \
      -e "MB_DB_USER=$username" \
      -e "MB_DB_PASS=$password" \
      -e "MB_DB_HOST=$ip" \
      --name metabase metabase/metabase
```

## Credenciais

Pegar na AWS

## Conexão com Athena

Pegar prints