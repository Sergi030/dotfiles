#!/bin/bash
if [ $# -ne 1 ]
then
    echo $0 "pkg folder to be added"
    exit 1
fi

PKG=$1
CONTROL_FILE=$1/CONTROL/control
[ -f $CONTROL_FILE ] || echo "Control file does not exists: $CONTROL_FILE" || exit 1 

NAME=$(cat $CONTROL_FILE | grep "Package: " | cut -d " " -f 2)
VERSION=$(cat $CONTROL_FILE | grep "Version: " | cut -d " " -f 2)
ARCH=$(cat $CONTROL_FILE | grep "Architecture: " | cut -d " " -f 2)
echo "PKG: $NAME"
echo "Version: $VERSION"
echo "ARCH: $ARCH"

# Check version file
VERSION_FILE="versions-$ARCH"
[ -f $VERSION_FILE ] || echo "Cannot get versions file: $VERSION_FILE" || exit 1

# Change actual version for X-Alpha
SUGG_VERSION=$(echo $VERSION | sed s/Beta/Alpha/g)
if [ "$(echo $SUGG_VERSION | cut -d '-' -f2 | cut -d ' ' -f 1)" != "Alpha" ]
then
    SUGG_VERSION="$SUGG_VERSION-Alpha"
fi

# Read new version
read -e -i "$SUGG_VERSION" -p "Actual version: $VERSION.  New version: " NEW_VERSION
echo $NEW_VERSION

# Ensure user input
read -p "We gonna update, Are you sure ? " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

if [ $ARCH == "all" ]
then
    sed -i s/"$PKG (=$VERSION)"/"$PKG (=$NEW_VERSION)"/g loadsensing-gw-wirma/CONTROL/kona 
    sed -i s/"$PKG (=$VERSION)"/"$PKG (=$NEW_VERSION)"/g loadsensing-gw-wirma/CONTROL/control
else
    sed -i s/"$PKG (=$VERSION)"/"$PKG (=$NEW_VERSION)"/g loadsensing-gw-$ARCH/CONTROL/control
fi

echo "$PKG $NEW_VERSION latest" >> $VERSION_FILE
