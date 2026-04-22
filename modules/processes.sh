#!/bin/bash

echo "🔥 Top 5 CPU Processes:"
ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu | head -n 6

echo ""
echo "🧠 Top 5 Memory Processes:"
ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%mem | head -n 6
