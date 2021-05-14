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
plugins=(git history-substring-search tmux pass)

export PATH=/home/tuutti/bin:/home/tuutti/scripts:$PATH:/home/tuutti/.gem/ruby/2.7.0/bin:$HOME/.composer/vendor/bin:$HOME/.cargo/bin

source $ZSH/oh-my-zsh.sh

function xrdbload() {
  xrdb -load ~/.Xdefaults && xrdb -load ~/.Xresources
}
function d-install() { drush pm-download "$@"; drush pm-enable "$@"; }
function d-cc() { drush cc all; }
function d-uninstall() { drush pm-disable "$@"; drush pm-uninstall "$@"; }

function unixt() {
  date -d @$1;
}
function sconsole() {
  $(git rev-parse --show-toplevel)/app/console "$@";
}

function sr() {
  git grep -l "$1" | xargs sed -i "s/$1/$2/g"
}

function dattach() {
  docker-compose exec --user drupal drupal bash -c "export COLUMNS=`tput cols`; export LINES=`tput lines`; exec bash"
}

alias stonehenge='make -C /srv/http/stonehenge'
alias grep='grep -n --color=auto'
alias ssh='TERM=xterm ssh'
alias tmux='tmux -2'
alias ls='ls --color=auto'
alias ':q'='exit'
alias ':Q'='exit'
alias 'tl'='tmux ls'
alias 's'='sudo -E'
alias less='LESSOPEN="| source-highlight-esc.sh %s" less -M'

setopt menu_complete
#export KEYTIMEOUT=1
export GPG_TTY=$(tty)

[ -s "/home/tuutti/.scm_breeze/scm_breeze.sh" ] && source "/home/tuutti/.scm_breeze/scm_breeze.sh"

eval `dircolors ~/.dircolors.256dark`

zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit

function _scmb_git_last_branches {
  fail_if_not_git_repo || return 1

  # Use ruby to inject numbers into ls output
  ruby -e "$( cat <<EOF
    output = %x($_git_cmd for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)' $@)
    line_count = output.lines.to_a.size
    output.lines.each_with_index do |line, i|
      spaces = (line_count > 9 && i < 9 ? "  " : " ")
      puts line.sub(/^([ *]{0})/, "\\\1\033[2;37m[\033[0m#{i+1}\033[2;37m]\033[0m" << spaces)
    end
EOF
)"

  # Set numbered file shortcut in variable
  local e=1
  for branch in $($_git_cmd for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)'); do
    export $git_env_char$e="$branch"
    if [ "${scmbDebug:-}" = "true" ]; then echo "Set \$$git_env_char$e  => $file"; fi
    let e++
  done
}

__git_alias "$git_last_branches" "_scmb_git_last_branches"

source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
source /usr/share/nvm/init-nvm.sh
