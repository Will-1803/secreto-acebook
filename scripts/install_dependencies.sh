#!/bin/bash
cd /home/ubuntu/acebook-app
# give read access to package...
COPY --chown=user:user package-lock.json .
# Install Node.js dependencies
npm install