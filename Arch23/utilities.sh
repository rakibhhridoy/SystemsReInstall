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
    okular     |   yay

EOM


echo "$message"
read -p "[yes|no]" ans

if [ $ans == "yes" || $ans == "y" || $ans == "Y" ]; then

    sudo pacman -Syu
    sudo pacman -S --noconfirm -y yakuake bat curl wget gzip htop tree wireshark \
                                  neofetch tar tcpdump git tar ktorrent okular
else 

# [3] AUR 

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay --version
cd $HOME
