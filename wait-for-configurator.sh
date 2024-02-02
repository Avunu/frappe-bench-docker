#!/bin/bash
# wait-for-configuration.sh

# Wait for the .configured file to signal that configuration is complete
while [ ! -f /home/frappe/frappe-bench/.configured ]; do
  echo "Waiting for configuration to complete..."
  sleep 5
done
echo "Configuration detected, starting service...";

# Execute the passed command
exec "$@"