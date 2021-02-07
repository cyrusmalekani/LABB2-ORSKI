#!/bin/bash

changed=$(stat --format=%Z /var/testfil1)

while [ 1 ]
do
 echo " "
 new_change=$(stat --format=%Z /var/testfil1)
 if [ $changed -eq $new_change ]
 then
  echo "### NO CHANGE ###"
  echo changed $changed
  echo new_change $new_change
  echo "#################"
 else
  echo "### testtfil1 has changed ###"
  echo current $changed
  echo change $new_change
  changed=$new_change
  rad=$(tail -1 /usr/log/test1.log | cut -f1 -d ' ')
  echo "Last line number in log:" $rad
  if [ -z "$rad" ]
  then
   echo "Log empty, makeing line #1"
   echo "1 $(date)" > /usr/log/test1.log
  else
   echo "Appending line#:" $(($rad+1))
   echo "$(($rad+1)) $(date)" >> /usr/log/test1.log
  fi
  echo "#############################"
 fi
 /usr/bin/log_chkr.sh
 sleep 10
done