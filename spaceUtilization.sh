#!/bin/bash

# used cron to monitor
# I did crontab -e
# then I put * * * * * sh /home/admin/spaceUtilization.sh

tmp=`df | awk -F' ' 'NR==2{print $5}'`
tmp2=${tmp::-1}

if [ $tmp2 -ge 80 ]; then
	echo "CPU percentage greater than 80%" | mailx -s "ALERT" root

fi
