#!/bin/bash
bold=$(tput bold)
normal=$(tput sgr0)
echo "#--------------------${bold}Welcome $USER ${normal}--------------------#"
echo "${bold}Date:${normal}";date
echo "${bold}Server uptime:${normal}" && uptime -p
echo "${bold}Operating system:${normal}";cat /etc/os-release | grep '^VERSION' /etc/os-release | grep -E '^(VERSION|NAME)=' /etc/os-release
echo "${bold}Last Logins:${normal}" && last $USER | head -n 3;last $USER | head -n 3 >> /tmp/lastlogin.txt
echo "Sending email..."
echo -e "\nThe user $USER is logged into the $HOSTNAME server.\nLast Login:\n`cat /tmp/lastlogin.txt`" | msmtp -a mail example@example.com
echo "--------------------"
echo "${bold}Disk Info:${normal}"
df / -H --output=source,size,used,avail
echo "${bold}Memory Info:${normal}"
awk '$3=="kB"{if ($2>1024^2){$2=$2/1024^2;$3="GB";} else if ($2>1024){$2=$2/1024;$3="MB";}} 1' /proc/meminfo | column -t| grep -e "MemFree" -we "MemTotal" -we "MemAvailable"
echo "--------------------"
echo "${bold}CPU Info:${normal}"
echo "CPU Usage: "$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]"%"
