#!/usr/bin/env bash

# nvim.sh
# ~/.config/bash/functions/intercepts/nvim.sh

intercept::nvim() {
  command nvim "$@"
  echo -n $'\e[5 q'

  if [[ "$TERM_PROGRAM" == 'iTerm2.app' ]]; then
    echo -n $'\e]1337;CursorShape=1\a'
  fi
}

# shellcheck disable=SC2139
alias nv{im,}='intercept::nvim'
