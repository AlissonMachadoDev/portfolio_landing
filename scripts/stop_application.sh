#!/bin/bash
# Gracefully stop the application
if [ -f /opt/portfolio_landing/portfolio_landing/bin/portfolio_landing ]; then
    /opt/portfolio_landing/portfolio_landing/bin/portfolio_landing stop
fi