#!/usr/bin/env bash

# util_functions.sh
# ~/.config/bash/functions/util_functions.sh

# ——————————————————————————————————————————————————————————————————————————— #

# shellcheck disable=SC2154

# ——————————————————————————————————————————————————————————————————————————— #

err_no () { echo $?                ; }; alias  err=err_no
nope   () { echo $'\e[31mno \e[0m' ; }; alias   no=nope
yep    () { echo $'\e[32myes\e[0m' ; }; alias   ye=yep
goto_f () { cd   "${*%/*}" || :    ; }; alias    g=goto_f
vscode () { code "${@:-$PWD}"      ; }; alias    v=vscode
open_h () { open "${@:-$PWD}"      ; }; alias    o=open_h
empty  () { truncate -s 0 "${1?}"  ; }; alias    0=empty

path   () { printf $'%s\n' "${path[@]//$HOME/~}"                   ; }
random () { echo $(( 16#$( head /dev/random | xxd -p -l1 ) ))      ; }
inode  () { while (( 1 )); do ls -i "${1?}"; sleep "${2:-2}"; done ; }

clear_half() {
  local -i i half_height=$(( LINES / 2 ))
  for (( i=0; i<half_height; i++ )); do echo; done
  echo $'\e['"$(( half_height + 2 ))A"
}

# spell:ignoreRegExp /\\e\[[0-9;]+?m\B/g
