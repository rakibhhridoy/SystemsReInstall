#!/bin/bash

read -r -d '' message << EOM
===================:: IDE's and Code Editor :: =====================
Following packages will be installed:
        
        tldr                     [1]
        bropages                 [2]

            -- all               [3]
            -- none              [4]
            
EOM



while :
do
    echo "$message"
    echo
    read -p "Which package want to install? 1|2|3|4|5:   " ans

    case $ans in
        1 ) sudo pacman -S --noconfirm tldr; exit;;
        2 ) cargo install bropages; exit;;
        3 ) sudo pacman -S --noconfirm tldr; 
            cargo install bropages; exit;;
        
        4 ) exit ;;
        *) echo "Enter 1|2|3|4|5 correctly!" ;;
    esac
done



