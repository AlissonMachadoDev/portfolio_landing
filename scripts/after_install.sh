#!/bin/bash
# Stopping existing application instance if running
if [ -f /opt/portfolio_landing/portfolio_landing/bin/portfolio_landing ]; then
    /opt/portfolio_landing/portfolio_landing/bin/portfolio_landing stop
fi

# Cleaning up old deployment
rm -rf /opt/portfolio_landing/*