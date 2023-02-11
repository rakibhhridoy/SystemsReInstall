#!/bin/bash

read -r -d '' message << EOM
===================:: Social Packages :: =====================
Following packages will be installed:
    Telegram     |      Discord
         
EOM

while :
do
    echo "$message"
    read -p "Agree? [y|n]   " ans

    case $ans in
        [yY]* ) sudo pacman -S --noconfirm discord ;  
                sudo pacman -S --noconfirm telegram-desktop; exit ;;

        [nN]* ) exit ;;
        *) echo "Enter y|n correctly!" ;;
    esac
done
