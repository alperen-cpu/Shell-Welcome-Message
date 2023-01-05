#!/bin/bash
bold=$(tput bold)
normal=$(tput sgr0)
echo "#--------------------${bold}Welcome $USER${normal}--------------------#"
echo "${bold}Date:${normal}";date
echo "${bold}Server uptime:${normal}" && uptime -p
echo "${bold}Last Logins:${normal}" && last $USER | head -n 5
echo "--------------------"
echo "${bold}Disk Info:${normal}"
df -h -t ext4 | awk '{print $2 " " $3 " " $4}'
echo "${bold}Memory Info:${normal}"
cat /proc/meminfo | numfmt --field 2 --from-unit=Ki --to-unit=Mi | sed 's/ kB/M/g'| grep -e "MemFree" -we "MemTotal"
echo "--------------------"
echo "CPU Usage: "$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]"%"