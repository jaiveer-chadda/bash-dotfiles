#!/usr/bin/env bash

# prompt.sh
# ~/.config/bash/functions/config/prompt.sh

function _set_ps1 () {

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
