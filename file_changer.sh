#!/bin/bash
var=1
while [ 1 ]
do
	sleep 15
    echo ''
    echo '##########################################################'
    echo "               Appending $var to /var/testfil1       "
    echo '##########################################################'
    echo ''
    echo "$var" >> /var/testfil1
    
    color=$(($color+1))
    var=$(($var+1))
done
    
