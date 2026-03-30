#!/bin/bash

# -------------------------------------------------------
# Script 4: Log File Analyzer
# Author: Suyash Billaiya
# Reg No: 24MIM10165
# Course: Open Source Software
# Description: Reads a log file line by line using a
#              while-read loop, counts lines containing
#              a keyword, and prints a summary with the
#              last 5 matching lines. Accepts log file
#              path and keyword as command-line arguments.
# Usage: ./log_keyword_tracker.sh <logfile> <keyword>
# -------------------------------------------------------

# --- Read command-line arguments ---
LOGFILE=$1          # First argument: path to the log file
KEYWORD=${2:-"error"}  # Second argument: keyword to search (default: "error")

# --- Validate that both arguments are provided ---
if [ -z "$LOGFILE" ]; then
    echo "Usage: ./log_keyword_tracker.sh <logfile> <keyword>"
    echo "Example: ./log_keyword_tracker.sh /var/log/syslog error"
    exit 1
fi

# --- Check that the log file actually exists and is a regular file ---
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found or is not a regular file."
    exit 1
fi

# --- Check that the file is not empty ---
if [ ! -s "$LOGFILE" ]; then
    echo "Warning: File '$LOGFILE' is empty. No lines to analyze."
    exit 0
fi

echo "========================================"
echo "  Log File Analyzer"
echo "========================================"
echo "  Log file : $LOGFILE"
echo "  Keyword  : '$KEYWORD'"
echo "========================================"
echo ""

# --- Counter variable to track keyword matches ---
COUNT=0

# --- while-read loop: read the log file one line at a time ---
# IFS= preserves leading/trailing whitespace in each line
# -r prevents backslash interpretation
while IFS= read -r LINE; do

    # --- if-then: check if the current line contains the keyword (case-insensitive) ---
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment counter using arithmetic expansion
    fi

done < "$LOGFILE"   # Redirect file into the while loop as input

# --- Print the count summary ---
echo "Total occurrences of '$KEYWORD': $COUNT"
echo ""

# --- Print the last 5 lines that matched the keyword ---
if [ "$COUNT" -gt 0 ]; then
    echo "Most recent 5 matching lines:"
    echo "------------------------------"
    grep -i "$KEYWORD" "$LOGFILE" | tail -5
else
    echo "No lines containing '$KEYWORD' were found in $LOGFILE."
fi

echo ""
echo "Analysis complete."
