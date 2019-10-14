export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH
export ZSH="/home/nikolas/.oh-my-zsh"
ZSH_THEME="minimal"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias vconf="nvim ~/.config/nvim/init.vim"
alias dps="docker ps --format \"table {{.ID}}\\t{{.Names}}\\t{{.Command}}\\t{{.Status}}\\t{{.Ports}}\""
alias dco="docker-compose"
alias dlf="docker logs -f"
alias deit="docker exec -it"
alias grin="grep -Rin"
alias v="nvim"
alias vim="nvim"
