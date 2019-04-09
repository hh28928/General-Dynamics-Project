#!/bin/bash
names='bmpAlt_d2.txt bmpPre_d2.txt bmpTemp_d2.txt dhtHum_d2.txt dhtTemp_d2.txt lsmAccX_d2.txt lsmAccY_d2.txt lsmAccZ_d2.txt lsmGyrX_d2.txt lsmGyrY_d2.txt lsmGyrZ_d2.txt lsmMagX_d2.txt lsmMagY_d2.txt lsmMagZ_d2.txt lsmTmp_d2.txt'
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
if [[ ! -d "$location" ]]; then
	mkdir $location
fi
for name in $names
do 
	filename="$prefix$name"
	mv $filename $location
done
echo All Done
