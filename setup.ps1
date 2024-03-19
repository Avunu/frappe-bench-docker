Write-Output "Setting up your environment variables."
Write-Output "Press enter to accept the default value shown in brackets."

# Initialize content variable
$envContent = @()

# Read .env.example
$envVars = Get-Content .env.example

foreach ($line in $envVars) {
    if ($line -eq "") { continue }
    $parts = $line -split "=", 2
    $key = $parts[0]
    $defaultValue = $parts[1]

    # Prompt for value with default
    $envInput = Read-Host "$key=($defaultValue)"
    if ($envInput -eq "") {
        $envInput = $defaultValue
    }

    # Add to content
    $envContent += "$key=$envInput"
}

Write-Output "Creating .env file with your settings..."

# Write to .env file with UTF-8 encoding
$envContent | Out-File -Encoding utf8 .env

# Create cupsd.conf if it doesn't exist
if (-not (Test-Path "cupsd.conf")) {
    Write-Output "Creating cupsd.conf file..."
    # touch cupsd.conf
    New-Item -ItemType file -Name "cupsd.conf"
}

# Create printers.conf if it doesn't exist
if (-not (Test-Path "printers.conf")) {
    Write-Output "Creating printers.conf file..."
    # touch printers.conf
    New-Item -ItemType file -Name "printers.conf"
}

# Run docker compose up
Write-Output "Starting docker compose..."
docker compose up -d

Write-Output "Setup complete! Your project is starting up."
