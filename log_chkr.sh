#!/bin/bash

rad=$(cat /tmp/log/test1.log | wc -l)

if [ $rad -gt 9 ]
then
   echo '### LOG HAS REACHED 10 LINES ###'
   echo '### APPENDING TO /tmp/log/log_test1.bak ###'
   cat /tmp/log/test1.log >> /tmp/log/log_test1.bak
   echo '### Cleaning! ###'
   truncate -s 0 /tmp/log/test1.log
else
   echo '# LOG LOOKS FINE #'
fi
