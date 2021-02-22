#!/bin/bash
old_change=$(stat -t --format=%.19z /var/testfil1)

red=`tput setaf 1`
gre=`tput setaf 2`
yel=`tput setaf 3`
blu=`tput setaf 4`
pin=`tput setaf 5`
bol=`tput bold`
nc=`tput sgr0`
blink=`tput blink`

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

declare -A arr
arr[0]=$BIRed
arr[1]=$BIGreen
arr[2]=$red
arr[3]=$gre
arr[4]=$blu
arr[5]=$pin
arr[6]=$BIYellow
arr[7]=$BIBlue
arr[8]=$BIPurple
arr[9]=$BICyan
