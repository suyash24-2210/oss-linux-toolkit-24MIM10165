#!/bin/bash

# ---------------------------------------------
# Directory Security Scanner
# Author: Suyash Billaiya
# ---------------------------------------------

DIR_LIST=("/home" "/tmp" "/etc" "/usr")

echo "Directory Permission Scanner"
echo "-----------------------------"

for DIR in "${DIR_LIST[@]}"
do
    if [ -d "$DIR" ]; then
        INFO=$(ls -ld $DIR)
        echo "$INFO"
    else
        echo "$DIR not found"
    fi
done

echo ""
echo "Scan finished."
