#!/bin/bash

read -r -d '' message << EOM
===================:: Github Setup :: =====================
Want to configure github setup global? [y|n]
         
EOM

while :
do
    echo "$message"
    read -p "Agree? [y|n]" ans

    case $ans in
        [yY]* ) read -p "Username::  " userName ;
                read -p "Email::  " userEmail ;

                git config --global user.name $userName ;
                git config --global user.email $userEmail; exit ;;

        [nN]* ) exit ;;
        *) echo "Enter y|n correctly!" ;;
    esac
done

