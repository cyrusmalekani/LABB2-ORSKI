#!/bin/bash
printf "\033c"
source common.sh

if [ $(id -u) != "0" ]; then
echo 'You must be the superuser to run this script' >&2
exit 1
fi

pkill mplayer

echo '############################################'
echo '# Uninstalling ... Removing files and dirs #'
rm /usr/local/bin/file_chkr.sh
rm /usr/local/bin/file_changer.sh
rm /usr/local/bin/log_chkr.sh
rm /usr/local/bin/bak_del.sh
rm /var/testfil1
rm -r /tmp/log
crontab -l -u root | grep -v bak_del.sh | crontab -u root -
echo '#        Removed job from crontab          #'
echo '#       Uninstallation finished ...        #'
echo '#                   ***                    #'
echo "#         ${red} ${bol}Thank ${pin}you,${blink} ${blu}come ${yel}again ${gre}!${nc}         #"
echo '############################################'
