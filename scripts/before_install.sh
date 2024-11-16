#!/bin/bash
# Stopping existing application instance if running
if [ -f /opt/portfolio_landing/portfolio_landing/bin/portfolio_landing ]; then
    /opt/portfolio_landing/portfolio_landing/bin/portfolio_landing stop
fi

# Cleaning up old deployment

# Ajustar permissões do diretório
sudo chown -R ubuntu:ubuntu /opt/portfolio_landing
sudo chmod -R 755 /opt/portfolio_landing
sudo rm -rf /opt/portfolio_landing/*