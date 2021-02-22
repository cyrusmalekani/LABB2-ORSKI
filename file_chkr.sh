#!/bin/bash
source common.sh
color=0

while [ 1 ]
do
    #echo 'Executing Loop'
    new_change=$(stat -t --format=%.19z /var/testfil1)
    echo ''
    if [ "$old_change" = "$new_change" ]
    then
        printf "${arr[$color]}"
        echo "                    #################             "
	    echo '                    ### NO CHANGE ###             '
        echo "                    #################        ${nc}"
        echo ''
        color=$(($color+1))
    else
        echo '         ##########################################'
        echo '         #   !!! /var/testtfil1 has changed !!!   #'
        #printf "%.1f\n" "old change" $old_change "new change" $new_change
        echo "         #     old change $old_change     #"
        echo "         #     new change $new_change     #"
        echo "         ##########################################"
        echo ''

		old_change=$new_change
		rad=$(cat /tmp/log/labb2.log | wc -l)

        #echo '### Last line number in log:' $rad '###'

        if [ "$rad" = "0" ]
        then
            echo ''
            echo '      ###############################################'
            echo '      #      Log empty, starting from line #1       #'
            echo "1 $(date) - The file has been changed" > /tmp/log/labb2.log
            echo '      ###############################################'
        else
            echo '##########################################################'
            echo "        Appending line#: $(($rad+1)) to /tmp/log/labb2.bak  "
            echo '##########################################################'
            
            echo "$(($rad+1)) $(date) - The file has been changed" >> /tmp/log/labb2.log
        fi
            echo ''
    fi
    /usr/local/bin/log_chkr.sh
    sleep 10
done
