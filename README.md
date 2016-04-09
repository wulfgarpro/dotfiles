This is my dotfile repo. I check this out at my $HOME across my machines.

I use Linux, but this should work for OSX.

h3. Setup

$ cd ~<br />
$ git clone git://github.com/wulfgarpro/dotfiles.git .<br />
$ git submodule update --init --recursive<br /> 
$ chsh -s /bin/zsh<br />
$ gnome-session-quit

h3. Adding more...

If you want to add a new plugin to the pathogen path:

$ cd ~<br />
$ git submodule add -f git@github.com:tpope/vim-sensible.git .mydotvim/bundle/vim-sensible
$ git submodule update --init --recursive
