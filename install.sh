#!/usr/bin/env bash
#set -x
set -e

# Assumptions - An initial Arch Linux install with internet access and a
# well-defined $PATH.

if [ "$1" == "--help" ]; then
    echo "./install"
    exit 1
fi

read -n 1 -s -r -p "Press any key to continue"

echo -e "\n"
echo "############################################"
echo "++ Installing base and cloning submodules ++"
echo "############################################"
sudo pacman -Syuq --noconfirm
sudo pacman -Sq --noconfirm --needed \
    alacritty \
    base-devel \
    fd \
    firefox \
    git \
    git-lfs \
    kitty \
    light \
    meld \
    neovim \
    pamixer \
    pipewire-pulse \
    polkit \
    pyenv \
    python-pillow \
    python-pynvim \
    ranger \
    ripgrep \
    sway \
    swaybg \
    swayidle \
    swaylock \
    tmux \
    tree \
    ttf-jetbrains-mono \
    ttf-ubuntu-font-family \
    unzip \
    waybar \
    wofi \
    xplr \
    xorg-xwayland
sudo pacman -Sqcc --noconfirm

# If `paru` is not installed, install from AUR:
# `git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si`
paru -Syuq --noconfirm
paru -Sq --noconfirm --needed \
    swaync \
    vale-bin
paru -Sqcc --noconfirm

git submodule update --init

echo "############################################"
echo "++ Configuring environment ++"
echo "############################################"
declare -a resources=(
    "config/alacritty"
    "config/fontconfig"
    "config/kitty"
    "config/nvim"
    "config/ranger"
    "config/sway"
    "config/tmux"
    "config/vale"
    "config/waybar"
    "config/zsh"
    "gitconfig"
    "p10k.zsh"
    "zshrc"
)
for i in "${resources[@]}"
do
    # The below is a destructive operation!
    ln -fv -ns "$PWD/$i" "$HOME/.$i"
done

# Add specific `alacritty` config for host "mul"
if [[ "$HOSTNAME" == "mul" ]]; then
    echo -e "shell:\n  args:\n    - -l\n    - -c\n    - \"tmux new\"" > \
        ~/.config/alacritty/mul.yml
fi

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
echo "++ Done... run exec /bin/zsh ++"
echo "############################################"
