#!/bin/bash

#Disables IR kernel support
sudo defaults write /Library/Preferences/com.apple.driver.AppleIRController DeviceEnabled -bool FALSE
#Disable SMB
sudo launchctl disable system/com.apple.smbd
#Disable Apple Filesharing
sudo launchctl disable system/com.apple.AppleFileServer
#Disable NFS Daemon, Lock Daemon, Stat Daemon
sudo launchctl disable system/com.apple.nfsd
sudo launchctl disable system/com.apple.lockd
sudo launchctl disable system/com.apple.statd.notify
#Disables Bonjour mcast advertisements
sudo defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool YES
#Disables telnet
sudo launchctl disable system/com.apple.telnetd
#Disables Crash Reporter
defaults write com.apple.CrashReporter DialogType none
#Disables UUCP
sudo launchctl disable system/com.apple.uucp
#Disable permitting root login via SSH
sudo sed -i.bak 's/^[\#]*PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
#Enable SSH Version 2
sudo sed -i.bak 's/.*Protocol.*/Protocol 2/' /etc/ssh/sshd_cuntonfig
#Set SSH Client Alive Interval/Count Max
sudo sed -i.bak 's/#ClientAliveInterval.*/ClientAliveInterval 600/' /etc/ssh/sshd_config
sudo sed -i.bak 's/#ClientAliveCountMax.*/ClientAliveCountMax 0/' /etc/ssh/sshd_config
#Disable finger
sudo launchctl disable system/com.apple.fingerd
#Disable HTTP Daemon
sudo launchctl disable system/org.apache.httpd
#Disable ICMP redirects
sudo nano /etc/sysctl.conf
##Add the following lines
	#net.inet.ip.redirect=0
	#net.inet6.ip6.redirect=0



