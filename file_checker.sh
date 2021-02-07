#!/bin/bash
source common.sh

while [ 1 ]
do
    new_change=$(stat --format=%Z /var/testfil1)
    echo ' '
    if [ $changed -eq $new_change ]
    then
        echo '### NO CHANGE ###'
        echo changed $changed
        echo new_change $new_change
        echo '#################'
    else
        echo '### testtfil1 has changed ###'
        echo current $changed
        echo change $new_change
        changed=$new_change
	rad=$(cat /tmp/log/test1.log | wc -l)
        echo 'Last line number in log:' $rad

        if [ $rad = "0" ]
        then
            echo 'Log empty, makeing line #1'
            echo "1 $(date)" > /tmp/log/test1.log
        else
            echo "Appending line#: $(($rad+1))"
            echo "$(($rad+1)) $(date)" >> /tmp/log/test1.log
        fi
    echo '#############################'
    fi
    /usr/local/bin/log_chkr.sh
    sleep 10
done
