#!/bin/bash

checkupdates --nocolor | {
  readarray -t packages
  count=${#packages[@]}
  list=$(printf '%s\\n' "${packages[@]}") 
  printf '{"text": %d, "tooltip": "Packages:\\n\\n%s"}' "$count" "$list"
}
