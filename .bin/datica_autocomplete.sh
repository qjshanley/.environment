#! /bin/bash

_commands() {
  datica --help 2>&1 | awk '/^Commands:/ {start=1; next} start==1 && !/^$/ {print $1} $1 ~ /^$/ {start=0}'
}

_datica_autocomplete() {
     local cur prev opts base
     COMPREPLY=()
     cur="${COMP_WORDS[COMP_CWORD]}"
     #prev="${COMP_WORDS[COMP_CWORD-1]}"
     opts="$(_commands)"
     COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
     return 0
 }

 complete -F _datica_autocomplete datica
