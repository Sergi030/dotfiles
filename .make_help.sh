#!/bin/bash

MAKENAME=$1

for folder in $(find . -maxdepth 1 -type d);
do
	pkg=$(echo $folder | cut -d '/' -f2)
	# Not a dotfile
	if [ ${pkg:0:1} != "." ] 
	then
		if [ $pkg != "TEMPLATE" ];then
			echo "make ${MAKENAME}=${pkg} install"
		fi
	fi
done
