# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

#source /etc/environment

DEFAULT_USER="james"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
ZSH_THEME="steeef"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git colorize sudo history-sync zsh-syntax-highlighting)

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

#alias vim=gvim
#alias gcp=gcp
alias df=dfc
alias top=htop
#alias cp=gcp

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/james/.sdkman"
[[ -s "/home/james/.sdkman/bin/sdkman-init.sh" ]] && source "/home/james/.sdkman/bin/sdkman-init.sh"

if hash lolcat 2>/dev/null; then
    alias cat=lolcat
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NODE_PATH=/usr/lib/nodejs:/usr/lib/node_modules:/usr/share/javascript:/home/james/.nvm/versions/node/v8.1.0/lib/node_modules:/home/james/.nvm/versions/node/v8.1.4/lib/node_modules
