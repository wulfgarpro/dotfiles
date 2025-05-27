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
source "${HOME}/.config/zsh/lib/colored-man-pages.plugin.zsh"
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
source "${HOME}/.zsh_aliases"

#-Variables
ANDROID_HOME=${HOME}/Android/Sdk
LOCAL_BIN=${HOME}/.local/bin
CARGO_BIN=${HOME}/.cargo/bin
GO_BIN=${HOME}/go/bin

#-Exports
export EDITOR=nvim
export PYENV_ROOT="${HOME}/.pyenv"
## libvirt's default URI
export LIBVIRT_DEFAULT_URI="qemu:///system"
## Wayland
if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
    ## Don't reparent Java AWT/Swing apps
    export _JAVA_AWT_WM_NONREPARENTING=1
fi
## PATH
export PATH=$LOCAL_BIN:$CARGO_BIN:$PYENV_ROOT:$GO_BIN:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH

# Init Pyenv
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#-Theme (cont.)
## Source p10k; to customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
