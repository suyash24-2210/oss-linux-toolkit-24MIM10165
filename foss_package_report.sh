#!/bin/bash

# ---------------------------------------------
# Script: FOSS Package Report
# Author: Suyash Billaiya
# ---------------------------------------------

PACKAGES=("python3" "git" "bash")

echo "Installed Open Source Packages"
echo "-------------------------------"

for PKG in "${PACKAGES[@]}"
do
    if dpkg -l | grep -qw $PKG; then
        VERSION=$(dpkg -s $PKG | grep Version | awk '{print $2}')
        echo "$PKG -> Installed (Version $VERSION)"
    else
        echo "$PKG -> Not Installed"
    fi
done

echo ""
echo "Report finished."