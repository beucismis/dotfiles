#!/bin/bash

# Shortcuts

alias g="git"
alias _="sudo"
alias c="clear"
alias rr="rm -rf"

# Directory listing/traversal

alias l="ls -la"
alias ld="ls -ld */"
alias ls="ls --color=auto"

alias ..="cd .."
alias -- -="cd -"
alias ...="cd ../.."
alias ....="cd ../../.."

# Others

alias reload="source ~/.bash_profile"
alias tint2reload="killall -SIGUSR1 tint2"

# Scripts

cpu_load () {
    top -bn1 | grep load | awk '{printf "CPU Load: %.2f\n", $(NF-2)}'
}

memory_usage () {
    free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'
}

disk_usage () {
    df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}'
}