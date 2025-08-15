#!/usr/bin/env bash
set -euo pipefail

APP_DIR="/home/ec2-user/acebook-app"

# Ensure the app directory exists
mkdir -p "$APP_DIR"
cd "$APP_DIR"

# Ensure Node.js is installed
if ! command -v node >/dev/null 2>&1; then
    sudo dnf -y install nodejs npm
fi

# Install npm dependencies
if [ -f package-lock.json ]; then
    npm ci --loglevel=info
else
    npm install --loglevel=info
fi
