#!/usr/bin/env bash

# .bashrc
# ~/.config/bash/.bashrc

# — Shell Setup ————————————————————————————————————————————————————————————— #

export {SHELL,BASH}="$( which bash )"

# — XDG Base Directory Specification ———————————————————————————————————————— #

export XDG_CONFIG_HOME="$HOME/.config"
export  XDG_CACHE_HOME="$HOME/.cache"
export  XDG_STATE_HOME="$HOME/.local/state"
export   XDG_DATA_HOME="$HOME/.local/share"
export   XDG_DATA_DIRS='/usr/local/share/:/usr/share/'

# — XDG Shorthands ————————————————————— #

export CONFIG="$XDG_CONFIG_HOME"
export  CACHE="$XDG_CACHE_HOME"
export  STATE="$XDG_STATE_HOME"
export   DATA="$XDG_DATA_HOME"

# — Bash Variables —————————————————————————————————————————————————————————— #

export HISTFILE="$CONFIG/.history/.bash_history"
export PROMPT_COMMAND='_prompt_command'
export EDITOR='nvim'
export PAGER='less'

# — External Function Variables ————————————————————————————————————————————— #

export {HOMEBREW_{PREFIX,REPOSITORY},BREW}='/opt/homebrew'
export HOMEBREW_CELLAR="$BREW/Cellar"

# — Personal Variables —————————————————————————————————————————————————————— #

export BDOTDIR="$CONFIG/bash"
export PROMPT_COMMAND='_prompt_command'  # runs before every prompt

# ——————————————————————————————————————————————————————————————————————————— #

alias l=$'ls -lahpbG%O -D "%a %e %b \'%y  %R" --color=auto'
alias ls='ls -G'

alias c='clear'
alias cl='clear; l'
alias cdl='cd; clear; l'

alias r='fc -e -'
alias rr='source "$BDOTDIR/.bashrc"'
alias rrr='source "$BDOTDIR/.bashrc"'

alias rc="echo -n $'\e[5 q'"

alias wh='type -a'

# shellcheck disable=SC2139
alias nv{im,}='_nvim'

alias -- '-'='cd "$OLDPWD"'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias w='uptime; w | gtail -n +2 | column -t'

# — Basic Function Definitions —————————————————————————————————————————————— #

path    () { printf $'%s\n' "${path[@]//$HOME/~}" ; }
join_by () { local -r IFS="$1"; shift; echo "$*"  ; }

_prompt_command() {
  local -ra colours=( 1 3 2 6 4 5 )
  local -r formatted_path="${PWD/#$HOME/\~}"
  local -a path_array=()

  IFS='/' read -ra path_array <<< "$formatted_path"

  local -i i colour_num
  local colour_esc path_segment output

  for i in "${!path_array[@]}"; do
    colour_num="${colours[ i % ${#colours[@]} ]}"
    colour_esc=$'\[\e[9'"${colour_num}m\]"

    path_segment="${path_array[i]}"

    output+="$colour_esc$path_segment"
    # print a slash after every segment except the last
    (( i != ${#path_array[@]} - 1 )) && output+=$'\[\e[2m\]/\[\e[22m\]'
    output+=$'\[\e[m\]'
  done

  output+=$'\[\e[38;5;105m\] $\[\e[m\] '
  export PS1="$output"
}

_nvim() {
  command nvim "$@"
  echo -n $'\e[5 q'
  [[ "$TERM_PROGRAM" == 'iTerm2.app' ]] && echo -n $'\e]1337;CursorShape=1\a'
}

# ——————————————————————————————————————————————————————————————————————————— #

apple_codex='/var/run/com.apple.security.cryptexd/codex.system/bootstrap'

declare -xa path=(

  "$BREW/bin"

  '/bin'            '/sbin'
  '/usr/bin'        '/usr/sbin'
  '/opt/local/bin'  '/opt/local/sbin'

  '/usr/local/bin'

  "$BREW/opt/ruby/bin"
  "$BREW/opt/openjdk/libexec/openjdk.jdk/Contents/Home"
  "$BREW/Caskroom/miniconda/base/condabin"

  '/Library/Apple/usr/bin'
  '/opt/pmk/env/global/bin'
  '/System/Cryptexes/App/usr/bin'

  "$DATA/go/bin"
  "$DATA/npm/bin"
  "$DATA/cargo/bin"
  "$DATA/rbenv/shims"
  "$HOME/Library/QQWing/1.3.4/bin"
  "$CONFIG/nvm/versions/node/v24.11.0/bin"

  "$apple_codex/usr/"{{local,appleinternal}/,}bin

  "$HOME/Desktop/CS/bin"
)

export PATH; PATH="$( join_by ':' "${path[@]}" )"

unset apple_codex

# ——————————————————————————————————————————————————————————————————————————— #

# spell:ignore cryptexd