#!/usr/bin/env bash

# path.sh
# ~/.config/bash/functions/extensions/path.sh

# shellcheck disable=SC2154

path() {
  printf $'%s\n' "${path[@]//$HOME/~}"
}
