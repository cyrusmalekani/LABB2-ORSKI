#!/bin/bash
echo "#REMOVING BACKUP LOG /usr/log/log_test1.bak #"
rm /usr/log/log_test1.bak
touch /usr/log/log_test1.bak
chmod 777 /usr/log/log_test1.bak
echo "# Finished Deleting and creating new log #"