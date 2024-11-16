#!/bin/bash
set -e  # Exit on error

echo "Starting application..."

# Change to application directory
cd /opt/portfolio_landing

# Export required environment variables
export PORT=4000
export MIX_ENV=prod
export PHX_HOST=alissonmachado.dev
export PHX_SERVER=true
export SECRET_KEY_BASE=$(aws ssm get-parameter --name "/portfolio_landing/prod/secret_key_base" --with-decryption --query Parameter.Value --output text)

# Start the application using the release
_build/prod/rel/portfolio_landing/bin/portfolio_landing daemon

# Wait for the application to start
echo "Waiting for application to start..."
sleep 5

# Verify the application is running
if ! _build/prod/rel/portfolio_landing/bin/portfolio_landing pid; then
    echo "Error: Application failed to start"
    exit 1
fi

echo "Application started successfully"