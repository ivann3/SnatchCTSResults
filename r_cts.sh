#!/bin/bash

desktop="/home/cts-001/Desktop/"
results="/home/cts-001/CTS5.1/android-cts-5.1_r4-linux_x86-arm/android-cts/repository/results/"
logs="/home/cts-001/CTS5.1/android-cts-5.1_r4-linux_x86-arm/android-cts/repository/logs/"
plans="/home/cts-001/CTS5.1/android-cts-5.1_r4-linux_x86-arm/android-cts/repository/plans/"

fileName=$(ls -t ${results} | head -1)
echo FileName is: ${fileName}

if [ "${fileName##*.}" = "zip" ];then
	fileName=${fileName%.*}
	echo FileName is: ${fileName}

	sourceCopy=${results}${fileName}/
	destinationCopy=${desktop}${fileName}
	
	echo FolderName:${fileName}
	cp -r ${sourceCopy} ${destinationCopy}

	sourceCopy=${logs}${fileName}/*.zip
	cp -r ${sourceCopy} ${destinationCopy}

	planName=$(ls -t ${plans} | head -1)
	cp -r ${plans}${planName} ${destinationCopy}
	
else
	echo Empty File
fi


