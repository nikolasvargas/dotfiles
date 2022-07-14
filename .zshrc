export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="minimal"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export MANPATH="/usr/local/man:$MANPATH"

export EDITOR='nvim'

export BAT_CONFIG_PATH="$HOME/.batconfig"

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


if [ -f $HOME/.config/i3/.aliases ]; then
    source $HOME/.config/i3/.aliases
fi

########## General ###########
#####################################################
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias vconf="nvim ~/.config/nvim/init.vim"
alias dps="docker ps --format \"table {{.ID}}\\t{{.Names}}\\t{{.Status}}\\t{{.Ports}}\""
alias dco="docker-compose"
alias dlf="docker logs -f"
alias deit="docker exec -it"
alias grin="grep -Rin"
alias rmpc="find . -type d -name __pycache__ -exec rm -r {} \+"
alias sv="source ./venv/bin/activate"
alias v="nvim"
alias vim="nvim"

########## httpie ###########
#####################################################
alias hg="http -f GET"
alias hp="http -f POST"
