#!/bin/bash

read -r -d '' message << EOM
===================:: IDE's and Code Editor :: =====================
Following packages will be installed:
        
        vim                  [1]
        nano                 [2]
        vs-code              [3]
        
        -- all               [4]
        -- none              [5]
         
EOM


vs_code="git clone https://AUR.archlinux.org/visual-studio-code-bin.git;
         cd visual-studio-code-bin;
         makepkg -si;
         cd $HOME"
while :
do
    echo "$message"
    echo
    read -p "Which package want to install? 1|2|3|4|5:   " ans

    case $ans in
        1 ) sudo pacman -S --noconfirm vim; exit;;
        2 ) sudo pacman -S --noconfirm nano; exit;;
        3 ) eval $vs_code; exit;;
        
        4 ) sudo pacman -S --noconfirm vim;
            sudo pacman -S --noconfirm nano;
            eval $vs_code; exit;;
        
        5 ) exit ;;
        *) echo "Enter 1|2|3|4|5 correctly!" ;;
    esac
done



