#!/usr/bin/env bash
#set -x

# Assume Ubuntu + Gnome-terminal as default system,
# WSL install does not include fonts or terminal theme.

if [ "$1" == "--help" ]; then
    echo "./install [--wsl]"
    exit 1
fi

echo "++ Installing git and cloning submodules"
sudo apt-get install git
git submodule update --init --recursive

echo "++ Installing system dependencies..."
deps="vim vim-gtk3 fontconfig zsh python3 python3-pip"
if [ "$1" == "--wsl" ]; then
    sudo apt-get install $deps
else
    sudo apt-get install $deps dconftools gconf2

    echo "++ Installing Powerline patched fonts..."
    cd .fonts && ./install.sh

    echo "++ Installing onehalfdark theme for gnome-terminal..."
    source .onehalf-gnome-terminal-setup/onehalfdark.sh
fi

python3 -m pip install pip --upgrade
python3 -m pip install --user virtualenvwrapper 

echo "++ Installing vim plugins with Vundle..."
vim +PluginInstall +qall

echo "++ Configuring environment..."
resources=".gvimrc .oh-my-zsh .vim .vimrc .zshrc"
if [ "$1" == "--wsl" ]; then
    cp -fr $resources $HOME
else
    cp -fr $resources fonts $HOME
fi
/bin/zsh
