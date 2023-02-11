#!/bin/bash


# ======== Utilities ===========

read -r -d '' message << EOM
===================:: Utilities :: =====================
Following packages will be installed:

    bat        |   curl 
    wget       |   gzip
    htop       |   wireshark
    tree       |   neofetch
    tar        |   tcpdump
    git        |   tar
    ktorrent   |   yakuake
    okular     

EOM




while :
do
    echo "$message"
    read -p "Agree? [y|n]  " ans

    case $ans in
        [yY]* ) sudo pacman -Syu; 
                sudo pacman -S --noconfirm -y \
                yakuake bat curl wget gzip htop tree wireshark \
                neofetch tar tcpdump git tar ktorrent okular; exit;;
        
        [nN]* ) exit ;;
        *) echo "Enter y|n correctly!" ;;
    esac
done



