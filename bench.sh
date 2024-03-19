#!/bin/bash

# Check if an argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <argument>"
    exit 1
fi

# Executing the bench command within the 'watch' service container
docker compose exec -T --user frappe watch /bin/bash -c "/home/frappe/.local/bin/bench '$1'"
