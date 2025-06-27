#!/bin/sh

sudo apt-get install -y fzf nodejs npm
sudo apt-get install -y libopengl0 libxkbcommon0 libxkbcommon-x11-0 libxcb-icccm4 \
    libxcb-image0 libxcb-keysyms1 libxcb-render-util0

sudo npm cache clean -f
sudo npm install -g n
sudo n stable

curl -sS https://starship.rs/install.sh | sh -s -- -y

curl https://pyenv.run | bash

cd $HOME
ln -sf .config/coderv2/dotfiles/.bashrc .bashrc
ln -sf .config/coderv2/dotfiles/.bash_profile .bash_profile

cd $HOME/platform
pre-commit install
pre-commit install --hook-type commit-msg
