# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

#source /etc/environment

DEFAULT_USER="james"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git sudo history-sync)

# autocd
setopt autocd
# share_history
setopt share_history

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/home/james/.local/bin:/home/james/.local/:/home/james/Qt5.3.2/5.3/gcc_64/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

# GPG
#export GPGKEY=D91660BC
export GPGKEY=550A2F53

export DEBFULLNAME="James Fraser"
export DEBEMAIL="wulfgar.pro@gmail.com"

alias vim=gvim
alias gcp=gcp
alias df=dfc
alias top=htop
alias cp=gcp
