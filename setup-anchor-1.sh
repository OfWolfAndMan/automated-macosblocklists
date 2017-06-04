#!/bin/bash
#Sets up anchors automatically for you.
#Run this before running the script to update blocklists

sudo echo "anchor "emerging-threats"
load anchor "emerging-threats" from "/etc/pf.anchors/emerging-threats"" >> /etc/pf.conf

sudo echo "table <emerging-threats> persist file "/etc/emerging-threats.txt"
block log from <emerging-threats> to any" >> /etc/pf.anchors/emerging-threats
