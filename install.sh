#!/usr/bin/env bash
#set -x

# Assume Ubuntu + Gnome-terminal as default system,
# WSL install does not include fonts or terminal theme.

if [ "$1" == "--help" ]; then
    echo "./install [--wsl]"
    exit 1
fi

echo "###########################################"
echo "++ Installing git and cloning submodules ++"
echo "###########################################"
sudo apt-get install git
git submodule update --init --recursive

echo "###########################################"
echo "++ Installing system dependencies ++"
echo "###########################################"
deps="vim vim-gtk3 fontconfig zsh python3 python3-pip"
if [ "$1" == "--wsl" ]; then
    sudo apt-get install "$deps"
else
    sudo apt-get install "$deps" #dconftools gconf2
fi

echo "###########################################"
echo "++ Installing python modules ++"
echo "###########################################"
python3 -m pip install pip --upgrade
python3 -m pip install --user virtualenvwrapper 

echo "###########################################"
echo "++ Configuring environment ++"
echo "###########################################"
declare -a resources=(".gvimrc" ".oh-my-zsh" ".vimrc" ".zshrc" ".vim")
for i in "${resources[@]}"
do
    mv "$HOME"/"$i" "$HOME"/"${i}"_backup_"$(date +%H%M%S)"
    ln -fv -ns "$PWD"/"$i" "$HOME"/"$i" 
done

echo "###########################################"
echo "++ Installing vim plugins with Vundle ++"
echo "###########################################"
echo "vim +PluginInstall +qall"
vim +PluginInstall +qall

if [ "$1" != "--wsl" ]; then
    echo "###########################################"
    echo "++ Installing Powerline patched fonts ++"
    echo "###########################################"
    "$PWD"/.fonts/install.sh

    echo "###########################################"
    echo "++ Installing theme for gnome-terminal ++"
    echo "###########################################"
    # Permission issue?
    chmod +x "$PWD"/.onehalf-gnome-terminal-setup/onehalfdark.sh
    "$PWD"/.onehalf-gnome-terminal-setup/onehalfdark.sh
fi

echo "###############################################"
echo "++ Done... run /bin/zsh ++"
echo "###############################################"

