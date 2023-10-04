ZSH=$HOME/.oh-my-zsh
ZSH_THEME="tuutti"
plugins=(git history-substring-search tmux pass)

export GEM_HOME="$HOME/.gems"
export PATH=/home/tuutti/bin:/home/tuutti/scripts:$PATH:/home/tuutti/.gem/ruby/3.0.0/bin:$HOME/.composer/vendor/bin:$HOME/.cargo/bin:$HOME/.gems/bin:$PATH

export DISABLE_AUTO_UPDATE=true
source $ZSH/oh-my-zsh.sh

function unixt() {
  date -d @$1;
}

export XDEBUG_ENABLE=true

alias vim=nvim
alias stonehenge='TRUST_STORES=system make -C /srv/http/stonehenge'
alias grep='grep -n --color=auto'
alias ssh='TERM=xterm ssh'
alias tmux='tmux -2'
alias ls='ls --color=auto'
alias ':q'='exit'
alias ':Q'='exit'
alias 's'='sudo -E'
alias less='LESSOPEN="| source-highlight-esc.sh %s" less -M'

setopt menu_complete
#export KEYTIMEOUT=1
export GPG_TTY=$(tty)

[ -s "/home/tuutti/.scm_breeze/scm_breeze.sh" ] && source "/home/tuutti/.scm_breeze/scm_breeze.sh"

source /usr/share/nvm/init-nvm.sh
