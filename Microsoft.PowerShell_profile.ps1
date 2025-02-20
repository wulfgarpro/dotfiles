$env:XDG_CONFIG_HOME = "$HOME\.config"
$env:Path += ";C:\Users\user\AppData\Local\Programs\oh-my-posh\bin"

Set-Alias n nvim

function code { Set-Location "$HOME\source\repos" }
function dots { Set-Location "$HOME\source\repos\dotfiles" }
function vcvars64 {
    & "C:/Program Files/Microsoft Visual Studio/2022/Professional/Common7/Tools/Launch-VsDevShell.ps1" -Arch amd64 -SkipAutomaticLocation
}


oh-my-posh init pwsh | Invoke-Expression
