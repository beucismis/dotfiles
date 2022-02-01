#!/bin/bash

# Defaults

alias df="df -H"
alias du="du -ch"
alias mkdir="mkdir -pv"

# Shortcuts

alias g="git"
alias _="sudo"
alias c="clear"
alias rr="rm -rf"
alias untar="tar -zxvf "

# Directory listing/traversal

alias l="ls -la"
alias ld="ls -ld */"
alias ls="ls --color=auto"

alias ..="cd .."
alias -- -="cd -"
alias ...="cd ../.."
alias ....="cd ../../.."

# Package managers

alias apt="sudo apt"
alias update="sudo apt update && sudo apt upgrade"
alias pip3-update="/usr/bin/python3 -m pip install --upgrade pip"

# Others

alias reload="source ~/.bash_profile"
alias tint2-restart="killall -SIGUSR1 tint2"
