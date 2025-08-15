#!/usr/bin/env bash
set -euo pipefail

APP_DIR="/home/ec2-user/acebook-app"

# 1) Take ownership of everything CodeDeploy just copied (it’s root-owned)
sudo chown -R ec2-user:ec2-user "$APP_DIR"

# 2) (Optional) normalize perms now that we own them
find "$APP_DIR" -type d -exec chmod 755 {} \;
find "$APP_DIR" -type f -exec chmod 644 {} \;

cd "$APP_DIR"

# 3) Ensure Node/npm are present (Amazon Linux 2023)
if ! command -v node >/dev/null 2>&1; then
  sudo dnf -y install nodejs npm
fi

# 4) Install deps (now writable)
if [ -f package-lock.json ]; then
  npm ci
else
  npm install
fi

# 5) Build if needed
# npm run build
