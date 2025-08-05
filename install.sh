#!/bin/sh

sudo apt-get install -y fzf nodejs npm
sudo apt-get install -y libopengl0 libxkbcommon0 libxkbcommon-x11-0 libxcb-icccm4 \
    libxcb-image0 libxcb-keysyms1 libxcb-render-util0

sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo npm install -g @google/gemini-cli

curl -sS https://starship.rs/install.sh | sh -s -- -y

curl https://pyenv.run | bash

pip3 install uv
uv tool install keyring --with keyrings.google-artifactregistry-auth

cd $HOME
ln -sf .config/coderv2/dotfiles/.bashrc .bashrc
ln -sf .config/coderv2/dotfiles/.bash_profile .bash_profile

cd $HOME/platform
pre-commit install
pre-commit install --hook-type commit-msg

git config --global alias.co "commit -a --no-verify"
git config --global alias.co-amend "commit -a --amend --no-edit --no-verify"
