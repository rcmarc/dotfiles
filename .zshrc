# good looking prompt
eval "$(starship init zsh)"

alias zshrc="$EDITOR ~/.zshrc"
alias ls="ls --color=auto"
alias dot="git --git-dir ~/.dots --work-tree ~"
alias vim="nvim"
alias cat="bat"

# use the terminal prompt for ssh
unset SSH_ASKPASS

# set up autocomplete
FPATH="~/.config/zsh/zsh-completions/src:~/.config/zsh/other-completions:$FPATH"
autoload -Uz compinit
compinit

# set up zsh history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt incappendhistory

# load plugins
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
