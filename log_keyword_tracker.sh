#!/bin/bash

# ---------------------------------------------
# Log Keyword Tracker
# Author: Suyash Billaiya
# ---------------------------------------------

LOGFILE=$1
KEYWORD=$2

if [ -z "$LOGFILE" ] || [ -z "$KEYWORD" ]; then
    echo "Usage: ./log_keyword_tracker.sh <logfile> <keyword>"
    exit 1
fi

MATCHES=$(grep -i "$KEYWORD" "$LOGFILE" | wc -l)

echo "Keyword '$KEYWORD' found $MATCHES times."

echo ""
echo "Recent occurrences:"
grep -i "$KEYWORD" "$LOGFILE" | tail -5
