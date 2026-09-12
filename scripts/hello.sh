#!/bin/bash

echo "Running the script : $0"
echo "Hello Devops"
echo "Current User : $(whoami) "
echo "Hostname : $(hostname) "
echo "user : $USER "
echo "home : $HOME "
current_date=$(date)
echo "Current Date = $current_date"

echo
echo "Checking the User.."
if [ $USER = "root" ]; then
	echo "Running as root"
	
else
	echo "Running as $USER"

fi

echo
echo "Checking if pwd exists..."

if [ -f "/etc/pwd" ]; then
	echo "yes it does"
else
	echo "unable to find"
fi

echo
for servers in web1 web2 web3
do
	echo "checking $servers"

done

#echo
#echo "checking files in log.."

#for file in /var/log/*
#do 
#	echo "$file"
#done
echo

echo "Testing while loop"

count=1

while [ $count -le 5 ]
do 
	echo "Count : $count"
	count=$((count+1))

done
























