export FLUTTER_BIN_DIR="$HOME/programming/flutter/bin"
export PATH=$HOME/bin:/usr/local/bin:$FLUTTER_BIN_DIR:$PATH
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="jispwoso"
# ZSH_THEME="jtriley"
ZSH_THEME="ys"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"
export EDITOR='nvim'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -f $HOME/.config/i3/.aliases ]; then
    source $HOME/.config/i3/.aliases
fi

alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias vconf="nvim ~/.config/nvim/init.lua"

alias v="nvim"
alias vim="nvim"
alias grin="grep -Rin"
alias pfgrep="grep -rn --include=\*.py"
alias rmpc="find . -type d -name __pycache__ -exec rm -r {} \+"
alias sv="source ./venv/bin/activate"

# Docker aliases
alias dps="docker ps --format \"table {{.ID}}\\t{{.Names}}\\t{{.Status}}\\t{{.Ports}}\""
alias dco="docker compose"
alias dlf="docker logs -f"
alias deit="docker exec -it"

# git clear local branchs
alias gbcl="git branch | egrep -v \"develop|main|master\" | xargs git branch -D"
