#!/bin/bash
cd /opt/portfolio_landing

# Export required environment variables
export PORT=4000
export MIX_ENV=prod
export SECRET_KEY_BASE=$(aws ssm get-parameter --name "/portfolio_landing/prod/secret_key_base" --with-decryption --query Parameter.Value --output text)
export DATABASE_URL=$(aws ssm get-parameter --name "/portfolio_landing/prod/database_url" --with-decryption --query Parameter.Value --output text)

# Start the application
portfolio_landing/bin/portfolio_landing daemon
