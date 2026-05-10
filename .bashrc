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
export EDITOR='nvim'
export PAGER='less'

# — External Function Variables ————————————————————————————————————————————— #

export {HOMEBREW_{PREFIX,REPOSITORY},BREW}='/opt/homebrew'
export HOMEBREW_CELLAR="$BREW/Cellar"

# — Filepaths Variables ————————————————————————————————————————————————————— #

export CS{_DIR,}="$HOME/CS"
export SHELL_DIR="$CS/Shellscript"

export {BDOTDIR,BASH_SETTINGS_DIR}="$CONFIG/bash"
export BASHRC="$BDOTDIR/.bashrc"
export BASH_FUNCTIONS="$BDOTDIR/functions"

# — Personal Settings ——————————————————————————————————————————————————————— #

alias  bash='bash --rcfile "$BASHRC"'
export PROMPT_COMMAND='_set_ps1'  # runs before every prompt

# —— Set Options ———————————————————————————————————————————————————————————— #

shopt -s cdspell       # allows spelling mistakes during cd
shopt -s checkwinsize  # enables $COLUMNS / $LINES in non-interactive sessions
shopt -s extglob       # turns on extended glob
shopt -s autocd        # allows cd-ing to `/path/to/dir` without using `cd`
shopt -s dirspell      # corrects spelling during globbing

# —— Source All Config Files ———————————————————————————————————————————————— #

# shellcheck disable=SC1090
for file in "$BASH_FUNCTIONS"/**/*.sh; do source "$file"; done

# ——————————————————————————————————————————————————————————————————————————— #
