function has_command() {
    command -v "$1" >/dev/null 2>&1
}

if has_command batcat; then
    export PAGER="batcat -p"
    export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | batcat -p -lman'"
elif has_command bat; then
    export PAGER="bat -p"
    export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat -p -lman'"
else
    export PAGER="less"
    export MANPAGER="less"
fi


if has_command nvim; then
    export EDITOR="nvim"
elif has_command vim; then
    export EDITOR="vim"
else
    export EDITOR="vi"
fi

# GPG setup
export GPG_TTY=$(tty)

# Path variable setup
typeset -gU path fpath

# Common path
common_paths=()
if [[ -d "$HOME/.local/bin" ]]; then
    common_paths+=("$HOME/.local/bin")
fi

# Go SDK path
if has_command go; then
    export GOPATH="$HOME/go"
    common_paths+=("/usr/local/go/bin", "$GOPATH/bin")
fi

# Ruby path
if [[ -n "$GEM_HOME" && -d "$GEM_HOME/bin" ]]; then
    common_paths+=("$GEM_HOME/bin")
fi

path=(
    $common_paths
    $path
)
export PATH
