#!/usr/bin/env bash

# .bashrc
# ~/.config/bash/.bashrc

# — Shell Setup ————————————————————————————————————————————————————————————— #

export {SHELL,BASH}="$( which bash )"

# — XDG Base Directory Specification ———————————————————————————————————————— #

export -r XDG_CONFIG_HOME="$HOME/.config"
export -r  XDG_CACHE_HOME="$HOME/.cache"
export -r  XDG_STATE_HOME="$HOME/.local/state"
export -r   XDG_DATA_HOME="$HOME/.local/share"
export -r   XDG_DATA_DIRS='/usr/local/share/:/usr/share/'

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

# — Personal Variables —————————————————————————————————————————————————————— #

export PROMPT_COMMAND='_set_ps1'  # runs before every prompt

# — Filepaths ——————————————————————————————————————————————————————————————— #

export CS{_DIR,}="$HOME/CS"
export SHELL_DIR="$CS/Shellscript"

export {BDOTDIR,BASH_SETTINGS_DIR}="$CONFIG/bash"
export BASH_FUNCTIONS="$BDOTDIR/functions"

# —— Set Options ———————————————————————————————————————————————————————————— #

shopt -s cdspell       # allows spelling mistakes during cd
shopt -s checkwinsize  # enables $COLUMNS / $LINES in non-interactive sessions
shopt -s extglob       # turns on extended glob
shopt -s autocd        # allows cd-ing to `/path/to/dir` without using `cd`
shopt -s dirspell      # corrects spelling during globbing

# —— Source All Config Files ———————————————————————————————————————————————— #

# shellcheck disable=SC1090
for file in "$BASH_FUNCTIONS"/**/*; do source "$file"; done

# ——————————————————————————————————————————————————————————————————————————— #
