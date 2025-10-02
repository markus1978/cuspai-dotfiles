#!/bin/sh

sudo apt-get install -y fzf nodejs npm ruby-rubygems
sudo apt-get install -y libopengl0 libxkbcommon0 libxkbcommon-x11-0 libxcb-icccm4 \
    libxcb-image0 libxcb-keysyms1 libxcb-render-util0

sudo gem install foreman

sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo npm install -g @google/gemini-cli

curl -sS https://starship.rs/install.sh | sh -s -- -y

cd $HOME
ln -sf .config/coderv2/dotfiles/.bashrc .bashrc
ln -sf .config/coderv2/dotfiles/.bash_profile .bash_profile

git config --global alias.co "commit -a --no-verify"
git config --global alias.co-amend "commit -a --amend --no-edit --no-verify"
