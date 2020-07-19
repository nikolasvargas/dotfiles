export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="minimal"

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
alias batconf="nvim /home/nikolas/.config/bat/config"
# alias dps="docker ps --format \"table {{.ID}}\\t{{.Names}}\\t{{.Command}}\\t{{.Status}}\\t{{.Ports}}\""
alias dps="docker ps --format \"table {{.ID}}\\t{{.Names}}\\t{{.Status}}\\t{{.Ports}}\""
alias dco="docker-compose"
alias dlf="docker logs -f"
alias deit="docker exec -it"
alias grin="grep -Rin"
alias sv="source ./venv/bin/activate"
alias v="nvim"
alias vim="nvim"
alias weather="curl wttr.in"

########## Django ###########
#####################################################
alias pms="python manage.py shell -i ipython"
alias mkm="python manage.py makemigrations"
alias mm="python manage.py migrate"
alias pmr="python manage.py runserver"
alias pmt="python manage.py test -p '*test.py' -v 2"

########## httpie ###########
#####################################################
alias hg="http -f GET"
alias hp="http -f POST"

########## DISPLAY ###########
#####################################################
alias xto="xrandr --auto"
alias xh="xrandr --output HDMI-1"
alias xright="xrandr --output eDP-1 --left-of HDMI-1"
alias xleft="xrandr --output eDP-1 --right-of HDMI-1"
alias xabove="xrandr --output HDMI-1 --above eDP-1"
alias rotateleft="xrandr --output HDMI-1 --rotate left"
alias rotateright="xrandr --output HDMI-1 --rotate right"
