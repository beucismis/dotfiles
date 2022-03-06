# ~/.bashrc: executed by bash(1) for non-login shells.

[[ $- != *i* ]] && return

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

[[ -n "$PS1" ]] && source ~/.bash_profile

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
fi

[[ -n "$PS1" ]] && source ~/.bash_export