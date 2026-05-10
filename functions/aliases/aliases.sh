#!/usr/bin/env bash

# aliases.sh
# ~/.config/bash/functions/aliases/aliases.sh

# —— ls & clear ————————————————————————————————————————————————————————————— #

alias ls='ls -G'
alias l=$'ls -lahpbG%O -D "%a %e %b \'%y  %R" --color=auto'

alias   c='clear'
alias  cl='clear; l'
alias cdl='cd; clear; l'

# —— r & rr ————————————————————————————————————————————————————————————————— #

alias   r='fc -e -'
alias  rr='source "$BDOTDIR/.bashrc"'
alias rrr='source "$BDOTDIR/.bashrc"'

# —— cd ————————————————————————————————————————————————————————————————————— #

alias -- '-'='cd "$OLDPWD"'

alias   ..='cd ..'
alias  ...='cd ../..'
alias ....='cd ../../..'

alias     cs='cd "$CS_DIR"'
alias    bst='cd "$BDOTDIR"'
alias  shell='cd "$SHELL_DIR"'
alias config='cd "$XDG_CONFIG_HOME"'

# —— Other Conveneince Aliases —————————————————————————————————————————————— #

alias  w='uptime; command w | gtail -n +2 | column -t'
alias rc="echo -n $'\e[5 q'"
alias wh='type -a'

# ——————————————————————————————————————————————————————————————————————————— #
