#!/bin/bash


echo "===============:: Github setup ::================:"
read -p "Username::  " userName
read -p "Email::  " userEmail

git config --global user.name $userName
git config --global user.email $userEmail

