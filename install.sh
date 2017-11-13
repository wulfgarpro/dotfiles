#!/bin/zsh

echo "Installing system dependencies..."
sudo apt install git vim vim-gtk3 fontconfig zsh

echo "Installing Powerline patched fonts..."
cd .fonts && ./install.sh

echo "Installing onehalfdark theme for gnome-terminal..."
source .onehalf-gnome-terminal-setup/onehalfdark.sh

echo "Installing vim plugins with Vundle..."
vim +PluginInstall +qall
