***********************************************************************
DAY-2
***********************************************************************

pwd - prints working dir

cd /  -> takes you to root dir(absolute top level)

cd .. -> moves one level up in file hierarchy

cd -> takes you to home dir (where general files are saved)

cd ~  -> takes to Personal Home Directory
Takes you directly to your current user's personal home directory.
e.g. /home/username or /root if you are logged in as the root user.

cd dir -> takes you to  stated dir - provided that dir is present in current dir.


**********


mkdir - create folder/dir

touch - create files


ls -> list of files n folder (horizontal) present in current dir

ls -l -> listing of files with permissions (tabular)

ls -la -> listing of files (with hidden ones) with permissions (tabular)

ls -a -> includes hidden ones

ls -as -> with size

ls -l f1 -> displays files permission jst for the mentioned file

************

echo "hello world" >> file1.txt -> adds content to file1.txt

echo "xyxyxyx" > file1.txt -> overwrites all content in file1.txt

echo "help" -> prints the following text, in this case -> help

echo "new file f3" > f3 → creates f3 and writes the mentioned content

cat f1 -> scans and prints the content inside the file

cat > f2 -> creates f2 and lets u write content in it

************


cp f1 config/ -> copy the f1 file and pastes in config dir

mv congif.txt configs/ → moves the file to configs

rm f1 f2 f3 -> deletes the mentioned file(s)

rm -r dir1 dir2 -> deletes the directory (remove recursively)

rm -rf dir1 -> deletes all files/dir without any prompts

*************

PERMISSIONS

ctrl+c - terminates the current process

rwx -> read+write+execute - represents permissions
r=4; w=2; x=1; '-' is equal to 0;

if a file/folder has

rwx r-- r-- -> user have all privileges / read only for group & others
owner group others

chmod 755 test.sh ==> chmod rwxr-xr-x test.sh

group is a logical collection of user accounts.
manage system permissions for multiple users simultaneously

chmod +x test.h -> adds the execute permission for all users
(the owner, the group, and others)

Typically, directories should be set to 755 and files to 644.

chown - changes ownerships



****************

sudo -> Runs the command with administrator (root) privileges, which are required to write and update system files

sudo apt update -> refreshes your local list of available software packages and their versions from your system's configured repositories

****************

PROCESSES

process is an active instance of a running program

ps - > process state - used to display a static snapshot of currently running processes on a system


CPU USAGE

ps aux -> shows us detailed static snap of the running process along with its cpu usage, memory usage, pid, user of the process.

top -> gives live view of all the running processes along with CPU/memory/pid,user

htop -> does same thing with better visuals

ps aux | grep ssh -> find running SSH processes on your system

Define - How much processing capacity the system's core chips are using to execute calculations.

Issue when Full - Programs freeze, the mouse lag/stutters, and tasks take much longer to finish
******************

KILLING A PROCESS

kill 3311 ==> kill -15 3311 -> command is used to send a signal to process with id 3311 to terminate the running program.

kill -9 4444 -> Force kill. Instantly terminates the program. Use this if a program is frozen.

pkill -Process Kill. terminate or send signals to running programs by their process name instead of Process ID (PID).

pkill java
pkill ssh

*******************

DISK USAGE

df -h -> this shows filesystem disk usage. ( disk free- human readable)

//production suddenly reports:No space left on device

your first checks might include -> df- h

du -sh * -> display the size of every file and folder in your current directory.

sh - summary in human readable

du -sh /var/* - display the size of every file under var dir.

du -sh /var/* | sort -h -> sorts in ascending order.


Define - How much space is taken up on your Hard Drive / SSD (saved files, logs, OS files).

Issue when full - Cannot save new files, updates fail, and log files stop writing

*********************

MEMORY USAGE

free -h -> is used to check your system's memory (RAM) usage

Scenario-1:
If an application is behaving strangely due to resource exhaustion, you'd investigate:

free -h
top
ps aux

Define - How much temporary workspace is filled by currently running applications.

Issue when full - The system slows down to a crawl, uses emergency Swap space, or forces apps to crash.

*************

ENVIROMENT VARIABLES

Environment variables are system-wide key-value pairs that contain background configuration settings used by the shell, programs, and system scripts.

printenv -> display all the environment variables currently configured in your Linux environment.


printenv PATH ==> echo $PATH ->displays value stored in PATH variable.


USER=username - The name of the user currently logged into the session.

HOME=/home/username - The path to your current user's home directory.

PATH=/usr/local/bin:/usr/bin:... - A list of directories your shell searches through whenever you type a command.

SHELL=/bin/bash → The type of terminal shell you are currently using (e.g., Bash or Zsh).

PWD=/var/log → Your current present working directory.

************************

which git ==> type git -> used to find the exact file path of the Git executable that your shell runs when you type git

command -v get -> modern way to check if Git is installed and locate its file path in Linux.

it prints -  /usr/bin/git

**************************
SUPER IMP. - GREP

Global Regular Expression Print.

grep - used to filter results by doing pattern matching - case sensitive.

grep ERROR app.log → displays logs/lines with error mentioned in it

grep -i error app.log → ignores case and does same as above.

grep -c error app.log → prints the no of times error occurred

*************************

SUPER IMP. - TAIL

tail app.log → display the final 10 lines of your app.log file.

tail -f app.log  →  It keeps the file open in your terminal and streams new log lines in real-time as they happen

tail -n 3 app.log → display only specific lines from the end. here only last 3 lines.

tail -n+2 app.log -> displays all log lines from 2nd line.

**************************

Scenario-2:

"Production is returning 500 errors. Investigate."

s1→ cat production.log
s2→ grep -i error production.log
s3→ grep -c error production.log
s4→ grep -i database production.log
s5→ tail -f production.log
