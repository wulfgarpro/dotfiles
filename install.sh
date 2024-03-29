#!/usr/bin/env bash
set -e
set -o pipefail
set -u

# Assumptions - an initial Arch Linux install with internet access and a
# well-defined $PATH.

if [ "${1-}" == "--help" ]; then
	echo "./install"
	exit 1
fi

read -n 1 -s -r -p "Press any key to continue..."

git submodule update --init

echo -e "\n"
echo "############################################"
echo "++ Installing base and cloning submodules ++"
echo "############################################"
sudo pacman -Syuq --noconfirm
sudo pacman -Sq --noconfirm --needed \
	base-devel \
	curl \
	fd \
	firefox \
	gedit \
	gedit-plugins \
	git \
	git-lfs \
	grim \
	jq \
	lazygit \
	luarocks \
	meld \
	neovim \
	net-tools \
	noto-fonts \
	noto-fonts-cjk \
	noto-fonts-extra \
	pamixer \
	pipewire-pulse \
	polkit \
	pyenv \
	python-pillow \
	python-pynvim \
	ranger \
	ripgrep \
	slurp \
	sway \
	swaybg \
	swayidle \
	swaylock \
	tree \
	ttf-font-awesome \
	ttf-jetbrains-mono \
	ttf-jetbrains-mono-nerd \
	ttf-nerd-fonts-symbols \
	ttf-nerd-fonts-symbols-mono \
	unzip \
	waybar \
	wezterm \
	wget \
	wofi \
	xplr \
	xorg-xwayland \
	zig
sudo pacman -Sqcc --noconfirm

# If `paru` is not installed, install from AUR:
# `git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si`
paru -Sq --noconfirm --needed \
  light
paru -Sqcc --noconfirm

echo "############################################"
echo "++ Configuring environment ++"
echo "############################################"
declare -a resources=(
	"config/gtk-3.0"
	"config/fontconfig"
	"config/nvim"
	"config/ranger"
	"config/sway"
	"config/systemd"
	"config/waybar"
	"config/wezterm"
	"config/wofi"
	"config/zsh"
	"gitconfig"
	"p10k.zsh"
	"zshrc"
)
for i in "${resources[@]}"; do
	# The below is a destructive operation!
	rm -rf "$HOME/.$i"
	ln -sfT "$(pwd)/$i" "$HOME/.$i"
done

# Reload and enable the `set-bing-wallpaper` systemd timer.
systemctl --user daemon-reload
systemctl --user enable --now set-bing-wallpaper.timer

echo "############################################"
echo "++ Done... run exec /bin/zsh ++"
echo "############################################"
