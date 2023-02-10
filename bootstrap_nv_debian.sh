#!/bin/bash

######################################
###### Script for wsl - ubuntu #######
######        By Pelle         #######
######################################

# Install my favorite tools

(
echo "** START BOOTSTRAP SCRIPT"
# Display shell commands
set -x
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove

# utilisataries
sudo apt install curl wget git bat zip jq ncdu htop nmap build-essential zsh \
libffi-dev libncurses5-dev zlib1g zlib1g-dev libssl-dev \
libreadline-dev libbz2-dev libsqlite3-dev
# L.2-3 libs to install python with asdf

# symlink for bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# omzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# omzsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
# execute asdf temporarily
. $HOME/.asdf/asdf.sh

# asdf - install terraform
asdf plugin-add terraform https://github.com/asdf-community/asdf-hashicorp.git
asdf install terraform latest
asdf global terraform latest

# asdf - install packer
asdf plugin-add packer https://github.com/asdf-community/asdf-hashicorp.git
asdf install packer latest
asdf global packer latest

# asdf - install python
asdf plugin-add python
asdf install python latest
asdf global python latest

# upgrade pip
pip3 install --upgrade pip

# install awscli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# install aws ssm
curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
sudo dpkg -i session-manager-plugin.deb

# python utilitaries
pip install sshuttle
pip install tldr

echo "** Configuration finished !"
echo "To complete install, please restart a shell and execute 'p10k configure' if it doesn't start itself"
) 2>&1 | tee $HOME/bootstrap.log
# redirect stdout and stderr to logfile