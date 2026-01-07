#!/usr/bin/env bash

set -e
set -o pipefail
set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Assumptions - an initial Arch Linux install with internet access and a
# well-defined $PATH.

SKIP_INSTALL=false

if [[ "${1-}" == "-ni" ]]; then
  SKIP_INSTALL=true
fi

if [[ "${1-}" == "--help" || "${1-}" == "-h" ]]; then
  echo "./install [OPTIONS]"
  echo
  echo "Options:"
  echo "  -ni         Skip package installation"
  echo "  -h, --help  Show this help message and exit"
  exit 0
fi

read -n 1 -s -r -p "Press any key to continue..."
echo

git submodule update --init

if [[ "$SKIP_INSTALL" == false ]]; then

  echo -e "\n"
  echo "############################################"
  echo "++ Installing base and cloning submodules ++"
  echo "############################################"

  # Update `pacman` database and upgrade packages.
  sudo pacman -Syuq --noconfirm

  sudo pacman -Sq --noconfirm --needed \
    autotiling \
    base-devel \
    bat \
    bluez \
    bluez-utils \
    brightnessctl \
    curl \
    difftastic \
    eza \
    fastfetch \
    fd \
    file-roller \
    firefox \
    git \
    git-delta \
    git-lfs \
    grim \
    hexyl \
    hunspell \
    hunspell-en_au \
    lazygit \
    libreoffice-still \
    luarocks \
    lsd \
    mako \
    meld \
    mermaid-cli \
    neovim \
    net-tools \
    network-manager-applet \
    networkmanager-openvpn \
    nm-connection-editor \
    noto-fonts \
    noto-fonts-cjk \
    noto-fonts-emoji \
    noto-fonts-extra \
    npm \
    oculante \
    polkit \
    python3 \
    pyenv \
    ripgrep \
    slurp \
    swappy \
    sway \
    swaybg \
    swayidle \
    swaylock \
    tectonic \
    thunar \
    thunar-archive-plugin \
    thunar-volman \
    tmux \
    trash-cli \
    tree \
    tree-sitter-cli \
    ttf-font-awesome \
    ttf-jetbrains-mono \
    ttf-jetbrains-mono-nerd \
    ttf-nerd-fonts-symbols \
    ttf-nerd-fonts-symbols-mono \
    tumbler \
    unzip \
    vim \
    waybar \
    webp-pixbuf-loader \
    wezterm \
    wget \
    wofi \
    xorg-xwayland \
    xdg-desktop-portal-gtk \
    xdg-desktop-portal-wlr \
    yazi \
    zathura \
    zathura-pdf-poppler \
    zsh #hunspell-au \

  # Cleanup `pacman` cache.
  sudo pacman -Sqcc --noconfirm

  # If `paru` is _not_ installed, install from AUR:
  # `git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si`
  paru -Sq --noconfirm --needed \
    google-chrome
  paru -Sqcc --noconfirm
fi

echo "############################################"
echo "++ Installing dotfiles ++ "
echo "############################################"

declare -a resources=(
  "config/aerc"
  "config/bat"
  "config/delta"
  "config/eza"
  "config/fontconfig"
  "config/mako"
  "config/nvim"
  "config/paru"
  "config/sway"
  "config/systemd"
  "config/tmux"
  "config/waybar"
  "config/wezterm"
  "config/wofi"
  "config/yazi"
  "config/zathura"
  "config/zsh"
  "gdbinit"
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
  ln -sfT "${SCRIPT_DIR}/$i" "${HOME}/.$i"
done

# Reload and enable the systemd services for user
systemctl --user daemon-reload
# systemctl --user enable --now set-bing-wallpaper.timer
systemctl --user enable --now inhibit-suspend-on-ssh.service

# Rebuild font cache
fc-cache -fv

# Firefox
APP_DIR="${HOME}/.local/share/applications"
LOCAL_BIN="${HOME}"/.local/bin
rm "${APP_DIR}/firefox.desktop" 2>/dev/null
rm "${LOCAL_BIN}/firefox" 2>/dev/null
ln -sfT "${SCRIPT_DIR}/.config/sway/scripts/resources/firefox.desktop" "${APP_DIR}/firefox.desktop"
ln -sfT "${SCRIPT_DIR}/.config/sway/scripts/firefox" "${LOCAL_BIN}/firefox"

# Relaunch `zsh`.
exec zsh
