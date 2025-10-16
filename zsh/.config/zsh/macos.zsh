export JAVA_HOME=${HOME}/Dev/Tools/zulu-jdk25/

typeset -gU path fpath
path=(
    ${JAVA_HOME}/bin
    ${HOME}/.cargo/bin
    $path
)
export PATH

export GIT_EDITOR="nvim"

alias tldr="tldr -L en"
alias git="LC_ALL=en_US git"
