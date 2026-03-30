#!/bin/bash

# -------------------------------------------------------
# Script 2: FOSS Package Inspector
# Author: Suyash Billaiya
# Reg No: 24MIM10165
# Course: Open Source Software
# Description: Checks if a chosen open source package is
#              installed, shows its version, and uses a
#              case statement to print a philosophy note
#              about each recognised package.
# -------------------------------------------------------

# --- Define the package to inspect ---
# linux-image-$(uname -r) is the running kernel's package name
PACKAGE="linux-image-$(uname -r)"    # The currently running Linux kernel package

echo "FOSS Package Inspector"
echo "----------------------"

# --- Check if the package is installed using dpkg ---
# dpkg -s gives the package status; grep for 'install ok'
STATUS=$(dpkg -s "$PACKAGE" 2>/dev/null | grep "Status" | awk '{print $4}')

if [ "$STATUS" = "installed" ]; then
    # Package found — extract version and license info
    VERSION=$(dpkg -s "$PACKAGE" 2>/dev/null | grep "^Version" | awk '{print $2}')
    echo "$PACKAGE is INSTALLED (Version: $VERSION)"
    echo ""

    # Show summary info from the package
    echo "Package details:"
    dpkg -s "$PACKAGE" 2>/dev/null | grep -E "^(Package|Version|Maintainer|Homepage)"

else
    # Package not found on this system
    echo "$PACKAGE is NOT INSTALLED on this system."
    echo "To install: sudo apt install $PACKAGE"
fi

echo ""
echo "--- Open Source Philosophy Note ---"

# --- case statement: print a one-line philosophy note ---
# Each case matches a well-known open source package name
case $PACKAGE in
    linux-image-*)
        echo "Linux Kernel: the foundation everything else runs on."
        echo "Born in 1991 when Linus Torvalds, a Finnish student,"
        echo "wanted a free Unix-like OS he could actually modify."
        echo "Today it powers supercomputers, smartphones, and the cloud."
        ;;
    git)
        echo "Git: the version control tool Linus built when a proprietary"
        echo "system failed him. Today every developer on Earth depends on it."
        ;;
    httpd | apache2)
        echo "Apache HTTP Server: the web server that literally built the open internet."
        echo "Powers around 30% of all active websites globally."
        ;;
    mysql | mysql-server)
        echo "MySQL: open source at the heart of millions of apps — a dual-license story"
        echo "showing how community and commerce can coexist, with tension."
        ;;
    python3)
        echo "Python: a language shaped entirely by community — now the world's"
        echo "most taught language, used in science, AI, and web development."
        ;;
    firefox)
        echo "Firefox: a nonprofit browser fighting for an open web in a world where"
        echo "two corporations control the browser engine landscape."
        ;;
    bash)
        echo "Bash: the GNU shell that greets every Linux user — free software you"
        echo "can inspect, modify, and redistribute."
        ;;
    *)
        echo "$PACKAGE: an open source package — its source code is open for anyone"
        echo "to read, modify, and redistribute under its stated license."
        ;;
esac

echo ""
echo "Inspection complete."
