#!/bin/bash

# Create data directories for persistent storage
mkdir -p data/mongodb
mkdir -p data/opensearch
mkdir -p data/graylog

# Set appropriate permissions
# MongoDB needs specific permissions to work correctly
chmod 777 data/mongodb
chmod 777 data/opensearch
chmod 777 data/graylog

echo "Data directories created successfully."
echo "You can now run 'docker compose up' to start the Graylog stack."
echo "Your data will be persisted in the ./data directory."