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
        echo "                    #################        "
        echo "${nc}"
        
        color=$(($color+1))
    else
        printf "${arr[$color]}"
        echo '         ##########################################'
        echo '         #   !!! /var/testtfil1 has changed !!!   #'
        #printf "%.1f\n" "old change" $old_change "new change" $new_change
        echo "         #     old change $old_change     #"
        echo "         #     new change $new_change     #"
        echo "         ##########################################"
        echo "${nc}"
        
        color=$(($color+1))
		old_change=$new_change
		rad=$(cat /tmp/log/labb2.log | wc -l)

        #echo '### Last line number in log:' $rad '###'

        if [ "$rad" = "0" ]
        then
            printf "${arr[$color]}"
            echo ''
            echo '      ###############################################'
            echo '      #      Log empty, starting from line #1       #'
            echo "1 $(date) - The file has been changed" > /tmp/log/labb2.log
            echo '      ###############################################'
            echo "${nc}"
            color=$(($color+1))
        else
            printf "${arr[$color]}"
            echo '##########################################################'
            echo "        Appending line#: $(($rad+1)) to /tmp/log/labb2.bak  "
            echo '##########################################################'
            if [ $(($rad+1)) -eq 6 ]
            then
                sleep 4
                echo ''
                echo ''
                echo "                        ${red}OH ${pin} ${blink} ${bol} YEAH! ${nc}"
                echo ''
                echo ''
            fi

            echo "${nc}"
            echo "$(($rad+1)) $(date) - The file has been changed" >> /tmp/log/labb2.log
            color=$(($color+1))
            
        fi
    fi

    /usr/local/bin/log_chkr.sh
    
    if [ $color -gt 8 ]
    then
        color=0
    fi
    sleep 10
done
