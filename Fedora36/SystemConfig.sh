pass="Password"
alias s="echo $pass | sudo -S"


cd 
mkdir Apps
cd Apps


# ======== Fedora Core ===========
# [1] Terminal & Utilities

s dnf -y update
s dnf -y yakuake bat curl wget gzip htop tree wireshark \
         neofetch 


# [2] 

s dnf -y install ktorrent




# git setup
userName="username"
userEmail="email"

s dnf -y git 
git config --global user.name=$userName
git config --global user.email=$userEmail


# brave-browser
s dnf install dnf-plugins-core
s dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
s rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
s dnf install brave-browser -y  




# discord setup 
wget discord.com/api/download?platform=linux&format=tar.gz 
tar -xzf discord-0.0.20.tar.gz


# docker setup
s dnf remove -y docker docker-client docker-client-latest docker-common \
                docker-latest docker-latest-logrotate docker-logrotate \
                docker-selinux docker-engine-selinux docker-engine

s dnf -y install dnf-plugins-core
s dnf config-manager \
    --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

s dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin   

# languages setup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh           #rust

s dnf install golang -y
mkdir -p $HOME/go
echo 'export GOPATH=$HOME/go' >> $HOME/.bashrc >> $HOME/.zshrc           #golang^
source $HOME/.bashrc && source $HOME/.zshrc



# virtualbox
s dnf -y install @development-tools && sudo dnf -y install kernel-headers \
                    kernel-devel dkms elfutils-libelf-devel qt5-qtx11extras

wget download.virtualbox.org/virtualbox/6.1.38/VirtualBox-6.1-6.1.38_153438_fedora36-1.x86_64.rpm
s dnf makecache --refresh
s dnf -y install SDL

s rpm -i VirtualBox-6.1-6.1.38_153438_fedora36-1.x86_64.rpm.1
s usermod -a -G vboxusers $USER && newgrp vboxusers

# jetbrains 





# bropages
cargo install bropages






unalias s