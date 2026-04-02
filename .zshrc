alias ls="ls --color=auto"
alias dot="git --git-dir ~/.local/opt/dotfiles --work-tree ~"
alias vim="nvim"

autoload -Uz compinit promptinit
compinit
promptinit

PROMPT="%B%F{28}%n%f%b@%B%F{28}%m%f%b %~ $ "
