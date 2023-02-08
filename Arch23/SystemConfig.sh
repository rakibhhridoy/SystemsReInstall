#!/bin/bash

cp rcfiles/.bashrc $HOME/
cp rcfiles/.zshrc $HOME/


cd $HOME
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






# [Discord] 
s pacman -S --noconfirm discord


# [telegram 4.5.3]

s pacman -S --noconfirm telegram-desktop




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

s_alias="alias su=sudo"
echo s_alias >> .zshrc
