#!/bin/bash

# ---------------------------------------------
# Open Source Story Generator
# Author: Suyash Billaiya
# ---------------------------------------------

read -p "Enter your favorite open source software: " SOFTWARE
read -p "Enter a technology field: " FIELD
read -p "Enter your future goal: " GOAL

FILE="opensource_story.txt"

echo "Open Source Story" > $FILE
echo "" >> $FILE
echo "I often use $SOFTWARE in my work." >> $FILE
echo "It helps developers innovate in the field of $FIELD." >> $FILE
echo "In the future I hope to build $GOAL and contribute it to the open source community." >> $FILE

echo ""
echo "Story saved to $FILE"
cat $FILE
