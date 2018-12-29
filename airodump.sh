#!/bin/bash
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

echo "bssid:"
read bssid

echo "channel:"
read c

echo "file:"
read file

echo "do you want to log the scan results? (y/n)"
read ans
if [ "${ans}" = "y" ]; then

sudo airodump-ng --bssid ${bssid} -c ${c} -w "${file}"  ${interface}

elif [ "$ans" = "n" ]; then

sudo airodump-ng --bssid ${bssid} -c ${c} -a  "${interface}"
else
	sudo airodump-ng --bssid ${bssid} -c ${c} -w "${file}"  ${interface}
fi

echo "do you want to run remover.sh script? (y/n)"
read ans
if [ "${ans}" = "y" ]; then

        ./remover.sh

else
echo "Exiting... Good Bye ^^"

fi
