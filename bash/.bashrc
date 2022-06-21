# ~/.bashrc: executed by bash(1) for non-login shells.

[ -z "$PS1" ] && return
[ -n "$PS1" ] && source ~/.bash_profile;

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac