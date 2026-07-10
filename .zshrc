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
export PATH="$HOME/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/rcmarc/.lmstudio/bin"
# End of LM Studio CLI section

# Add global npm packages that persists for every node install, like lsp servers
export PATH="$PATH:$HOME/.npm-global/bin"
