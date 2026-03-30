#!/bin/bash

# -------------------------------------------------------
# Script 5: Open Source Manifesto Generator
# Author: Suyash Billaiya
# Reg No: 24MIM10165
# Course: Open Source Software
# Description: Asks the user three interactive questions,
#              then composes a personalised open source
#              philosophy statement and saves it to a .txt
#              file. Demonstrates: read, string building,
#              file writing with > and >>, date command.
# -------------------------------------------------------

# --- Aliases concept note ---
# In bash, 'alias' creates a short name for a longer command.
# For example: alias today='date +%d-%m-%Y'
# Running 'today' would then print the current date.
# Aliases are defined per shell session and are commonly
# placed in ~/.bashrc for persistent use.
# We use the 'date' command directly below rather than an
# alias, since aliases do not work inside non-interactive scripts.

echo "============================================"
echo "  Open Source Manifesto Generator"
echo "============================================"
echo ""
echo "Answer three questions to generate your personal"
echo "open source philosophy statement."
echo ""

# --- Interactive user input using 'read' ---
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# --- Get the current date using the date command ---
DATE=$(date '+%d %B %Y')

# --- Build the output filename using the current user's name ---
OUTPUT="manifesto_$(whoami).txt"

# --- Write the manifesto to the output file ---
# '>' creates/overwrites the file; '>>' appends subsequent lines

echo "Open Source Manifesto" > "$OUTPUT"
echo "Generated on: $DATE" >> "$OUTPUT"
echo "Author: $(whoami)" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Every day I rely on $TOOL — a tool that exists because" >> "$OUTPUT"
echo "someone chose to build it openly and share it with the world." >> "$OUTPUT"
echo "To me, freedom means $FREEDOM." >> "$OUTPUT"
echo "In the open source spirit, freedom is not just about cost —" >> "$OUTPUT"
echo "it is about the right to read, understand, change, and share" >> "$OUTPUT"
echo "the tools that shape our lives." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "One day I hope to build $BUILD and release it to the community." >> "$OUTPUT"
echo "I believe that knowledge shared is knowledge multiplied." >> "$OUTPUT"
echo "The programmers who built $TOOL did not ask for permission —" >> "$OUTPUT"
echo "they simply wrote the code and gave it away." >> "$OUTPUT"
echo "That is the tradition I want to carry forward." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Signed: $(whoami) | $DATE" >> "$OUTPUT"

# --- Confirm and display the generated manifesto ---
echo ""
echo "============================================"
echo "  Your manifesto has been saved to: $OUTPUT"
echo "============================================"
echo ""
cat "$OUTPUT"
