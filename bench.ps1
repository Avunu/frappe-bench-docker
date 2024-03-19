param (
    [Parameter(Mandatory=$true)]
    [string]$Argument
)

# Executing the bench command within the 'watch' service container
docker compose exec -T --user frappe watch /bin/bash -c "/home/frappe/.local/bin/bench '$Argument'"
