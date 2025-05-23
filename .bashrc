# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
export PATH="$HOME/.local/bin:/usr/local/bin:/usr/bin"
export EDITOR="nvim"

alias ls="ls --color=auto"
alias dot="git --git-dir ~/.local/lib/dotfiles --work-tree ~"
alias vim="nvim"


