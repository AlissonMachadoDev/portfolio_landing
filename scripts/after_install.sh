#!/bin/bash
set -e

# Print script start
echo "Starting after_install script..."

# Export environment variables
export HOME="/home/ubuntu"
export MIX_ENV=prod
export PATH="$HOME/.asdf/bin:$HOME/.asdf/shims:$PATH"

# Source asdf if it exists
if [ -f "$HOME/.asdf/asdf.sh" ]; then
    . "$HOME/.asdf/asdf.sh"
    echo "Sourced asdf.sh"
else
    echo "Warning: asdf.sh not found"
fi

# Print environment information
echo "Current working directory: $(pwd)"
echo "HOME directory: $HOME"
echo "PATH: $PATH"

# Verify installations
echo "Verifying installations..."

# Check Erlang
if command -v erl >/dev/null 2>&1; then
    echo "Erlang version: $(erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().'  -noshell)"
else
    echo "Error: Erlang not found"
    exit 1
fi

# Check Elixir
if command -v elixir >/dev/null 2>&1; then
    echo "Elixir version: $(elixir --version)"
else
    echo "Error: Elixir not found"
    exit 1
fi

# Check Node.js
if command -v node >/dev/null 2>&1; then
    echo "Node.js version: $(node --version)"
else
    echo "Error: Node.js not found"
    exit 1
fi

# Navigate to application directory
cd /opt/portfolio_landing
echo "Changed to directory: $(pwd)"

# Install hex and rebar
echo "Installing hex and rebar..."
mix local.hex --force
mix local.rebar --force

# Get dependencies
echo "Getting dependencies..."
mix deps.get --only prod

# Install node dependencies for assets
echo "Installing node dependencies..."
cd assets && npm install --legacy-peer-deps
cd ..

# Compile and deploy assets
echo "Compiling and deploying assets..."
mix compile
mix assets.deploy

echo "After install script completed successfully"