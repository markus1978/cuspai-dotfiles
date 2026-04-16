#!/bin/sh

sudo apt-get update
sudo apt-get install -y fzf nodejs npm ruby-rubygems
sudo apt-get install -y libopengl0 libxkbcommon0 libxkbcommon-x11-0 libxcb-icccm4 \
    libxcb-image0 libxcb-keysyms1 libxcb-render-util0

sudo gem install foreman

sudo npm cache clean -f
sudo npm install -g n
sudo n stable

curl -sS https://starship.rs/install.sh | sudo sh -s -- -y

cd $HOME
ln -sf .config/coderv2/dotfiles/.bashrc .bashrc
ln -sf .config/coderv2/dotfiles/.bash_profile .bash_profile

git config --global alias.co "commit -a --no-verify"
git config --global alias.co-amend "commit -a --amend --no-edit --no-verify"

curl -Lk 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' --output ~/vscode_cli.tar.gz
tar -xf vscode_cli.tar.gz
rm -rf vscode_cli.tar.gz

cp ~/.config/coderv2/dotfiles/restart-code-server.sh ~/.local/bin/restart-code-server
chmod +x ~/.local/bin/restart-code-server