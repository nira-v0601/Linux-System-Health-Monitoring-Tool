#!/bin/bash

# Load formatter (for colors & structured output)
source utils/formatter.sh

# Log file
LOG_FILE="logs/system.log"

# Ensure logs directory exists
mkdir -p logs

# Header
print_header " Linux Health Monitor"

echo -e "\n📅 Date: $(date)"
echo "🖥️ Hostname: $(hostname)"

echo -e "\n⏳ Uptime:"
uptime

echo ""

# =========================
# CLI Argument Handling
# =========================

case $1 in

  --cpu)
    bash modules/cpu.sh
    ;;

  --memory)
    bash modules/memory.sh
    ;;

  --disk)
    bash modules/disk.sh
    ;;

  --process)
    bash modules/processes.sh
    ;;

  --alerts)
    bash modules/alerts.sh
    ;;

  --all|"")
    bash modules/cpu.sh
    echo ""
    bash modules/memory.sh
    echo ""
    bash modules/disk.sh
    echo ""
    bash modules/processes.sh
    echo ""
    bash modules/alerts.sh
    ;;

  --help)
    echo "Usage: ./monitor.sh [OPTION]"
    echo "--cpu       Show CPU usage"
    echo "--memory    Show memory usage"
    echo "--disk      Show disk usage"
    echo "--process   Show processes"
    echo "--alerts    Show alerts"
    echo "--all       Run full monitor"
    echo "--help      Show this help message"
    exit 0
    ;;

  *)
    echo "❌ Invalid option"
    echo "Use --help to see available options"
    exit 1
    ;;

esac

# =========================
# Logging Section (FIXED)
# =========================

{
echo "=============================="
echo "Run at: $(date)"
echo "=============================="

uptime
free -h
df -h

echo ""

} >> "$LOG_FILE"
