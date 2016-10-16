if [ "$(whoami)" = "root" ]
then CARETCOLOR="red"
else CARETCOLOR="blue"
fi

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

#local vi_normal_marker="%{$reset_color%}[%{$fg[green]%}%BN%b%{$reset_color%}]"
#local vi_insert_marker="%{$reset_color%}[%{$fg[039]%}%BI%b%{$reset_color%}]"
#local vi_unknown_marker="%{$reset_color%}[%{$fg[red]%}%BU%b%{$reset_color%}]"
#local vi_mode="$vi_insert_marker"
#vi_mode_indicator () {
#  case ${KEYMAP} in
#    (vicmd)      echo $vi_normal_marker ;;
#    (main|viins) echo $vi_insert_marker ;;
#    (*)          echo $vi_unknown_marker ;;
#  esac
#}
#
#function zle-line-init zle-keymap-select {
#  vi_mode="$(vi_mode_indicator)"
#  zle reset-prompt
#}
#zle -N zle-line-init
#zle -N zle-keymap-select
vi_mode=""

PROMPT='%{$FG[109]%}%m%{${fg_bold[red]}%} :: %{$reset_color%}%{${FG[208]}%}%3~ ${vi_mode} $(git_prompt_info)%{${fg_bold[$CARETCOLOR]}%}%#%{${reset_color}%} '

RPS1='${return_code}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
