#!/usr/bin/env bash

# Check if program $1(argument 1) is installed
function exists() {
	command -v "$1" >/dev/null 2>&1
}

# Check if program $1 is installed, if not, exit with an error message
function check_install() {
	if ! exists "$1"; then
		echo "$1 is not installed. Aborting..."
		exit 1
	fi
}

# Check if a file exists and is not a symlink(not stowed)
function check_file() {
	if [[ -f $1 && ! -L $1 ]]; then
		echo "Backing up existing $1 file..."
		mv $1 "$1.back.$(date +%Y%m%d%H%M%S)"
	fi
}

PROGRAMS=(zsh stow tmux)
for p in "${PROGRAMS[@]}"; do
	check_install $p
done

### Git configuration ###
# Set up git config directory
GIT_CONFIG_DIR=~/.config/git
[[ ! -d "$GIT_CONFIG_DIR" ]] && mkdir -p "$GIT_CONFIG_DIR"

# Check if git config, template files exist and back them up if they do
check_file "$GIT_CONFIG_DIR/config"
check_file "$GIT_CONFIG_DIR/template"
stow -Rv git

# Install Antidote (ZSH plugin manager)
ANTIDOTE_DIR=${ZDOTDIR:-~}/.antidote
if [[ ! -d "$ANTIDOTE_DIR" ]]; then
	echo "Antidote installation directory does not exist. Cloning..."
	git clone --depth=1 https://github.com/mattmc3/antidote.git "$ANTIDOTE_DIR"
fi

# stow ZSH config
stow -Rv zsh

# tmux config
# check_file "~/.tmux.conf"
stow -Rv tmux
