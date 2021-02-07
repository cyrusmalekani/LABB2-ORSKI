#!/bin/bash
# Script for setting up and running LABB2
# Written by Cyrus Malekani 2021

if [ $(id -u) != "0" ]; then
echo 'You must be the superuser to run this script' >&2
exit 1
fi

echo '# Creating necessary log/test-files and directories #'
mkdir /tmp/log/
touch /var/testfil1
touch /tmp/log/test1.log
touch /tmp/log/log_test1.bak

echo '# Copying files in current directory to /usr/local/bin/ #'
cp ./file_checker.sh /usr/local/bin/file_checker.sh
cp ./file_changer.sh /usr/local/bin/file_changer.sh
cp ./log_chkr.sh /usr/local/bin/log_chkr.sh
cp ./log_deleter.sh /usr/local/bin/log_deleter.sh

echo '# Changing rights on scripts and logs#'
chmod 755 /usr/local/bin/file_checker.sh
chmod 755 /usr/local/bin/file_changer.sh
chmod 755 /usr/local/bin/log_chkr.sh
chmod 755 /usr/local/bin/log_deleter.sh
chmod 777 /tmp/log/test1.log
chmod 777 /tmp/log/log_test1.bak
chmod 777 /var/testfil1

echo '# Adding root cronjob (default every 5 minutes) #'
echo '*/5 * * * * /usr/local/bin/log_deleter.sh' | crontab

echo '# Done setting up for LABB 2 #'

echo '# Running scripts with parallel - sending outpout to stdout #'
echo '# Use CTRL-C to stop all scripts running #'
(trap 'kill 0' SIGINT; /usr/local/bin/file_checker.sh & /usr/local/bin/file_changer.sh)
