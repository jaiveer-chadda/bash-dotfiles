#!/usr/bin/env bash

# PATH.sh
# ~/.config/bash/functions/config/PATH.sh

bashrc::path::join () { local -r IFS="$1"; shift; echo "$*"; }

bashrc::path() {
  local -r apple_codex='/var/run/com.apple.security.cryptexd/codex.system'

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

    "$apple_codex/bootstrap/usr/"{{local,appleinternal}/,}bin

    "$HOME/Desktop/CS/bin"
  )

  export PATH
  PATH="$( bashrc::path::join ':' "${path[@]}" )"
}

bashrc::path "$@"
unset -f bashrc::path bashrc::path::join

# spell:ignore cryptexd
