# .bashrc

export EDITOR="nvim"

# Customization

alias ls="ls --color=auto"
alias dot="git --git-dir ~/.local/lib/dotfiles --work-tree ~"
alias vim="nvim"

PS1='\[\e[38;5;36m\]\[\e[0m\] \[\e[38;5;36;1m\]\u\[\e[0m\]@\[\e[38;5;36;1m\]\h\[\e[0m\] \[\e[38;5;36;1m\]\W\[\e[0m\] \[\e[1m\]\\$\[\e[0m\] '
