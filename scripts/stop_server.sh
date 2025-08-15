#!/usr/bin/env bash
set -e

APP_NAME="acebook"

if command -v pm2 &>/dev/null && pm2 list | grep -q "$APP_NAME"; then
  pm2 stop "$APP_NAME"
fi