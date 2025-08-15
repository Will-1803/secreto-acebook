#!/usr/bin/env bash
set -euo pipefail

APP_DIR="/home/ec2-user/acebook-app"
LOG_FILE="$APP_DIR/deploy_install.log"

mkdir -p "$APP_DIR"
cd "$APP_DIR"

echo "=== Starting install_dependencies.sh ===" | tee -a "$LOG_FILE"

# Check Node.js
if ! command -v node >/dev/null 2>&1; then
    echo "Node.js not found, installing..." | tee -a "$LOG_FILE"
    sudo dnf -y install nodejs npm | tee -a "$LOG_FILE"
else
    echo "Node.js is already installed" | tee -a "$LOG_FILE"
fi

# Install npm dependencies
if [ -f package-lock.json ]; then
    echo "Running npm ci..." | tee -a "$LOG_FILE"
    npm ci --loglevel=info | tee -a "$LOG_FILE"
else
    echo "Running npm install..." | tee -a "$LOG_FILE"
    npm install --loglevel=info | tee -a "$LOG_FILE"
fi

echo "=== Finished install_dependencies.sh ===" | tee -a "$LOG_FILE"