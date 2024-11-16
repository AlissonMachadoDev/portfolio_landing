#!/bin/bash
# Wait for the application to be responsive
for i in {1..30}; do
    if curl -s http://localhost:4000 > /dev/null; then
        echo "Service is running"
        exit 0
    fi
    echo "Waiting for service to start..."
    sleep 2
done
echo "Service failed to start"
exit 1