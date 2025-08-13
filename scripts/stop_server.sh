#!/bin/bash
# Stop the Node.js app if running (idempotent)

APP_NAME="acebook"

# Check if pm2 is installed
if ! command -v pm2 &> /dev/null; then
    echo "pm2 is not installed, skipping stop."
    exit 0
fi

# Check if the app is running
if pm2 list | grep -q "$APP_NAME"; then
    echo "Stopping $APP_NAME..."
    pm2 stop "$APP_NAME"
else
    echo "$APP_NAME is not running, nothing to stop."
fi
