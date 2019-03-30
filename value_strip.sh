#!/bin/bash
names='bmpAlt.txt bmpPre.txt bmpTemp.txt dhtHum.txt dhtTemp.txt lsmAccX.txt lsmAccY.txt lsmAccZ.txt lsmGyrX.txt lsmGyrY.txt lsmGyrZ.txt lsmMagX.txt lsmMagY.txt lsmMagZ.txt lsmTmp.txt'
echo About to start cleaning the files they will be available in the Cleaned_Files directory
echo If the Cleaned_Files Directory does not exist it will be created
for name in $names
do
    python3 parsing.py $name
done
echo The files have been cleaned
echo Starting the moving of files into directory
prefix="cleaned"
location="Cleaned_Files"
if [ ! -d "$location"]; then
	mkdir $location
fi
for name in $names
do 
	filename="$prefix$name"
	mv $filename $location
done
echo All Done
