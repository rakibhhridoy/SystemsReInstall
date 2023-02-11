#!/bin/bash

cp rcfiles/.bashrc $HOME/
cp rcfiles/.zshrc $HOME/

dir=$(pwd)

# [Utilities and Aur]
sh utilities.sh
sh aur_yay.sh


# [4] Git setup^
cd SystemsReboot/Arch23
sh github-setup.sh
cd $HOME

# [5] Browsers
cd SystemsReboot/Arch23
sh browsers.sh
cd $HOME

# [Social]
cd $dir
sh social.sh

# ------------- checked --------------
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



