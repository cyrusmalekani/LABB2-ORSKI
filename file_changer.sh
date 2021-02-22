#!/bin/bash
var=1
while [ 1 ]
do
    echo ''
    echo "#      Appending $var to /var/testfil1        #"
    echo "$var" >> /var/testfil1
    var=$(($var+1))
    sleep 15
done
