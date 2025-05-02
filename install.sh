#!/bin/sh

sudo apt-get install -y fzf
curl -sS https://starship.rs/install.sh | sh -s -- -y

cd $HOME
ln -sf .config/coderv2/dotfiles/.bashrc .bashrc
ln -sf .config/coderv2/dotfiles/.bash_profile .bash_profile

cd $HOME/platform
pre-commit install
pre-commit install --hook-type commit-msg
