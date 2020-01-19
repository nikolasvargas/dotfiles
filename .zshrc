export PATH=$HOME/bin:/usr/local/bin:/sbin:$PATH
export ZSH="$HOME/.oh-my-zsh"

if [ -d "$ZSH/custom/themes/powerlevel10k" ]; then
    ZSH_THEME="powerlevel10k/powerlevel10k"
else
    ZSH_THEME="minimal"
fi

plugins=(git)

source $ZSH/oh-my-zsh.sh

export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

if [ -f $HOME/.config/i3/.aliases ]; then
    source $HOME/.config/i3/.aliases
fi

alias dco="docker-compose"
alias deit="docker exec -it"
alias dlf="docker logs -f"
alias dps="docker ps --format \"table {{.ID}}\\t{{.Names}}\\t{{.Command}}\\t{{.Status}}\\t{{.Ports}}\""
alias grin="grep -Rin"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias v="nvim"
alias vconf="nvim ~/.config/nvim/init.vim"
alias vim="nvim"
alias zshconfig="nvim ~/.zshrc"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
