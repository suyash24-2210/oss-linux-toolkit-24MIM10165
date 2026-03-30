#!/bin/bash

# -------------------------------------------------------
# Script 1: System Identity Report
# Author: Suyash Billaiya
# Reg No: 24MIM10165
# Course: Open Source Software
# Description: Displays a welcome screen with key system
#              identity details including kernel version,
#              distro name, user info, uptime, and the
#              open source license covering the OS.
# -------------------------------------------------------

# --- Student and software details ---
STUDENT_NAME="Suyash Billaiya"
SOFTWARE_CHOICE="Linux Kernel"     # Chosen open source software

# --- Gather system info using command substitution $() ---
KERNEL=$(uname -r)                                              # Linux kernel version
DISTRO=$(lsb_release -d 2>/dev/null | awk -F'\t' '{print $2}') # Full distro description
ARCH=$(uname -m)                                               # CPU architecture
USER_NAME=$(whoami)                                            # Currently logged-in user
HOME_DIR=$HOME                                                 # Home directory of the user
UPTIME=$(uptime -p)                                            # Human-readable uptime
DATE_NOW=$(date '+%A, %d %B %Y  %H:%M:%S')                    # Current date and time

# The Linux kernel is released under GNU General Public License version 2
OS_LICENSE="GNU General Public License v2 (GPL v2)"

# --- Display formatted welcome screen ---
echo "========================================================"
echo "      Open Source Audit — $STUDENT_NAME"
echo "      Chosen Software : $SOFTWARE_CHOICE"
echo "========================================================"
echo ""
echo "  Linux Distro    : ${DISTRO:-Unknown (lsb_release not found)}"
echo "  Kernel Version  : $KERNEL"
echo "  Architecture    : $ARCH"
echo "  Logged-in User  : $USER_NAME"
echo "  Home Directory  : $HOME_DIR"
echo "  System Uptime   : $UPTIME"
echo "  Current Date    : $DATE_NOW"
echo ""
echo "  OS License      : $OS_LICENSE"
echo ""
echo "  About the license:"
echo "  The Linux kernel is free software. You may use, study,"
echo "  modify and redistribute it under the terms of the GPL v2."
echo "  Any modified version you distribute must also be released"
echo "  under GPL v2 — this is the copyleft principle."
echo ""
echo "========================================================"
echo "  System identity check complete."
echo "========================================================"




