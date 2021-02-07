#!/bin/bash
echo '# Uninstalling ... Removing files and dirs # '
rm /usr/local/bin/file_checker.sh
rm /usr/local/bin/file_changer.sh
rm /usr/local/bin/log_chkr.sh
rm /usr/local/bin/log_deleter.sh
rm /var/testfil1
rm -r /tmp/log
crontab -l -u root | grep -v log_deleter.sh | crontab -u root -
echo '# Removed job from crontab #'
echo '# Uninstallation finished ... #'
