#!/bin/bash

USER=$(whoami)
rm -rf /tmp/lastlogin.txt
echo "███████████████████████████████████████████████████████████████"
echo "█                                                             █"
echo "█               ${bold}Welcome to My Server${normal}                          █"
echo "█                                                             █"
echo "███████████████████████████████████████████████████████████████"
echo ""
echo "  Date: $(date)"
echo "  Server uptime: $(uptime -p)"
echo ""
echo "  Operating System:"
echo "    Distribution: $(cat /etc/os-release | grep '^NAME' | cut -d '"' -f2)"
echo "    Version: $(cat /etc/os-release | grep '^VERSION_ID' | cut -d '"' -f2)"
echo ""
echo "  Last Logins:"
last $USER | head -n 3
echo ""
last $USER | head -n 3 >> /tmp/lastlogin.txt
echo -e "Subject: SSH Login $HOSTNAME\r\n\r\nThe user $USER is logged into the $HOSTNAME server.\nLast Login:\n`cat /tmp/lastlogin.txt`" | msmtp -a mail example@example.com
echo "  Sending email..."
echo "  Email sent."
echo ""
echo "  Disk Info:"
df / -H --output=source,size,used,avail
echo ""
echo "  Memory Info:"
awk '$3=="kB" {
    if ($2 > 1024^2) {
        $2 = $2 / 1024^2;
        $3 = "GB";
    } else if ($2 > 1024) {
        $2 = $2 / 1024;
        $3 = "MB";
    }
} 1' /proc/meminfo | grep -e "MemTotal" -e "MemFree" -e "MemAvailable"
echo ""
echo "  CPU Info:"
cpu_usage=$(vmstat 1 2 | tail -1 | awk '{print 100 - $15}')
echo "  CPU Usage: ${cpu_usage}%"
