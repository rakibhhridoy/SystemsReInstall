#!/bin/bash

read -r -d '' message << EOM
===================:: Container And Virtualization :: =====================
Following packages will be installed:
    
    Docker     |      Virtualbox
    Qemu
         
EOM

while :
do
    echo "$message"
    echo
    read -p "Do you want proceed? [y|n]   " ans

    case $ans in
        [yY]* ) sudo pacman -S docker;

                sudo pacman -Sy;
                sudo pacman -S virtualbox;

                sudo pacman -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils \
                               openbsd-netcat ebtables iptables libguestfs;
                exit;;
        [nN]* ) exit ;;
        *) echo "Enter y|n correctly!" ;;
    esac
done


