ZSH=$HOME/.oh-my-zsh

DEFAULT_USER="james"
ZSH_THEME="steeef"
plugins=(git colorize sudo history-sync zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

alias df=dfc
alias top=htop
alias add='ga'
alias fetch='gf'
alias commit='gc'
alias status='gst'
alias diff='gd'
alias push='gp'
alias pull='gl'

setopt autocd
setopt share_history

#export GPGKEY=D91660BC
export GPGKEY=550A2F53
export DEBFULLNAME="James Fraser"
export DEBEMAIL="wulfgar.pro@gmail.com"

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NODE_PATH=/usr/lib/nodejs:/usr/lib/node_modules:/usr/share/javascript:/home/james/.nvm/versions/node/v8.1.0/lib/node_modules:/home/james/.nvm/versions/node/v8.1.4/lib/node_modules

# Python
alias python=python3
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/code
export VIRTUALENVWRAPPER_PYTHON="$(which python3)"
if [[ -a /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
else
    source "$HOME"/.local/bin/virtualenvwrapper.sh
fi

# Path
export PATH=$PATH:/home/james/.local/bin:/home/james/.local/:/home/james/Qt5.3.2/5.3/gcc_64/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Env.
echo "/bin/zsh" >> $HOME/.bashrc
cd $HOME

