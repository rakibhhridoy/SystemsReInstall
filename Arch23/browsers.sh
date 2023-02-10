#!/bin/bash

read -r -d '' message << EOM
===================:: Browser :: =====================
Which browser wish to install? 

        Firefox [1]
        Brave   [2]
        Both    [3]
EOM

echo "$message"
read -p  "Enter 1\2\3: " ans
echo $ans

if [[ $ans == "1" ]]; then
    sudo pacman -S --noconfirm firefox

elif [[ $ans == "2" ]]; then    
    yay -S --noconfirm brave-bin
    yay -S --noconfirm brave-beta-bin
    yay -S --noconfirm brave-nightly-bin

elif [[ $ans == "3" ]]; then
    sudo pacman -S --noconfirm firefox
    yay -S --noconfirm brave-bin
    yay -S --noconfirm brave-beta-bin
    yay -S --noconfirm brave-nightly-bin

else
    echo "Enter correctly please!"
fi




















