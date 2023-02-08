#!/bin/bash

cp ./.bashrc $HOME/
cp ./.zshrc $HOME/


cd 
mkdir Apps
cd Apps


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
cd




# [4] git setup^

echo "---------:: Github setup ::---------:"
echo "username:"
read username
echo "email:"
read email
 
git config --global user.name $userName
git config --global user.email $userEmail




# [5] Browsers

# [brave-browser]
yay -S brave-bin
yay -S brave-beta-bin
yay -S brave-nightly-bin

# [firefox]
sudo pacman -S firefox --noconfirm

# [6] Social Platform
# Broken
: '
# [Discord] 
wget discord.com/api/download?platform=linux&format=tar.gz 
tar -xzf discord-0.0.20.tar.gz
dpath="$HOME/Discord/Discord"
echo "alias discord=$dpath" >> $HOME/.zshrc && echo "alias discord=$dpath" >> $HOME/.bashrc

# [telegram 4.5.3]
wget telegram.org/dl/desktop/linux
tar -xzf tsetup.4.5.3.tar.gz
tpath="$HOME/Telegram/Telegram"
echo "alias telegram=$tpath" >> $HOME/.zshrc && echo "alias telegram=$tpath" >> $HOME/.bashrc
'




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
cd


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
# [zsh + ohmyzsh]
sudo pacman -S --noconfirm zsh
sudo pacman -S --noconfirm chsh
source .zshrc

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)  
source .zshrc
