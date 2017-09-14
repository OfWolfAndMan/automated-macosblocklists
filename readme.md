# Mac OS PF Blocklists and Hosts File update script

Run these scripts if you desire an inbound/outbound IP blocklist for your Mac.
In addition, hosts file will be updated as well.

NOTE: Run these scripts at your own risk. I am not responsible if you break a Mac following any of these steps.
I run this personally, so as long as there's no wonky setup on your mac, you should be ok.

###### Order of Operations:
- Run the "setup-anchor" file first before proceeding to the "update-emerging-threats" file
- Make the scripts executable by running "chmod +x scriptname.sh"
- Optionally, run the "cron-job.sh" script if you desire to run the script at 4 hour intervals

###### Functionality:
- Emerging threats Blocklists
- Hosts file blocklists
- IP blocklists do not proceed to run until internet connectivity is established.
Interval is 10 seconds by default

###### Future Addons:
- Additional Malicious Blocklists
- GeoIP Blocklists
- Run at startup


