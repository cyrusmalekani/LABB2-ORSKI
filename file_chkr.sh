#!/bin/bash
source common.sh

while [ 1 ]
do
    #echo 'Executing Loop'
    new_change=$(stat --format=%Z /var/testfil1)
    echo ' '
    if [ $old_change -eq $new_change ]
    then
        echo '#################'
	    echo '### NO CHANGE ###'
        #echo old_change $old_change
        #echo new_change $new_change
        echo '#################'
        echo ''
    else
        echo ''
        echo '##########################################'
        echo '### !!! /var/testtfil1 has changed !!! ###'
        echo "       old change $old_change             "
        echo "       new change $new_change             "
        echo "##########################################"
        echo ''

		old_change=$new_change
		rad=$(cat /tmp/log/labb2.log | wc -l)

        #echo '### Last line number in log:' $rad '###'

        if [ "$rad" = "0" ]
        then
            echo ''
            echo '###############################################'
            echo '#      Log empty, starting from line #1       #'
            echo "1 $(date) - The file has been changed" > /tmp/log/labb2.log
        else
            echo "#       Appending line#: $(($rad+1))          #"
            echo "$(($rad+1)) $(date) - The file has been changed" >> /tmp/log/labb2.log
        fi
            echo '###############################################'
            echo ''
    fi
    /usr/local/bin/log_chkr.sh
    sleep 10
done
