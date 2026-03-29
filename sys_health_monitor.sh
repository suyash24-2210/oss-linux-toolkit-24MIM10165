#!/bin/bash

# ---------------------------------------------
# Script: System Health Monitor
# Author: Suyash Billaiya
# Reg No: 24MIM10165
# ---------------------------------------------

echo "================================"
echo " Linux System Health Report"
echo "================================"

USER_NAME=$(whoami)
HOST=$(hostname)
DATE_NOW=$(date)

CPU_LOAD=$(uptime | awk -F'load average:' '{print $2}')
MEMORY=$(free -h | grep Mem | awk '{print $3 "/" $2}')
DISK=$(df -h / | tail -1 | awk '{print $3 "/" $2}')

echo "User Logged In : $USER_NAME"
echo "Host Machine   : $HOST"
echo "Current Date   : $DATE_NOW"
echo ""
echo "CPU Load       : $CPU_LOAD"
echo "Memory Usage   : $MEMORY"
echo "Disk Usage     : $DISK"

echo ""
echo "Health check completed."
