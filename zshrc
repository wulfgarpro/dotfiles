# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz compinit colors
compinit; colors

bindkey -e

setopt prompt_subst

#-Libs
source "${HOME}/.config/zsh/lib/key-bindings.zsh"
source "${HOME}/.config/zsh/lib/directories.zsh"
source "${HOME}/.config/zsh/lib/theme-and-appearance.zsh"
source "${HOME}/.config/zsh/lib/completion.zsh"
source "${HOME}/.config/zsh/lib/history.zsh"
source "${HOME}/.config/zsh/lib/git.zsh"

#-Theme
source "${HOME}/.config/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme"

#-Plugins
source "${HOME}/.config/zsh/plugins/git/git.plugin.zsh"
source "${HOME}/.config/zsh/plugins/sudo/sudo.plugin.zsh"
source "${HOME}/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
source "${HOME}/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"

#-Aliases
## Programming
alias gdt="git difftool"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gmt="git mergetool"
alias gmv="git mv"
alias gpl="git pull"
alias gs="git stash"
alias gsp="git stash pop"

## Project
alias cnt="cargo nextest run" # `cargo install cargo-nextest`
alias cw="cargo watch -x" # `cargo install cargo-watch`

## System
alias cat="bat -p" # `-p` is plain
alias n="nvim"
alias sudo="sudo " # Space allows `sudo` aliases

## Tools
alias smbmap="smbmap.py"

#-Variables
LOCAL_BIN=$HOME/.local/bin
CARGO_BIN=$HOME/.cargo/bin
GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
GEM_BIN=$GEM_HOME/bin

#-Environment
export LIBVIRT_DEFAULT_URI="qemu:///system"
export PATH=$LOCAL_BIN:$CARGO_BIN:$GEM_BIN:$PATH
## `pyenv`
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
## Enable wayland display protocol for Firefox if running wayland
if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
    export MOD_ENABLE_WAYLAND=1
fi

#-Theme (cont.)
# Source p10k; to customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
