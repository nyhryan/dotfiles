if [[ -f "/opt/homebrew/bin/brew" ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv zsh)"
fi

#### EDITORS ####
export EDITOR="${EDITOR:-vim}"
export VISUAL="${VISUAL:-vim}"
export PAGER="${PAGER:-less}"

#### PATHS ####

# Ensure path arrays do not contain duplicates.
typeset -gU path fpath

path=(
    $HOME/{,s}bin(N)
    /opt/{homebrew,local}/{,s}bin(N)
    /usr/local/{,s}bin(N)
    $path
)

# Register VS code CLI if installed
if [[ -d "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ]]; then
    path=("/Applications/Visual Studio Code.app/Contents/Resources/app/bin" $path)
fi
