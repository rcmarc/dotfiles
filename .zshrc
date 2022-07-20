export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git sudo)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

if [ -d "$HOME/.local/bin" ] ;
	then PATH="$HOME/.local/bin:$PATH"
fi

# aliases
alias ls="ls --color=auto"
alias nvimz="nvim ~/.zshrc"
alias npmg="npm --location=global"
alias dots="git --git-dir=$HOME/Coding/dotfiles --work-tree=$HOME"

# plugins
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# cargo
export PATH=~/.cargo/bin:$PATH

alias luamake=~/.config/lua-language-server/3rd/luamake/luamake
