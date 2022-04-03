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
source "${HOME}/.config/zsh/themes/eastwood.zsh-theme"

#-Plugins
source "${HOME}/.config/zsh/plugins/git/git.plugin.zsh"
source "${HOME}/.config/zsh/plugins/sudo/sudo.plugin.zsh"
source "${HOME}/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
source "${HOME}/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"

#-Aliases
## Programming
alias gs="gst"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias cat="bat -p" # -p is plain

## Project
alias ccl="cargo check-lints"
alias crb="cargo run-build"

## System
alias cat="bat"
alias n="nvim"
