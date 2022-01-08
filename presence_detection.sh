#!/bin/sh

###############################################################

# Proximity detection
 
###############################################################

   
   
IPAddr="192.168.1.3"
   
port="8080"
   

macdevice1="00:00:00:00:00:00"    #Device 1
   
macdevice2="00:01:91:9f:00:49"    #Device 2


   
# OpenHAB switch items to be updated for each tracked MAC


   
item1="Device_1"
   
item2="Device_2"

  
device=""

   
# see http://wiki.openwrt.org/doc/devel/debugging to enable additional logging


logread -f | while read input

  
do

	if `echo $input | grep -q AP-STA-DISCONNECTED`
  
  		then
   
    		mac=`echo $input | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'`
  
    		if `echo $mac | grep -q $macdevice1`
   
      			then
   
        		curl -X POST --header "Content-Type: text/plain" --header "Accept: application/json" -d "OFF" "http://$IPAddr:$port/rest/items/$item1"
   
		elif `echo $mac | grep -q $macdevice2`

		then
			curl -X POST --header "Content-Type: text/plain" --header "Accept: application/json" -d "OFF" "http://$IPAddr:$port/rest/items/$item2"

   
    		fi
		
		
	elif `echo $input | grep -q deauthenticated`

  		then

    		mac=`echo $input | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'`

    		if `echo $mac | grep -q $macdevice1`

      			then

        		curl -X POST --header "Content-Type: text/plain" --header "Accept: application/json" -d "OFF" "http://$IPAddr:$port/rest/items/$item1"

		elif `echo $mac | grep -q $macdevice2`

		then
			curl -X POST --header "Content-Type: text/plain" --header "Accept: application/json" -d "OFF" "http://$IPAddr:$port/rest/items/$item2"


    		fi
		
   
	elif `echo $input | grep -q authenticated`
   
		then
  
    		mac=`echo $input | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'`
   
    		if `echo $mac | grep -q $macdevice1`
   
      			then
   
        		curl -X POST --header "Content-Type: text/plain" --header "Accept: application/json" -d "ON" "http://$IPAddr:$port/rest/items/$item1"
   
		elif `echo $mac | grep -q $macdevice2`
  
      			then
   
        		curl -X POST --header "Content-Type: text/plain" --header "Accept: application/json" -d "ON" "http://$IPAddr:$port/rest/items/$item2"
   
    		fi
  
  	fi
   
done
