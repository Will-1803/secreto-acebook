#!/usr/bin/env bash
set -euo pipefail

cd /home/ec2-user/acebook-app

# Ensure Node is installed
if ! command -v node >/dev/null 2>&1; then
  sudo dnf -y install nodejs npm
fi

# Install dependencies
if [ -f package-lock.json ]; then
  npm ci
else
  npm install
fi