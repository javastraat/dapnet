Pocsag Pi-Star Scripts

I made some scripts for Pi-Star image which work together with the dapnetapi

msg scripts send the message, dap scripts make the content

1st you need a pipe script !!
The pipe script is always the same, only needed once to create. dont forget to change yourcall in the dapnetapi line. usage f.e.: ./dap-lotto.sh | ./msg-pipe.sh

—————-
msg-pipe.sh
—————-
#!/bin/bash
TEXT=$(cat )
sudo pistar-dapnetapi yourcall “$TEXT”
————–

and then some content scripts…..

dap-bingo.sh – lets play hambingo also download the hambingo.txt file

————
echo “HamBingo :)” && shuf -n1 hambingo.txt && echo ” – ” && shuf -n1 hambingo.txt && echo ” – ” && shuf -n1 hambingo.txt && echo ” – ” && shuf -n1 hambingo.txt && echo ” – ” && shuf -n1 hambingo.txt
————
1 liner !!!

dap-exchange.sh – get usd/eur/usd exchange rates to your pager

—————
echo “EUR/USD/EUR” &&curl “https://www.xe.com/currencyconverter/convert/?Amount=1&From=EUR&To=USD” -A “Mozilla” -s | sed -n “s/.*>\(.*\) USD<.*/\1 USD/p” && curl “https://www.xe.com/currencyconverter/convert/?Amount=1&From=USD&To=EUR” -A “Mozilla” -s | sed -n “s/.*>\(.*\) EUR<.*/\1 EUR/p”
—————
1 liner !!!

dap-fortune.sh – first install fortune (apt install fortune-mod)

————–
fortune fortunes
—————-

dap-lotto.sh – send lotto numbers to pager (6/49 random numbers)

————
echo “Lotto 6/49 -”
for i in {1..6}; do shuf -i 1-49 -n1; done | xargs -n6
echo -e “- We hope you win :)”
————-
3 lines !!!

dap-weather.sh – get weather info from domoticz server
————–
curl -s ‘http://192.168.2.222/json.htm?type=devices&rid=34’ | grep Data | sed -e ‘s/ “Data” : “/WX EHAM /g’|sed -e ‘s/”,//g’|sed -e ‘s/,//g’ |sed -e ‘s/ C/C/g’ |sed -e ‘s/ %/%/g’ |sed -e ‘s/ hPa/hPa/g’ && curl -s ‘http://192.168.2.222/json.htm?type=devices&rid=2’ | grep Data | sed -e ‘s/ “Data” : “/Outside: /g’|sed -e ‘s/”,//g’ |sed -e ‘s/ C/C/g’ && curl -s ‘http://192.168.2.222/json.htm?type=devices&rid=25’ | grep Data | sed -e ‘s/ “Data” : “/Inside1: /g’|sed -e ‘s/”,//g’ |sed -e ‘s/ C/C/g’ && curl -s ‘http://192.168.2.222/json.htm?type=devices&rid=1’ | grep Data | sed -e ‘s/ “Data” : “/Inside2: /g’|sed -e ‘s/, 0 %”,//g’ |sed -e ‘s/ C/C/g’
————–

msg-ip.sh – message pi-star ip to pager
tip and trick : if you add msg-ip.sh to rc.local just before exit0 f.e. /home/pi-star/msg-ip.sh pi-star will send you the ip of pi-star to your dapnet pager 🙂
———
ifconfig wlan0 | grep inet | sed -e “s/ //g” | sed -e “s/inet/wlan0 ip/g”| /home/pi-star/msg-pipe.sh
———-

msg-creep.sh – creepy messages on your pager (i see you, we know you etc) also download the creep.txt file
————
shuf -n 1 creep.txt | ./msg-pipe.sh
————

extra commands and scripts:

restart dapnergateway :
sudo service dapnetgateway restart

tail dapnetgateway logfile:
tail -f /var/log/pi-star/D*

tail mmdvmhost logfile:
tail -f /var/log/pi-star/M*

Pipe scripts :

msg-pipe.sh
normal for you only, usage f.e.: ./dap-lotto.sh | ./msg-pipe.sh
———–
#!/bin/bash
TEXT=$(cat)
sudo pistar-dapnetapi yourcallsign “$TEXT”
———-

msg-call.sh
send output to a friend, usage f.e.: ./dap-lotto,sh | ./msg-pipe.sh callsigntosendto
———–
#!/bin/bash
TEXT=$(cat )
name=$1
sudo pistar-dapnetapi $1 “$TEXT”
————

Here you can download all scripts and txt files in one zip file

73, Happy paging :) 

