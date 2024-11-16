#!/bin/bash
set -e
export HOME="/home/ubuntu"
export MIX_ENV=prod

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