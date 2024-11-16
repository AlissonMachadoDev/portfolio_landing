#!/bin/bash
set -e
export HOME="/home/ubuntu"
export MIX_ENV=prod
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/ubuntu:/usr/ubuntu:/snap/bin"

. $HOME/.asdf/asdf.sh
asdf local elixir 1.17.3-otp-27

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