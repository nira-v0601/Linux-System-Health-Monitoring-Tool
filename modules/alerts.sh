#!/bin/bash

THRESHOLD=80

echo "🚨 Disk Usage Alerts:"

df -h | awk 'NR>1 {print $5 " " $1}' | while read output;
do
  usage=$(echo $output | awk '{print $1}' | sed 's/%//g')
  partition=$(echo $output | awk '{print $2}')

  if [ $usage -ge $THRESHOLD ]; then
    source utils/formatter.sh
print_alert "$partition usage is at ${usage}%"
  fi
done
