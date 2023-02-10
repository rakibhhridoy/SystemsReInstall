#!/bin/bash

read -r -d '' message << EOM
===================:: Oh my zsh :: =====================
Do you wish to install [zsh or/and oh my zsh]?

EOM


echo "$message"
read -p  "Enter [yn]:  " ans

if [[ $ans == "y" || $ans == "Y" ]]; then
    cd $HOME
    sudo pacman -S --noconfirm zsh
    sudo pacman -S --noconfirm chsh
    source .zshrc

    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    chsh -s $(which zsh)  
    source .zshrc


elif [[ $ans == "n" || $ans == "N" ]]; then
    echo "exiting!"

else 
    echo "Wrong answer! Enter either y or n"
fi    
