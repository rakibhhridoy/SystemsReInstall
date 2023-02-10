#!/bin/bash

cp rcfiles/.bashrc $HOME/
cp rcfiles/.zshrc $HOME/


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


# [jetbrains] 



# [9] languages setup^

# [Rust]
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh           

# [Golang]
sudo pacman -S --noconfirm golang
mkdir -p $HOME/go
echo 'export GOPATH=$HOME/go' >> $HOME/.bashrc >> $HOME/.zshrc     
source $HOME/.bashrc && source $HOME/.zshrc


# [CLI helper]
# [tldr]

sudo pacman -S --noconfirm tldr
tldr --version

# [bropages]
cargo install bropages
bro --version

source .bashrc




s_alias="alias s=sudo"
echo s_alias >> .zshrc



