#!/bin/bash

echo "enter file name:"
echo *
read file
rm -rf "${file}".csv
rm -rf "${file}".kismet.csv
rm -rf "${file}".kismet.netxml
echo "do you want to remove ${file}.cap ? (y/n)"
read ans
if [ ${ans} = "y" ]; then
rm -rf "${file}".cap
echo "Done ^^"
else 
	echo "Done ^^"
fi