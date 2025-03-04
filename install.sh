#!/usr/bin/env bash

set -e
set -o pipefail
set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Assumptions - an initial Arch Linux install with internet access and a
# well-defined $PATH.

# if [ "${1-}" == "--help" ]; then
#   echo "./install"
#   exit 1
# fi

read -n 1 -s -r -p "Press any key to continue..."
echo

echo -e "\n"
echo "############################################"
echo "++ Installing base and cloning submodules ++"
echo "############################################"

git submodule update --init

# Update `pacman` database and upgrade packages.
sudo pacman -Syuq --noconfirm

sudo pacman -Sq --noconfirm --needed \
  base-devel \
  curl \
  difftastic \
  eza \
  fastfetch \
  fd \
  git \
  git-lfs \
  grim \
  hexyl \
  lazygit \
  luarocks \
  mako \
  meld \
  neovim \
  net-tools \
  noto-fonts \
  noto-fonts-cjk \
  noto-fonts-emoji \
  noto-fonts-extra \
  oculante \
  polkit \
  python3 \
  pyenv \
  ripgrep \
  slurp \
  sway \
  swaybg \
  swayidle \
  swaylock \
  tmux \
  tree \
  ttf-font-awesome \
  ttf-jetbrains-mono \
  ttf-jetbrains-mono-nerd \
  ttf-nerd-fonts-symbols \
  ttf-nerd-fonts-symbols-mono \
  unzip \
  vim \
  waybar \
  wezterm \
  wget \
  wofi \
  xorg-xwayland \
  xdg-desktop-portal-gtk \
  xdg-desktop-portal-wlr \
  yazi \
  zathura \
  zsh

# Cleanup `pacman` cache.
sudo pacman -Sqcc --noconfirm

# If `paru` is _not_ installed, install from AUR:
# `git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si`
paru -Sq --noconfirm --needed \
  google-chrome
paru -Sqcc --noconfirm

echo "############################################"
echo "++ Installing dotfiles ++ "
echo "############################################"

declare -a resources=(
  "config/aerc"
  "config/eza"
  "config/paru"
  "config/mako"
  "config/nvim"
  "config/sway"
  "config/tmux"
  "config/waybar"
  "config/wezterm"
  "config/wofi"
  "config/yazi"
  "config/zathura"
  "config/zsh"
  "gitconfig"
  "p10k.zsh"
  "zshrc"
  "zsh_aliases"
)

for i in "${resources[@]}"; do
  destination="${HOME}/.$i"
  if [ -e "${destination}" ]; then
    read -r -p "${destination} already exists. Do you want to overwrite? Y/N " overwrite
    if [[ "${overwrite}" =~ ^[yY] ]]; then
      rm -rf "${HOME}/.$i"
    else
      continue
    fi
  fi
  ln -sfT "$SCRIPT_DIR/$i" "${HOME}/.$i"
done

# Reload and enable the `set-bing-wallpaper` systemd timer.
# systemctl --user daemon-reload
# systemctl --user enable --now set-bing-wallpaper.timer

# Relaunch `zsh`.
exec zsh
