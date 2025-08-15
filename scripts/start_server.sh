#!/usr/bin/env bash
set -e

cd /home/ec2-user/acebook-app
pm2 start npm --name "acebook" -- start