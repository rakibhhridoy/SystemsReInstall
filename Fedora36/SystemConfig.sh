#!/bin/bash

cp ./.bashrc $HOME/
cp ./.zshrc $HOME/


cd 
mkdir Apps
cd Apps


# ======== Fedora Core ===========
# [1] Terminal & Utilities^

sudo dnf -y update
sudo dnf install -y yakuake bat curl wget gzip htop tree wireshark \
         neofetch tar tcpdump


# [2] media utils^

sudo dnf install -y ktorrent okular



# [3] rpm fusion repo enable ![resolve host issue]

lrpmfusion1="https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
lrpmfusion2="https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

sudo dnf install -y $lrpmfusion1 $lrpmfusion2
sudo dnf -y group update core



# [4] git setup^

echo "---------:: Github setup ::---------:"
echo "username:"
read username
echo "email:"
read email

sudo dnf install -y git 
git config --global user.name $userName
git config --global user.email $userEmail




# [5] Browsers

# [brave-browser]
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install -y brave-browser




# [6] Social Platform

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





# [7] Virtualization And Container

# [Docker]
sudo dnf remove -y docker docker-client docker-client-latest docker-common \
                docker-latest docker-latest-logrotate docker-logrotate \
                docker-selinux docker-engine-selinux docker-engine

sudo dnf install -y dnf-plugins-core
sudo dnf config-manager \
    --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin   


# [Virtualbox]
sudo dnf install -y @development-tools && sudo dnf -y install kernel-headers \
                    kernel-devel dkms elfutils-libelf-devel qt5-qtx11extras

wget download.virtualbox.org/virtualbox/6.1.38/VirtualBox-6.1-6.1.38_153438_fedora36-1.x86_64.rpm
sudo dnf makecache --refresh
sudo dnf install -y sudo dnfL

sudo rpm -i VirtualBox-6.1-6.1.38_153438_fedora36-1.x86_64.rpm.1
sudo usermod -a -G vboxusers $USER && newgrp vboxusers


sudo dnf install -y qemu


# [8] CodeSpaces and IDE

# [vim]
sudo dnf update -y
sudo dnf install -y vim

# [code]

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install -y code


# [jetbrains] 



# [9] languages setup^

# [Rust]
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh           

# [Golang]
sudo dnf install -y golang
mkdir -p $HOME/go
echo 'export GOPATH=$HOME/go' >> $HOME/.bashrc >> $HOME/.zshrc     
source $HOME/.bashrc && source $HOME/.zshrc


# [CLI helper]
# [tldr]

sudo dnf install -y tldr
tldr --version

# [bropages]
cargo install bropages
bro --version

# [zsh + ohmyzsh]
sudo dnf install -y zsh
sudo dnf install -y chsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)  

