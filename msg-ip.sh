ifconfig wlan0 | grep inet |  sed -e "s/          //g" | sed -e "s/inet/wlan0 ip/g"| /home/pi-star/dapnet/msg-pipe.sh 
