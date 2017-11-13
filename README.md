# dotfiles
> This is my dotfile repo. I check this out at my $HOME across my machines.

## Setup

```bash
git clone git://github.com/wulfgarpro/dotfiles.git
cd dotfiles
git submodule update --init --recursive
cd dotfiles
./install.sh
cd ../ && rm -rf dotfiles
chsh -s /bin/zsh
gnome-session-quit
```

## Thanks for the fish: 
* https://github.com/robbyrussell/oh-my-zsh
* https://github.com/VundleVim/Vundle.vim
* https://github.com/sonph/onehalf
* https://github.com/itchyny/lightline.vim
* https://github.com/powerline/fonts

## License
MIT © [James Fraser](https://www.wulfgar.pro)
