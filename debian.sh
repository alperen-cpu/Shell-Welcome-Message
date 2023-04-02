#!/bin/bash
USER=$(whoami)
rm -rf /tmp/lastlogin.txt
bold=$(tput bold)
normal=$(tput sgr0)
echo "#--------------------${bold}Welcome $USER ${normal}--------------------#"
echo "${bold}Date:${normal}";date
echo "${bold}Server uptime:${normal}" && uptime -p
echo "${bold}Operating system:${normal}";cat /etc/os-release | grep '^VERSION' /etc/os-release | grep -E '^(VERSION|NAME)=' /etc/os-release
echo "${bold}Last Logins:${normal}" && last $USER | head -n 3;last $USER | head -n 3 >> /tmp/lastlogin.txt
echo "Sending email..."
echo -e "Subject: SSH Login $HOSTNAME\r\n\r\nThe user $USER is logged into the $HOSTNAME server.\nLast Login:\n`cat /tmp/lastlogin.txt`" | msmtp -a mail example@example.com
echo "--------------------"
echo "${bold}Disk Info:${normal}"
df -h -t ext4 | awk '{print $2 " " $3 " " $4}'
echo "${bold}Memory Info:${normal}"
cat /proc/meminfo | numfmt --field 2 --from-unit=Ki --to-unit=Mi | sed 's/ kB/M/g'| grep -e "MemFree" -we "MemTotal"
echo "--------------------"
echo "${bold}CPU Info:${normal}"
echo "CPU Usage: "$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]"%"
