#!/bin/bash
set -e
export HOME="/home/ubuntu"
export MIX_ENV=prod
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/ubuntu:/usr/ubuntu:/snap/bin"

apt-get -y install nodejs
apt-get -y install erlang-dev erlang-parsetools erlang-inets erlang-dev elixir
apt-get -y install nginx inotify-tools fish screen

which elixir
elixir --version
which node
node --version

cd /opt/portfolio_landing


# Instalar dependências do Elixir
mix local.hex --force
mix local.rebar --force
mix deps.get --only prod

# Instalar dependências do Node.js
cd assets && npm install --legacy-peer-deps && cd ..

# Compilar
mix compile
mix assets.deploy