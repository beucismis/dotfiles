#!/bin/bash

# Defaults
alias df="df -H"
alias du="du -ch"
alias mkdir="mkdir -pv"

# Shortcuts
alias g="git"
alias s="sudo"
alias c="clear"
alias rr="rm -rf"
alias untar="tar -zxvf "

# Directory Traversal/Listing
alias ..="cd .."
alias -- -="cd -"
alias ...="cd ../.."
alias ....="cd ../../.."
alias l="ls -la"
alias ld="ls -ld */"
alias ls="ls --color=auto"

# Package Managers
alias apt="sudo nala" # https://github.com/volitank/nala
alias upup="sudo nala update && sudo nala upgrade -y && sudo apt autoremove"
alias pip3-upgrade="/usr/bin/python3 -m pip install --upgrade pip"

# Others
alias reload="source ~/.bashrc"
alias tint2-restart="killall -SIGUSR1 tint2"