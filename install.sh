#! /usr/bin/env bash

# Check if certain package is installed
# Usage: is_installed lolcat
is_installed() {
	command -v "$1" >/dev/null 2>&1
}

# Check if Homebrew is installed
if ! is_installed brew ; then
	echo '>> Homebrew is not installed!'
	exit 1
else
	echo '>> Homebrew found!'
fi

# ================

# List of Homebrew packages
brew_pkgs=(
	"curl"
	"git"
	"zsh"
	"fzf"
	"stow"
)

# If set, brew install formula|cask will not upgrade formula|cask if it is installed but outdated.
HOMEBREW_NO_INSTALL_UPGRADE=1

# Install Homebrew packages
brew install "${brew_pkgs[@]}"

# ================

# Configure zsh
if ! is_installed zsh ; then
	# Append Zsh's executable epath to /etc/shells
	command -v zsh | sudo tee -a /etc/shells

	# Change default shell to ZSH
	chsh -s $(which zsh) $USER
fi

# Load Antidote plugin manager & Set up zsh
# This will automatically install Antidote inside ~/.config/zsh/ 
stow zsh
[[ -f ~/.zshenv ]] && mv -f ~/.zshenv ~/.zshenv.bak
echo ". $HOME/.config/zsh/.zshenv" > ~/.zshenv
echo ">> 🍑 Make sure to RELOAD ZSH after this installation script!"
