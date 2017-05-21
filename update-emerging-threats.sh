#!/bin/bash
#Purpose 

#Doesn't run the script until IP reachability verified. Runs in a loop until IP below (Google DNS) reachable)
REACH=false
while [ $REACH = false ]
do
        REACH1="$(ping -c 1 8.8.4.4 > /dev/null && echo 'Ping Successful')"
        if [ "$REACH1" = "Ping Successful" ] ; then
                REACH=true
        else
                sleep 10 
       	fi
done

VAR99="$(ls -l /etc/emerging-threats.txt | awk '{print $6, $7, $8}')"
echo "[+] IP Blocklist file last updated: $VAR99"
echo "[+] Updating IP Blocklist. Please wait..."
(curl https://zeustracker.abuse.ch/blocklist.php?download=ipblocklist http://feeds.dshield.org/top10-2.txt http://www.spamhaus.org/drop/drop.lasso https://ransomwaretracker.abuse.ch/downloads/RW_IPBL.txt https://feodotracker.abuse.ch/blocklist/?download=ipblocklist https://labs.snort.org/feeds/ip-filter.blf https://reputation.alienvault.com/reputation.generic https://sslbl.abuse.ch/blacklist/sslipblacklist.csv https://sslbl.abuse.ch/blacklist/dyre_sslipblacklist.csv | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/*[0-9]\{1,2\}' > emerging-threats.txt) > /dev/null 2>&1
#VARIA outputs the first column of stdout of the wc command to the emerging-threats IP file
VARIA="$(sudo wc emerging-threats.txt | awk '{print $1}')"
sudo chmod 644 emerging-threats.txt
sudo mv emerging-threats.txt /etc/
echo "[+] Your current number of malicious IPs and/or prefixes blocked is $VARIA"
#wget http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country-CSV.zip && unzip GeoLite2-Country-CSV.zip && rm GeoLite2-Country-CSV.zip
#cd GeoLite2-Country-CSV_* 
sudo pfctl -f /etc/pf.conf > /dev/null 2>&1
echo "[+] Done"
