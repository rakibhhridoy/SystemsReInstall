#!/bin/bash

read -r -d '' message << EOM
===================:: Browser :: =====================
Which language wish to install? 

        Rust                [1]
        Golang              [2]
        Python              [3]
        Rust + Golang       [4]
        Rust + Python       [5]
        Python + Golang     [6]
        All                 [7]
EOM

go_in=$(sudo pacman -S --noconfirm golang ; mkdir -p $HOME/go ; \
        echo 'export GOPATH=$HOME/go' >> $HOME/.bashrc >> $HOME/.zshrc ; \
        source $HOME/.bashrc && source $HOME/.zshrc )
rust_in=$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh)
python_in=$(sudo pacman -S --noconfirm python)

echo "$message"
read -p  "Enter 1|2|3|4|5|6|7: " ans

case $ans in
    1) $rust_in ;;
    2) $go_in ;;
    3) $python_in ;;
    4) $rust_in && $go_in ;;
    5) $rust_in && $python_in ;;
    6) $python_in && $go_in ;;
    7) $rust_in && $python_in && $go_in ;;
    *) echo "Wrong ans! Enter Correctly!" ;;
esac


    



