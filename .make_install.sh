#!/bin/bash

# CHECK PARAMS

# GET ARCH 
ARCH="archlinux"

# GET PACKAGE TO INSTALLM 
PACKAGE=$1
echo "Configuring $PACKAGE"

# CONF VARS
INSTALL_SCRIPT=$PACKAGE/pre-$ARCH.sh

# CHECK PACKAGE FILES

## INSTALL ARCH FILE
if [ -x $INSTALL_SCRIPT ]
then
	echo "installing dependecies..."
	INSTALL_EXIST=true
	./$INSTALL_SCRIPT &> /dev/null
	if [ $? -ne 0 ]
	then
		echo "Error on $INSTALL_SCRIPT"
	fi
fi

## PRESTOW
[[  $INSTALL_EXIST == true ]] && mv $INSTALL_SCRIPT /tmp/prestow.$PACKAGE

## STOW 
stow $PACKAGE

## POSTSTOW
[[ $INSTALL_EXIST == true ]] && mv /tmp/prestow.$PACKAGE $INSTALL_SCRIPT

echo "done"
