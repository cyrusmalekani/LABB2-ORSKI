#!/bin/bash
var=1
while [ 1 ]
do
	sleep 15
    printf "${arr[$color]}"
    echo '##########################################################'
    echo "               Appending $var to /var/testfil1       "
    echo '##########################################################'
    echo "${nc}"
    echo "$var" >> /var/testfil1
    
    color=$(($color+1))
    var=$(($var+1))
done
    
