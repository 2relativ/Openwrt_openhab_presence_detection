# Openwrt_openhab_presence_detection
A simple script to detect active Wifi devices and switch items in openhab using the openhab rest api<br/>
<br/>
The script was inspired by brianllong on this site: https://community.openhab.org/t/check-presence-based-on-openwrt-wifi-clients-on-line/3735/9<br/>

Place this script in /usr/bin on your openwrt router.<br/>
Make it executeable: chmod u+x<br/>
Change the mac address and the item names to your needs<br/>
On LUCI Webinterface under System-->Startup-->Local Startup add /usr/bin/presence_detection.sh & before the exit0<br/>
On Openhab create the same item<br/>
<br/>
Now should yout openwrt router switch on and off the item on your openhab.<br/>
This means you can build rules that use this item.<br/>

