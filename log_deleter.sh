#!/bin/bash
echo '#REMOVING BACKUP LOG /usr/log/log_test1.bak #'
rm /tmp/log/log_test1.bak
touch /tmp/log/log_test1.bak
chmod 777 /tmp/log/log_test1.bak
echo '# Finished Deleting and creating new log #'
