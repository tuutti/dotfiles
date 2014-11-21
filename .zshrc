# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="tuutti"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/tuutti/.gem/ruby/2.1.0/bin

function xrdbload() {
  xrdb -load ~/.Xdefaults && xrdb -load ~/.Xresources
}
function d-install() { drush pm-download "$@"; drush pm-enable "$@"; }
function d-cc() { drush cc all; }
function d-uninstall() { drush pm-disable "$@"; drush pm-uninstall "$@"; }

function unixt() {
  date -d @$1;
}

#export TERM='xterm-256color'
alias tmux='tmux -2'
alias ls='ls --color=auto'
alias tmuxd='tmux attach -d'
alias ':q'='exit'

setopt menu_complete
bindkey -e
alias steamwin='WINEDEBUG=-all wine ~/.wine-steam/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe -no-dwrite >/dev/null 2>&1 &'
alias wow='WINEDEBUG=-all __GL_THREADED_OPTIMIZATIONS=1 wine /home/tuutti/.wine/drive_c/Program\ Files\ \(x86\)/World\ of\ Warcraft/World\ of\ Warcraft\ Launcher.exe -opengl $> /dev/null'
alias battlenet='WINEDEBUG=-all __GL_THREADED_OPTIMIZATIONS=1 wine /home/tuutti/.wine/drive_c/Program\ Files\ \(x86\)/Battle.net/Battle.net\ Launcher.exe -opengl $> /dev/null'
alias mpv='__GL_SYNC_DISPLAY_DEVICE="DFP-1" __GL_SYNC_TO_VBLANK=1 mpv --cache=8096 --vo=opengl'
alias gll="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
#alias d3="WINEDEBUG=-all setarch i386 -3 wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Diablo\ III/Diablo\ III.exe -opengl $> /dev/null"
alias d3="WINEDEBUG=-all setarch i386 -3 -L -B -R wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Diablo\ III/Diablo\ III.exe -launch -opengl $> /dev/null"
# Load drupal specific vim settings
alias dvim='vim "+Sauce drupal"'
# load symfony specific vim settings
alias svim='vim "+Sauce symfony"'
alias sconsole="$(git rev-parse --show-toplevel)/app/console"

[ -s "/home/tuutti/.scm_breeze/scm_breeze.sh" ] && source "/home/tuutti/.scm_breeze/scm_breeze.sh"

eval `dircolors ~/.dircolors.256dark`

zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit

