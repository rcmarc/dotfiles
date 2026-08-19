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

export EDITOR=nvim
export NPM_PREFIX="$HOME/.local/opt/npm-prefix"
export PATH="$HOME/.local/bin:$HOME/$NPM_PREFIX/bin:$PATH"
