# ~/.bashrc: executed by bash(1) for non-login shells.

[[ $- != *i* ]] && return

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

PS1="\[\e[0m\][\[\e[0m\]\@\[\e[0m\]] \[\e[0m\][\[\e[0m\]\u\[\e[0m\]@\[\e[0m\]\h\[\e[0m\]:\[\e[0m\]\w\[\e[0m\]\w\[\e[0m\]]\n\[\e[0m\]$ \[\e[0m\]"