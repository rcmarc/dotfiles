# aliases
alias ls="ls --color=auto"
alias dot="git --git-dir ~/.local/opt/dotfiles --work-tree ~"
alias vim="nvim"
alias vi="nvim"
alias grep='grep --color=auto'

# load auto complete
autoload -Uz compinit promptinit
compinit
promptinit

# a simple prompt
PROMPT="%B%F{28}%n%f%b@%B%F{28}%m%f%b %~ $ "

# ensure gpg prompts in the terminal
export GPG_TTY=$(tty)
