#!/bin/bash
cd /home/ubuntu/acebook-app
# give read access to package...
chmod ugo+r ./package-lock.json
# Install Node.js dependencies
npm install