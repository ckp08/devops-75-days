#!/bin/bash

set -euo pipefail

echo "Hostname : $(hostname)"
echo "Current User : $(whoami)"
echo "Uptime : $(uptime)"
echo
echo "CPU/Load Information / Top Processes : $(ps aux --sort=%cpu | head)"
echo
echo "Memory Usage : $(free -h)"
echo
echo "Disk Usage : $(df -h)"
echo
echo "Checking NGINX STATUS...."
sudo systemctl is-active nginx

echo
echo "Checking Port 80 Status..."
if ss -tulpn | grep -q :80; then
	echo "yes"
else
	echo "no"
fi


