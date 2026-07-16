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
export ANDROID_HOME=${HOME}/Android/Sdk
HOME_BIN=${HOME}/bin
LOCAL_BIN=${HOME}/.local/bin
CARGO_BIN=${HOME}/.cargo/bin
GO_BIN=${HOME}/go/bin
# Resolve the latest installed NDK instead of pinning a version 
# (N: no error if absent, /: dirs only, On: sort by name descending so [1] is newest).
typeset -a _ndk_dirs=(${ANDROID_HOME}/ndk/*(N/On))
export NDK_HOME=${_ndk_dirs[1]}
unset _ndk_dirs
# Add NDK bins to path
[[ -n $NDK_HOME ]] && PATH="$PATH:$NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin"

#-Exports
export EDITOR=nvim
## libvirt's default URI
export LIBVIRT_DEFAULT_URI="qemu:///system"
## Wayland
if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
    ## Don't reparent Java AWT/Swing apps
    export _JAVA_AWT_WM_NONREPARENTING=1
    #export WLR_NO_HARDWARE_CURSORS=1
fi
## DEBUGINFOD_URLS for GDB/pwndbg
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"
## GHIDRA_INSTALL_DIR for PyGhidra
export GHIDRA_INSTALL_DIR=/opt/ghidra/

## PATH
export PATH=$HOME_BIN:$LOCAL_BIN:$CARGO_BIN:$GO_BIN:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/emulator:$PATH

# Enable shell autocompletion for `uv` and `uvx` commands.
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

#-Theme (cont.)
## Source p10k; to customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
