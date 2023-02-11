#!/bin/bash

read -r -d '' message << EOM
===================:: Oh my zsh :: =====================
Do you wish to install [zsh and oh my zsh]?

EOM


while :
do
    echo "$message"
    echo
    read -p  "Enter [yn]:  " ans


    case $ans in
        [yY]* ) cd $HOME ;
                sudo pacman -S --noconfirm zsh ;
                sudo pacman -S --noconfirm chsh ;
                source .zshrc ;

                sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" ;
                chsh -s $(which zsh)  ;
                source .zshrc; exit;;
                    
        [nN]* ) exit ;;
        *) echo "Enter y|n correctly!" ;;
    esac
done

