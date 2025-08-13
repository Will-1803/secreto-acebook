#!/bin/bash
cd /home/ubuntu/acebook-app
# Start the app using pm2 to keep it running
pm2 start npm --name "acebook" -- start