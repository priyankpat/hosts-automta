#!/bin/bash

#
# root has to run the script
#
if [[ $(id -u -n) != "root" ]]
    then
    printf "You need to be root to do this!\nIf you have SUDO installed, then run this script with `sudo ${0}`"
    exit 1
fi

# First Backup Existing hosts file
sudo mv /etc/hosts /etc/hosts.bak

# Now download the new hosts file and put it into place
sudo wget https://gist.githubusercontent.com/priyankpat/68a6f96ed1e3fbe974fe1f573248b1ff/raw/5db9ed7a2bc80220d882c3e73f2a8714498c5b02/gistfile1.txt -O /etc/hosts

exit 0