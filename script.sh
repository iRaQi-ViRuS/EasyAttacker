
#!/bin/bash
echo "======================= Script By ======================"
echo "=/=/=/=/=/=/=/=/=/=/= iRaQi_ViRuS =/=/=/=/=/=/=/=/=/=/="
echo "================= Networks Attacker Script ================="

echo "what interface you want to use ? (1-4)"
echo "wlan0mon (1)"
echo "wlan0    (2)"
echo "wlan1    (3)"
echo "wlan1mon (4)"
read interface

if [ "${interface}" = "1" ]; then
interface=wlan0mon
elif [ "${interface}" = "2" ]; then
interface=wlan0
elif [ "${interface}" = "3" ]; then
interface=wlan1
elif [ "${interface}" = "4" ]; then
interface=wlan1mon
fi

echo "Do you want to change mac address? (y/n)"
read ans

if [ "${ans}" = "y" ]; then

        ifconfig "${interface}" down
	macchanger -r "${interface}"
	ifconfig "${interface}" up

else
echo continuing...

fi
echo "Do you want to set "${interface}" to monitor mode? (y/n)"
read ans2

if [ "${ans2}" = "y" ]; then

        monstart "${interface}"

elif [ "$ans2" = "n" ]; then
echo continuing...
        
fi

echo "Do you want to scan for near by networks? (y/n)"
read ans3

if [ "${ans3}" = "y" ]; then

        airodump-ng "${interface}"

elif [ "$ans3" = "n" ]; then
echo "continuing..."
        
fi
echo "do you want to run airodump.sh script? (y/n)"
read ans4
if [ "${ans4}" = "y" ]; then

        ./airodump.sh

else
echo "Exiting... Good Bye ^^"

fi


