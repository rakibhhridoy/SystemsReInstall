#!/bin/bash

cp rcfiles/.bashrc $HOME/
cp rcfiles/.zshrc $HOME/

dir=$(pwd)

cd $HOME


# ======== Fedora Core ===========
# [1] Terminal & Utilities^

sudo pacman -Syu
sudo pacman -S --noconfirm -y yakuake bat curl wget gzip htop tree wireshark \
         neofetch tar tcpdump git tar


# [2] media utils^

sudo pacman -S --noconfirm -y ktorrent okular

# [3] AUR 

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay --version
cd $HOME




# [4] Git setup^
cd SystemsReboot/Arch23
sh github-setup.sh
cd $HOME

# [5] Browsers
cd SystemsReboot/Arch23
sh browsers.sh
cd $HOME

# [Discord] 
sudo pacman -S --noconfirm discord


# [telegram 4.5.3]
sudo pacman -S --noconfirm telegram-desktop


# [7] Virtualization And Container

# [Docker]
sudo pacman -S docker


# [Virtualbox & Qemu]
sudo pacman -Sy
sudo pacman -S virtualbox

sudo pacman -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat ebtables iptables libguestfs


# [8] CodeSpaces and IDE
# [VS Code]

git clone https://AUR.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin
makepkg -si
cd $HOME


# [vim]
sudo pacman -S --noconfirm vim




# [CLI helper]
# [tldr]

sudo pacman -S --noconfirm tldr
tldr --version

# [bropages]
cargo install bropages
bro --version

source .bashrc


# [Programming Languages]

if [ pwd == $dir ]; then
    sh prog_languages.sh
else
    cd $dir
    sh prog_languages.sh

# [Oh_my_zsh]
cd $dir
sh oh_my_zsh_setup.sh



s_alias="alias s=sudo"
echo s_alias >> .zshrc



