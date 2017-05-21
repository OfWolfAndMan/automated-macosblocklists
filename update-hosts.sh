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
#Update hosts list
echo "[+] Updating hosts file..."
VAR100="$(ls -l /etc/hosts | awk '{print $6, $7, $8}')"
echo "[+] Hosts file last updated: $VAR100"
(curl https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews/hosts > hosts.txt) > /dev/null 2>$
VARIA2="$(sudo wc hosts.txt | awk '{print $1}')"
echo "[+] Current number of hostnames to be null routed: $VARIA2"
sudo mv hosts.txt /etc/hosts
echo "[+] Done"

