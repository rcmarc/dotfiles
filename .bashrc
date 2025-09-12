# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
export PATH="$HOME/.local/bin:/usr/local/bin:/usr/bin"
export EDITOR="nvim"
export NODE_HOME="$HOME/.local/lib/node-v22.16.0-linux-x64"
export GOPATH="$HOME/.go"

# DOTNET
export DOTNET_ROOT="$HOME/.local/lib/dotnet-sdk-8.0.413-linux-x64/"

# Customization

alias ls="ls --color=auto"
alias dot="git --git-dir ~/.local/lib/dotfiles --work-tree ~"
alias vim="nvim"

PS1='\[\e[38;5;36m\]\[\e[0m\] \[\e[38;5;36;1m\]\u\[\e[0m\] \[\e[38;5;36;1m\]\W\[\e[0m\] \[\e[1m\]\\$\[\e[0m\] '
