#!/usr/bin/env bash
#set -x
set -e

# Assumptions - Arch Linux with a well defined $PATH.

if [ "$1" == "--help" ]; then
    echo "./install"
    exit 1
fi

echo "############################################"
echo "++ Installing base and cloning submodules ++"
echo "############################################"
sudo pacman -Syuq --noconfirm
sudo pacman -Sq --noconfirm --needed \
    alacritty \
    base-devel \
    bat \
    fd \
    firefox \
    git \
    git-lfs \
    go \
    gnome-shell-extension-appindicator \
    gnome-shell-extension-bing-wallpaper \
    meld \
    neovim \
    nodejs \
    pyenv \
    python-pynvim \
    ripgrep \
    ruby \
    tmux \
    tree \
    xplr
sudo pacman -Sqcc --noconfirm
# If `paru` is not installed, install from AUR:
# `git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si`.
paru -Syuq --noconfirm
paru -Sq --noconfirm --needed \
    vale-bin
paru -Sqcc --noconfirm
git submodule update --init

echo "############################################"
echo "++ Configuring environment ++"
echo "############################################"
declare -a resources=(
    "config/alacritty"
    "config/nvim"
    "config/tmux"
    "config/vale"
    "config/zsh"
    "gitconfig"
    "p10k.zsh"
    "zshrc"
)
for i in "${resources[@]}"
do
    # This is a destructive operation.
    ln -fv -ns "$PWD/$i" "$HOME/.$i"
done

echo "############################################"
echo "++ Installing nvim plugins with vim-plug ++"
echo "############################################"
echo "nvim +PlugInstall +qall"
nvim +PlugInstall +qall

echo "############################################"
echo "++ Installing nvim Coc extensions ++"
echo "############################################"
echo "nvim '+CocInstall -sync ...' +qall"
nvim '+CocInstall -sync coc-rust-analyzer coc-sh coc-pyright coc-clangd coc-cmake coc-docker coc-toml coc-xml coc-yaml coc-json coc-markdownlint' +qall

echo "############################################"
echo "++ Installing nvim Tree-sitter parsers ++"
echo "############################################"
echo "nvim '+TSInstallSync! ...' +qall"
nvim '+TSInstallSync! bash c cpp markdown python rust' +qall

echo "############################################"
echo "++ Installing fonts ++"
echo "############################################"
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Medium/complete/JetBrains%20Mono%20Medium%20Nerd%20Font%20Complete.ttf -P "$HOME/.local/share/fonts/JetBrains && fc-cache -vf"

echo "############################################"
echo "++ Done... run exec /bin/zsh ++"
echo "############################################"
