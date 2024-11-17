#!/bin/sh

echo "$(whoami)"
[ "$UID" -eq 0 ] || exec sudo "$0" "$@"


# Define the name of the systemd service you want to stop
SERVICE_NAME="postgresql"

systemctl start postgresql

# Function to handle SIGINT
function handle_sigint() {
    echo "SIGINT received. Stopping the $SERVICE_NAME service..."
    systemctl stop $SERVICE_NAME
    echo "$SERVICE_NAME service stopped. Exiting..."
    exit 0
}

# Trap SIGINT (Ctrl+C)
trap handle_sigint SIGINT

# Continue sleeping
echo "Sleeping indefinitely. Press Ctrl+C to stop the $SERVICE_NAME service and exit."
while true; do
    sleep 1
done
