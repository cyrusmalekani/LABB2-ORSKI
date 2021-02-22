#!/bin/bash
source common.sh
color=0

while [ 1 ]
do
    new_change=$(stat -t --format=%.19z /var/testfil1)
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
        echo "         #     old change $old_change     #"
        echo "         #     new change $new_change     #"
        echo "         ##########################################"
        echo "${nc}"
        
        color=$(($color+1))
		old_change=$new_change
		rad=$(cat /tmp/log/labb2.log | wc -l)

        if [ "$rad" = "0" ]
        then
            printf "${arr[$color]}"
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
            echo ''
			if [ $(($rad+1)) -eq 6 ]
            then
                sleep 4
                echo ''
                echo ''
                echo "                        ${red}OH ${pin} ${blink} ${bol} YEAH! ${nc}"
                echo ''
                echo ''
                sleep 2
                echo "############ Written by ##################################"
                echo "#     ${red}Cyrus Malekani${nc}, ${blu}Victor Åhgren${nc}, ${yel}Niklas Gerdin${nc}       #"
                echo "#     ${pin}Christopher${nc} , ${gre}Marcus Petsén${nc} -  2021 - IT20S        #" 
                echo "##########################################################"
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
