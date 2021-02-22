#!/bin/bash
# Script for setting up and running LABB2
echo "# Written by ##################################"
echo "# Cyrus Malekani, Victor Åhgren, Niklas Gerdin#"
echo "# Christopher , Marcus Petsén -  2021         #" 
echo "###############################################"
echo ''

if [ $(id -u) != "0" ]; then
echo 'You must be the superuser to run this script' >&2
exit 1
fi

echo '#   Creating necessary log/test-files and directories   #'
mkdir /tmp/log/
touch /var/testfil1
touch /tmp/log/labb2.log
touch /tmp/log/labb2.bak

echo '# Copying files in current directory to /usr/local/bin/ #'
cp ./file_chkr.sh /usr/local/bin/file_chkr.sh
cp ./file_changer.sh /usr/local/bin/file_changer.sh
cp ./log_chkr.sh /usr/local/bin/log_chkr.sh
cp ./bak_del.sh /usr/local/bin/bak_del.sh

echo '#       Changing rights on scripts and logs             #'
chmod 705 /usr/local/bin/file_chkr.sh
chmod 705 /usr/local/bin/file_changer.sh
chmod 705 /usr/local/bin/log_chkr.sh
chmod 705 /usr/local/bin/bak_del.sh
chmod 505 /tmp/log/labb2.log
chmod 505 /tmp/log/labb2.bak
chmod 505 /var/testfil1
echo ''
echo '#     Adding root cronjob (default every 5 minutes)      #'
echo '*/5 * * * * /usr/local/bin/bak_del.sh' | crontab
echo ''
echo '#         *** Done setting up for LABB 2 ***             #'
echo ''
echo '# Running scripts in parallel - sending output to stdout #'
echo '#        Use CTRL-C to stop all scripts running          #'

(trap 'kill 0' SIGINT; /usr/local/bin/file_chkr.sh & /usr/local/bin/file_changer.sh)
