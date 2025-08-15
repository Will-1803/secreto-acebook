#!/bin/bash
cd /home/ec2-user/acebook-app
# Start the app using pm2 to keep it running
pm2 start npm --name "acebook" -- start 