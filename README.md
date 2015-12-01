This is my dotfile repo. I check this out at my $HOME across my machines.

I use Linux, but this should work for OSX.

$ cd ~<br />
$ git clone git://github.com/wulfgarpro/dotfiles.git .<br />
$ git submodule update --init --recursive<br /> 
$ chsh -s /bin/zsh<br />
$ wget https://bootstrap.pypa.io/get-pip.py<br />
$ python get-pip.py<br />
$ pip install --user git+https://github.com/powerline/powerline<br />
$ git clone https://github.com/powerline/fonts.git<br />
$ cd fonts && ./install.sh
