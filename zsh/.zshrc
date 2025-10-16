# Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"
# source $ZSH/oh-my-zsh.sh

# Antidote plugin manager setup 
function is-macos() { [[ $OSTYPE == *darwin* ]]; }
antidote_dir=${ZDOTDIR:-$HOME}/.antidote
zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins
if [[ ! -d $antidote_dir ]]; then
    git clone --depth=1 https://github.com/mattmc3/antidote.git $antidote_dir
fi

source $antidote_dir/antidote.zsh
antidote load

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy/mm/dd"

# Common functions
source ${ZDOTDIR:-$HOME}/.config/zsh/functions.zsh

# OS specific custom zsh
case "$OSTYPE" in
    darwin*)
        source "${ZDOTDIR:-$HOME}/.config/zsh/macos.zsh"
        ;;
    linux-gnu*)
        source "${ZDOTDIR:-$HOME}/.config/zsh/linux.zsh"
        ;;
esac

ZSH_THEME=robbyrussell

# bun completions
[ -s "/Users/atai/.bun/_bun" ] && source "/Users/atai/.bun/_bun"