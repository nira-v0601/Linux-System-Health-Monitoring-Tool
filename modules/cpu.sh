#!/bin/bash

echo "⚙️ CPU Load:"
top -bn1 | grep "load average"

source utils/formatter.sh

echo "⚙️ CPU Load:"
load=$(top -bn1 | grep "load average" | awk -F'load average:' '{print $2}')

print_ok "Load Average:$load"
