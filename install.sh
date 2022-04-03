#!/usr/bin/env bash
#set -x

# Assumptions - Archlinux with a well defined $PATH.

if [ "$1" == "--help" ]; then
    echo "./install [--noback]"
    exit 1
fi

echo "############################################"
echo "++ Installing base and cloning submodules ++"
echo "############################################"
sudo pacman -Syuq --noconfirm
sudo pacman -Sq --noconfirm --needed \
    alacritty                       \
    base-devel                      \
    bat                             \
    firefox                         \
    git                             \
    meld                            \
    neovim                          \
    tmux
sudo pacman -Sqcc --noconfirm
git submodule update --init

echo "############################################"
echo "++ Configuring environment ++"
echo "############################################"
declare -a resources=(
    "config/alacritty"
    "config/nvim"
    "config/tmux"
    "config/zsh"
    "gitconfig"
    "zshrc"
)
for i in "${resources[@]}"
do
    # This is a destructive operation.
    ln -fv -ns "$PWD/$i" "$HOME/.$i"
done

echo "############################################"
echo "++ Installing vim plugins with Vundle ++"
echo "############################################"
echo "vim +PluginInstall +qall"
vim +PluginInstall +qall
# TODO(wulfgarpro): Install CoC extensions.

echo "############################################"
echo "++ Installing themes ++"
echo "############################################"
# TODO(wulfgarpro): Install themes (Dracula).

echo "############################################"
echo "++ Done... run /bin/zsh ++"
echo "############################################"
