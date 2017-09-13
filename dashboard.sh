#!/bin/bash

LA=`uptime | awk -F',  ' '{print $3}'`
FREE=`free | awk -F'      ' 'NR==2{print $4}'`
FREECONVERT=$(((FREE+999)/1000))
echo "CPU AND MEMORY RESOURCES-------------------------"
echo "CPU" $LA "   " "Free RAM:" $FREECONVERT "MB"
echo
echo

PNG=""
IOB=`cat /proc/net/dev | awk -F' ' 'NR==4{print $2}'`
IOT=`cat /proc/net/dev | awk -F' ' 'NR==4{print $3}'`
ENPOS=`cat /proc/net/dev | awk -F' ' 'NR==3{print $2}'`
ENPOST=`cat /proc/net/dev | awk -F' ' 'NR==3{print $3}'`
if ping -qc 1 www.google.com; then PNG="Yes"; else PNG="No"; fi

echo "NETWORK CONNECTIONS-------------------------"
echo
echo "Io Bytes Received: $IOB" "   " "Bytes Transmitted: $IOT"
echo
echo "enp0s3 Bytes Received: $ENPOS" "   " "Bytes Transmitted: $ENPOST"
echo
echo "Internet Connectivity: $PNG"
echo
echo

TU=`cat /etc/passwd | awk -F':' '{print $7}' | grep '/bin/bash' | wc -l`
NA=`who | wc -l`
MU=`cat /etc/passwd | awk -F':' '{print $7}' | uniq -c | sort | awk -F' ' 'NR==1{print $2}'`

echo "ACCOUNT INFORMATION------------------"
echo
echo "Total Users: $TU" "   " "Number Active: $NA"
echo
echo "Most Frequently Used Shell: $MU"
echo
echo
