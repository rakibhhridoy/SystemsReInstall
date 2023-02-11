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

sh virtualization.sh

# [8] CodeSpaces and IDE
sh code_editors.sh



# [9] Man page alternatives

sh man_alternatives.sh
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



