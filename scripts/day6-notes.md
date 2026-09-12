********************************************************************************
DAY-6
********************************************************************************

Shell - any program that provides a user interface to access the services of a computer's operating system kernel.

ex - cmd(in windows),bash (in ubuntu)


Bash - a command-line interpreter and scripting language used to interact with an operating system.

combining multiple terminal commands into a single file (a bash script) - automate repetitive tasks.

#!/bin/bash (shebang) - By writing #!/bin/bash, you ensure the script always runs using Bash rules.


**************

VARIABLES in Bash Script

name="Chetan" // creates a var name with value Chetan

echo "Hello $name" → prints Hello Chetan

Environment Variables

echo $HOME
echo $USER
echo $PATH


- Putting the o/p of a command into a variable.

hostname=$(hostname)
echo "Server : $hostname" → prints hostname

current_date=$(date)

echo "Current Date : $current_date"

*********************

USER INPUT

read -p " your_name : " name → takes a input and stores in the variable name

echo "Hello $name" → prints the name you gave as input

SPECIAL VARIABLES

echo $0 → script name
$1 / $2 - first and second argument

$# - No of arguments

$@ - All arguments

$? - Exit status/codes of previous commands

************************

IF-ELSE LOOP

if [ "$USER = "root"]; then
 echo "Root is running"
else
 echo "Not running as root"
fi

***********************

CHECKING IF A FILE EXISTS

if [ -f "/etc/pwd" ]; then
 echo "password file exists"
else
 echo " password file doesn't exist"
fi

OR

[ -f "/etc/passwd" ] && echo "File exists"

-f : to check if a regular file exists
-d : to check if a dir exists
-e : to check if anything exists
-r,-w,-x : to check if file exists and is it readable/writable/executable
-s : to check if file exists and is not empty

*************************

SCRIPT TO CHECK DISK USAGE

disk_usage=$(df -h / | awk 'NR==2 {print $5}')
echo "Disk Usage : $disk_usage"

NR - row no / skill all rows before that
$5 - print the 5th column data

***********************

COMPARING NUMBERS

if [ $disk_usage -gt 80 ]; then
 echo "WARNINGc: Disk usage is high"
else
 echo "Disk usage is normal"
fi

-eq : equal
-gt : greater then
-ge : greater or equal
-ne : not equal
-lt : less than
-le : less or equal

*********************

FOR LOOPS
 
for server in web1 web2 web3
do
 echo "Checking $server"
done

o/p :
Checking web1
Checking web2
Checking web3

***********************
LOOP THROUGH FILES

for file in /var/log/*
do
 echo "$file"
done

→ prints all file names present in /var/log

***********************

set -e → instantly stops and exits the script if any command fails.
(detects non-zero exit code)

set -u → Exit on Unset Variable.

set -euo pipefail:

-e → fail on many command errors
-u → catch unset variables
-o pipefail → make pipelines fail if an underlying command fails

**********************

FUNCTIONS

check_disk() {

echo "checking disk..."
df -h /

}

check_memory() {

echo "Checking free memory..."
free -h
}


check_disk // calls the function
check_memory // calls the function


**************************

disk_usage=$(df -h / | awk 'NR==2 {gsub("%","",$5); print $5}')

→ prints cpu usage percentage in integer form by deleting % symbol

--
