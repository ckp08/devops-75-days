#!/bin/bash

set -euo pipefail

echo "****************"
echo "Checking Server Health"
echo "****************"

echo
echo "Hostname: "
hostname

echo
echo "Current User: "
whoami

echo
echo "Uptime : " 
uptime

echo
echo "Disk Usage : "
df -h

echo
echo "Memory : "
free -h

echo
echo "Checking Nginx Status..."
if  systemctl is-active --quiet nginx ; then
	echo "NGINX IS RUNNING"
else
	echo "NGINX IS NOT RUNNING"
fi

echo
check_disk_usage(){
	
disk_usage=$(df -h / | awk 'NR==2 {gsub("%","",$5); print $5}')

THRESHOLD=80

if [ $disk_usage -ge $THRESHOLD ]; then
	echo "WARNING : DISK USAGE IS ABOVE $THRESHOLD"
else
	echo "DIKS IS RUNNING AT NORMAL LEVEL"
fi

}

echo "Checking Disk Usage..." 
check_disk_usage

echo
check_port_80(){

if ss -tulpn | grep -q :80; then
	echo "PORT 80 is LISTENING"
else
	echo "WARNING : PORT 80 is not listening"
fi
}

check_port_80

echo
echo "Checking Recent NGNINX ERRORs..."
sudo tail -n 10 /var/log/nginx/error.log























