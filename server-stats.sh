#!/usr/bin/env bash

echo "System Info"
echo "==================================================="
echo
echo "Total CPU Usage:"
top -bn1 | grep "Cpu(s)" | cut -d "," -f4 | awk '{print 100-$1 "%"}'
echo
echo "Total Memory Usage:"
free -h | grep -i "mem" | awk '{printf "total - %-5s used - %-5s available - %-5s\n", $2, $3, $7}'
echo
echo "Total Disk Usage:"
df -h | grep "/dev/" | grep -v "tmpfs"
echo
echo "Top 5 Memory Processes:"
ps axu --sort -%mem | head -n 6 | awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $11}'
echo
echo "Top 5 CPU Processes:"
ps axu --sort -%cpu | grep -v "ps" | head -n 6 | awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $11}'