# Function to create symlinks using mklink
function New-Symlink {
    param (
        [string]$Target,
        [string]$Link
    )

    # Remove existing link if it exists
    if (Test-Path $Link) {
        Remove-Item -Force -Recurse $Link
    }

    # Use mklink for files and directories
    if (Test-Path $Target -PathType Container) {
        cmd /c mklink /D "$Link" "$Target"
    } else {
        cmd /c mklink "$Link" "$Target"
    }
}

# Ensure ~/.config exists
mkdir -Force "$HOME\.config"

# Create symlinks
New-Symlink "$PWD\Microsoft.PowerShell_profile.ps1" "$PROFILE"
New-Symlink "$PWD\config\wezterm" "$HOME\.config\wezterm"
New-Symlink "$PWD\config\nvim" "$HOME\.config\nvim"

# Install git-aliases
Install-Module git-aliases -Scope CurrentUser -AllowClobber
# Install Oh My Posh
winget install JanDeDobbeleer.OhMyPost -s winget
# TODO: Install other critical packages, e.g. Git, Neovim, LazyGit, RipGrep, etc.

# Source PowerShell profile if it exists
if (Test-Path $PROFILE) {
    . $PROFILE
} else {
    Write-Host "PowerShell profile not found: $PROFILE"
}
