#!/bin/bash

rad=$(cat /tmp/log/labb2.log | wc -l)

if [ $rad -gt 9 ]
then
	echo '##########################################################'
    echo '###    /tmp/log/labb2.log HAS REACHED 10 LINES         ###'
    echo '### APPENDING /tmp/log/labb2.log TO /tmp/log/labb2.bak ###'
    cat /tmp/log/labb2.log >> /tmp/log/labb2.bak
    echo '###          Cleaning up /tmp/log/lab2.log !           ###'
    echo '##########################################################'

    truncate -s 0 /tmp/log/labb2.log
fi
