pass="Password"
alias s="echo $pass | sudo -S"
alias sdi="s dnf -y install"

cd 
mkdir Apps
cd Apps


# ======== Fedora Core ===========
# [1] Terminal & Utilities^

s dnf -y update
sdi yakuake bat curl wget gzip htop tree wireshark \
         neofetch tar tcpdump


# [2] media utils^

sdi ktorrent okular

# [3] rpm fusion repo enable ![resolve host issue]

lrpmfusion1="https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
lrpmfusion2="https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

sdi $lrpmfusion1 $lrpmfusion2
s dnf -y group update core



# [4] git setup^
userName="username"
userEmail="email"

sdi git 
git config --global user.name $userName
git config --global user.email $userEmail



# [5] languages setup^

# [Rust]
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh           

# [Golang]
sdi golang
mkdir -p $HOME/go
echo 'export GOPATH=$HOME/go' >> $HOME/.bashrc >> $HOME/.zshrc     
source $HOME/.bashrc && source $HOME/.zshrc

# [zsh]
sdi zsh 


# ------ [Social] -------
# [1]brave-browser
sdi -y dnf-plugins-core
s dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
s rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sdi brave-browser




# [2]discord 
wget discord.com/api/download?platform=linux&format=tar.gz 
tar -xzf discord-0.0.20.tar.gz

#[3]zoom
wget https://zoom.us/client/5.12.2.4816/zoom_x86_64.rpm
s rpm -i zoom_x86_64.rpm


# docker setup
s dnf remove -y docker docker-client docker-client-latest docker-common \
                docker-latest docker-latest-logrotate docker-logrotate \
                docker-selinux docker-engine-selinux docker-engine

sdi dnf-plugins-core
s dnf config-manager \
    --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

s dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin   




# virtualbox
sdi @development-tools && sudo dnf -y install kernel-headers \
                    kernel-devel dkms elfutils-libelf-devel qt5-qtx11extras

wget download.virtualbox.org/virtualbox/6.1.38/VirtualBox-6.1-6.1.38_153438_fedora36-1.x86_64.rpm
s dnf makecache --refresh
sdi SDL

s rpm -i VirtualBox-6.1-6.1.38_153438_fedora36-1.x86_64.rpm.1
s usermod -a -G vboxusers $USER && newgrp vboxusers


s dnf install qemu -y

# jetbrains 





# bropages
cargo install bropages






unalias s
