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


echo "$message"
read -p "Agree? [yes|no]" ans

while :
do
    if [ $ans == "yes" || $ans == "y" || $ans == "Y" ]; then

        sudo pacman -Syu
        sudo pacman -S --noconfirm -y yakuake bat curl wget gzip htop tree wireshark \
                                    neofetch tar tcpdump git tar ktorrent okular
        exit
    elif [ $ans == "no" || $ans == "n" || $ans == "N" ]; then
        exit

    else 
        echo "Wrong Answer! Enter Correctly"
    exit
    fi
done


# [3] AUR 

read -r -d '' message << EOM
===================:: YAY :: =====================
Want to enable AUR library and install yay? [yes/no]
EOM


read -p "$message: " ans

while :
do
    if [ $ans == "yes" || $ans == "y" || $ans == "Y" ]; then
        
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si
        yay --version
        cd $HOME

        exit
    elif [ $ans == "no" || $ans == "n" || $ans == "N" ]; then
        exit

    else 
        echo "Wrong Answer! Enter Correctly"
    exit
    fi

done

