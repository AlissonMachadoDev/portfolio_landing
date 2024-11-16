#!/bin/bash
set -e  # Exit on error

echo "Starting cleanup process..."

# Stop the application if it's running
if [ -f /opt/portfolio_landing/portfolio_landing/bin/portfolio_landing ]; then
    echo "Stopping existing application..."
    /opt/portfolio_landing/portfolio_landing/bin/portfolio_landing stop || true
fi

# Make sure the directory exists
echo "Ensuring directory exists..."
mkdir -p /opt/portfolio_landing

# Clean up thoroughly
echo "Cleaning up old deployment..."
rm -rf /opt/portfolio_landing/*
rm -rf /opt/portfolio_landing/.[!.]*  # Remove hidden files too

# Reset permissions
echo "Setting up permissions..."
chown -R ubuntu:ubuntu /opt/portfolio_landing
chmod -R 755 /opt/portfolio_landing

echo "Before install script completed successfully"
exit 0