#!/bin/bash

# -------------------------------------------------------
# Script 3: Disk and Permission Auditor
# Author: Suyash Billaiya
# Reg No: 24MIM10165
# Course: Open Source Software
# Description: Loops through key system directories and
#              reports their permissions, owner, group,
#              and disk usage. Also checks the config
#              directory of the chosen open source software.
# -------------------------------------------------------

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "========================================"
echo "  Directory Audit Report"
echo "========================================"
echo ""

# --- for loop: iterate over each directory ---
for DIR in "${DIRS[@]}"; do

    if [ -d "$DIR" ]; then
        # ls -ld gives: permissions, links, owner, group, size, date, name
        # awk extracts: permissions (col 1), owner (col 3), group (col 4)
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')

        # du -sh gives human-readable disk size; 2>/dev/null suppresses permission errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        echo "Directory : $DIR"
        echo "  Permissions : $PERMS"
        echo "  Owner       : $OWNER"
        echo "  Group       : $GROUP"
        echo "  Disk Usage  : ${SIZE:-N/A}"
        echo ""
    else
        # Directory does not exist on this system
        echo "Directory : $DIR => does not exist on this system"
        echo ""
    fi

done

echo "========================================"
echo "  Chosen Software Config Directory Check"
echo "  (Software: Linux Kernel)"
echo "========================================"
echo ""

# --- Check key Linux kernel directories ---
# /boot holds the kernel image, initrd, and bootloader config
# /proc is a virtual filesystem exposing live kernel data
# /sys exposes kernel objects and device info

for KDIR in "/boot" "/proc" "/sys/kernel"; do
    if [ -d "$KDIR" ]; then
        KD_PERMS=$(ls -ld "$KDIR" | awk '{print $1}')
        KD_OWNER=$(ls -ld "$KDIR" | awk '{print $3}')
        KD_SIZE=$(du -sh "$KDIR" 2>/dev/null | cut -f1)
        echo "Kernel directory : $KDIR"
        echo "  Permissions    : $KD_PERMS"
        echo "  Owner          : $KD_OWNER"
        echo "  Disk Usage     : ${KD_SIZE:-N/A}"
        echo ""
    else
        echo "Directory $KDIR not found on this system."
        echo ""
    fi
done

echo "Security note: /boot is owned by root and readable by all."
echo "This matters because the kernel image lives here — write"
echo "access must be restricted to prevent unauthorised modification."

echo ""
echo "Audit complete."
