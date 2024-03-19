#!/bin/bash

# Check if .env file already exists
if [ -f ".env" ]; then
    echo ".env file already exists. Please delete or backup before running this script."
    exit 1
fi

echo "Setting up your environment variables."
echo "Press enter to accept the default value shown in brackets."

# Loop through .env.example file
while IFS='=' read -r key default_value; do
    # Skip if line is empty
    if [ -z "$key" ]; then
        continue
    fi

    # Prompt for value with default
    read -p "$key=($default_value) " value

    # Use default value if no input is given
    if [ -z "$value" ]; then
        value=$default_value
    fi

    # Write to .env file
    echo "$key=$value" >>.env
done <.env.example

echo "Creating .env file with your settings..."

# Create cupsd.conf if it doesn't exist
if [ ! -f "cupsd.conf" ]; then
    echo "Creating cupsd.conf file..."
    touch cupsd.conf
fi

# Create printers.conf if it doesn't exist
if [ ! -f "printers.conf" ]; then
    echo "Creating printers.conf file..."
    touch printers.conf
fi

# Run docker compose up
echo "Starting docker compose..."
docker compose up -d

echo "Setup complete! Your project is starting up."
