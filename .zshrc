export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH
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

########## DISPLAY ###########
#####################################################
alias xto="xrandr --auto"
alias xright="xrandr --output eDP-1 --left-of HDMI-1"
alias xleft="xrandr --output eDP-1 --right-of HDMI-1"
alias xabove="xrandr --output HDMI-1 --above eDP-1"
#####################################################
#To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
