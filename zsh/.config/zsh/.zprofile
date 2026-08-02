if [[ -f "/opt/homebrew/bin/brew" ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv zsh)"
fi

export LC_ALL=en_US.UTF-8

#### EDITORS ####
export EDITOR="${EDITOR:-vim}"
export VISUAL="${VISUAL:-vim}"
export PAGER="${PAGER:-less}"

# Set up Bat as manpager
if command -v bat >/dev/null 2>&1; then
    export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
fi

#### PATHS ####

# Ensure path arrays do not contain duplicates.
typeset -gU path fpath

path=(
    $HOME/{,s}bin(N)
    /opt/{homebrew,local}/{,s}bin(N)
    /usr/local/{,s}bin(N)
    $path
)

#### MacOS PATHS ####
if [[ $OSTYPE = *darwin* ]]; then
    path=(
        "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" 
        $HOME/Dev/SDK/zulu-25/bin
        $path
    )
fi

# Bun runtime
if [[ -d "$HOME/.bun" ]]; then
    export BUN_INSTALL="$HOME/.bun"
    path=($BUN_INSTALL/bin $path)
fi

# bun completions
[ -s "${HOME}/.bun/_bun" ] && source "${HOME}/.bun/_bun"
