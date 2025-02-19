$env:XDG_CONFIG_HOME = "$HOME\.config"
$env:Path += ";C:\Users\user\AppData\Local\Programs\oh-my-posh\bin"

Set-Alias n nvim

function code { Set-Location "$HOME\source\repos" }
function dots { Set-Location "$HOME\source\repos\dotfiles" }

oh-my-posh init pwsh | Invoke-Expression
