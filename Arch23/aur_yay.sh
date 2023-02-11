#!/bin/bash

#[3] AUR 

read -r -d '' message << EOM
===================:: YAY :: =====================
Want to enable AUR library and install yay? [y/n]
EOM



while true; do
    
    read -p "$message: " ans
    case $ans in
        [yY]* ) git clone https://aur.archlinux.org/yay.git ;
                cd yay ;
                makepkg -si ;
                yay --version ;
                cd $HOME ; break;;
        [nN]* ) exit ;;
        *) echo "Enter y|n correctly!"  ;;
    esac
done

    