#!/bin/bash
cd /home/ec2-user/acebook-app
# give read access to package...
chmod ugo+r ./package-lock.json
# Install Node.js dependencies
npm install