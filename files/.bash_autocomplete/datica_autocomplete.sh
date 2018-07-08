#!/usr/bin/env bash

_commands() {
  datica $@ --help 2>&1 | awk '/^Commands:/ {start=1; next} start==1 && !/^$/ {print $1} $1 ~ /^$/ {start=0}'
}

_datica_autocomplete() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[*]:1:$COMP_CWORD-1}"
  opts="$(_commands "$prev")"
  COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
  return 0
}

complete -F _datica_autocomplete datica
